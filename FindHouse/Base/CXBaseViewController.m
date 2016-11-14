//
//  CXBaseViewController.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseViewController.h"

@interface CXBaseViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation CXBaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.delegate = self;
    if (self.navigationController.viewControllers.count == 1) {
        self.tabBarController.tabBar.hidden = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    self.navigationController.delegate = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = CX_BackgroundColor;
    self.view.userInteractionEnabled = YES;
    self.navigationItem.backBarButtonItem.title = @"";
    
    self.navigationItem.leftBarButtonItem = self.backItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Getter

- (UIBarButtonItem *)backItem
{
    if (!_backItem)
    {
        _backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationBar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backItemAction)];
    }
    
    return _backItem;
}

#pragma mark - Action

- (void)backItemAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate 在根视图时不响应interactivePopGestureRecognizer手势

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1)
        return NO;
    else
        return YES;
}

#pragma mark - navigationDelegate 实现此代理方法也是为防止滑动返回时界面卡死

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //开启滑动手势
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    [otherGestureRecognizer requireGestureRecognizerToFail:gestureRecognizer];
    return NO;
}

@end
