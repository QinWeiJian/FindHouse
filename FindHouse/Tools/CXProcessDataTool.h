//
//  CXProcessDataTool.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXProcessDataTool : NSObject

/**处理登录信息*/
+ (void)cx_processLoginMessageWithDictionary:(NSDictionary *)dictionary;

/**处理自动登陆信息*/
+ (void)cx_processAutoLoginMessage;

/**处理退出登录*/
+ (void)cx_processLogout;

@end
