//
//  UIViewController+CXViewController.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CXRefreshHeader.h"
#import <MJRefreshAutoNormalFooter.h>
#import <MJRefreshBackNormalFooter.h>
#import <MBProgressHUD.h>

@interface UIViewController (CXViewController)

/**展示加载*/
- (void)cx_showHubInView:(UIView *)view;

/**展示加载*/
- (void)cx_showHubInView:(UIView *)view showText:(NSString *)showText;

/**隐藏加载*/
- (void)cx_hideHubForView:(UIView *)view;

/**提示框*/
- (void)cx_showAlertViewWithMessage:(NSString *)message;

/**MJRefresh Header*/
- (CXRefreshHeader *)cx_getMJRefreshNormalHeaderWithTarget:(id)target refreshingAction:(SEL)action;

/**MJRefresh Footer*/
- (MJRefreshBackNormalFooter *)cx_getMJRefreshAutoNormalFooterWithTarget:(id)target refreshingAction:(SEL)action;

- (void)cx_goLoginVC;

@end
