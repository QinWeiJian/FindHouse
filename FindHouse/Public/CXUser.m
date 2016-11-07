//
//  CXUser.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXUser.h"

static  CXUser *currentUser = nil;

@implementation CXUser

+ (CXUser *)currentUser
{
    @synchronized(self)
    {
        if (currentUser == nil)
        {
            currentUser = [[self alloc] init];
        }
    }
    
    return currentUser;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (currentUser == nil)
        {
            currentUser = [[super allocWithZone:zone] init];
        }
    }
    
    return currentUser;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

#pragma mark - 归档用户信息

/**获取用户验证数据数据持久化路径*/
- (NSString *)getUserInfoArchiverFilePath
{
    NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[array objectAtIndex:0] stringByAppendingPathComponent:@"CXUserInfo.data"];
}

/**归档用户信息*/
- (void)saveUserInfoToArchiver
{
    [NSKeyedArchiver archiveRootObject:[CXUser currentUser].userInfo toFile:[[CXUser currentUser] getUserInfoArchiverFilePath]];
}

/**解档用户信息*/
- (void)getUserInfoFromArchiver
{
    [CXUser currentUser].userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:[[CXUser currentUser] getUserInfoArchiverFilePath]];
}

#pragma mark - 登录状态

/**获取登陆状态*/
- (BOOL)getUserLoginState
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:CX_LoginState_Default];
}

/**设置用户登陆状态*/
- (void)setUserLoginState:(BOOL)state
{
    [[NSUserDefaults standardUserDefaults] setBool:state forKey:CX_LoginState_Default];
}

@end