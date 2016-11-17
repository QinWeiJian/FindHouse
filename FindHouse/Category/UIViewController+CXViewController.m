//
//  UIViewController+CXViewController.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "UIViewController+CXViewController.h"

@implementation UIViewController (CXViewController)

/**展示加载*/
- (void)cx_showHubInView:(UIView *)view
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.opacity = 1;
    //    hud.activityIndicatorColor = cx_BlackColor;
//    hud.color = [UIColor clearColor];
    [view addSubview:hud];
    [hud show:YES];
}

/**展示加载*/
- (void)cx_showHubInView:(UIView *)view showText:(NSString *)showText
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.opacity = 1;
    hud.labelFont = FontSize(14);
    hud.labelText = showText;
    [view addSubview:hud];
    [hud show:YES];
}

/**隐藏加载*/
- (void)cx_hideHubForView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

/**提示框*/
- (void)cx_showAlertViewWithMessage:(NSString *)message
{
    //    UIWindow *keyWindow = [[UIApplication sharedApplication].windows lastObject];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    //    CGSize messageSize = [message sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12],NSFontAttributeName, nil]];
    
    CGRect messageRect = [message cx_boundsWithFont:[UIFont systemFontOfSize:14] BounceSize:CGSizeMake(Screen_Width-80, MAXFLOAT)];
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(Screen_Width/2-(messageRect.size.width+40)/2,Screen_Height/2-(messageRect.size.height+40)/2, messageRect.size.width+40, messageRect.size.height+40)];
    messageLabel.backgroundColor = [UIColor blackColor];
    messageLabel.alpha = 0;
    messageLabel.textAlignment = 1;
    messageLabel.numberOfLines = 0;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.font = [UIFont boldSystemFontOfSize:14];
    messageLabel.layer.cornerRadius = 10;
    messageLabel.layer.masksToBounds = YES;
    messageLabel.text = message;
    [keyWindow addSubview:messageLabel];
    
    [UIView animateWithDuration:1 animations:^{
        messageLabel.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            messageLabel.alpha = 0;
        } completion:^(BOOL finished) {
            [messageLabel removeFromSuperview];
        }];
    }];
}

/**MJRefresh Header*/
- (CXRefreshHeader *)cx_getMJRefreshNormalHeaderWithTarget:(id)target refreshingAction:(SEL)action
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    CXRefreshHeader *header = [CXRefreshHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    return header;
}

- (MJRefreshBackNormalFooter *)cx_getMJRefreshAutoNormalFooterWithTarget:(id)target refreshingAction:(SEL)action
{
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    
    return footer;
}

- (void)cx_goLoginVC
{
//    CXLoginViewController *loginVC = [[CXLoginViewController alloc] init];
//    loginVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:loginVC animated:YES];
}

@end
