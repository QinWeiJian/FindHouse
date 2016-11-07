//
//  CXProcessDataTool.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXProcessDataTool.h"

@implementation CXProcessDataTool

/**处理登录信息*/
+ (void)cx_processLoginMessageWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *resultDict = [dictionary objectForKey:@"result"];
    
    CXUserInfoDataModel *dataModel = [[CXUserInfoDataModel alloc] init];
    
    dataModel.userID = [NSString stringWithFormat:@"%@",[resultDict objectForKey:@"id"]];
    
    [dataModel setValuesForKeysWithDictionary:resultDict];
    
    [CXUser currentUser].userInfo = dataModel;
    
    [[CXUser currentUser] setUserLoginState:YES];
    
    [[CXUser currentUser] saveUserInfoToArchiver];
}

/**处理自动登陆信息*/
+ (void)cx_processAutoLoginMessage
{
    [[CXUser currentUser] getUserInfoFromArchiver];
}

/**处理退出登录*/
+ (void)cx_processLogout
{
    [[CXUser currentUser] setUserLoginState:NO];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CX_LoginStateChange_Notification object:nil];
}

@end
