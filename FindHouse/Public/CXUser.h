//
//  CXUser.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXUserInfoDataModel.h"

@interface CXUser : NSObject

+ (CXUser *)currentUser;

/**用户信息*/
@property(nonatomic,retain)CXUserInfoDataModel *userInfo;

/**归档用户信息*/
- (void)saveUserInfoToArchiver;

/**解档用户信息*/
- (void)getUserInfoFromArchiver;

/**获取登陆状态*/
- (BOOL)getUserLoginState;

/**设置用户登陆状态*/
- (void)setUserLoginState:(BOOL)state;

@end
