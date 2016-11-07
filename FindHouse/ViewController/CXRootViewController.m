//
//  CXRootViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXRootViewController.h"
#import "CXHomeViewController.h"
#import "CXMessageViewController.h"
#import "CXMineViewController.h"

@interface CXRootViewController ()

@end

@implementation CXRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor = CX_ThemeGreenColor;
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;
    
    [self createVCS];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)createVCS
{
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    CXHomeViewController *homeVC = [[CXHomeViewController alloc] init];
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabbar_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    homeVC.tabBarItem = homeItem;
    CXBaseNavigationController *homeNav = [[CXBaseNavigationController alloc] initWithRootViewController:homeVC];
    [viewControllers addObject:homeNav];
    
    CXMessageViewController *messageVC = [[CXMessageViewController alloc] init];
    UITabBarItem *messageItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[[UIImage imageNamed:@"tabbar_message_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_message_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    messageVC.tabBarItem = messageItem;
    CXBaseNavigationController *messageNav = [[CXBaseNavigationController alloc] initWithRootViewController:messageVC];
    [viewControllers addObject:messageNav];
    
    CXMineViewController *mineVC = [[CXMineViewController alloc] init];
    UITabBarItem *mineItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabbar_mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineVC.tabBarItem = mineItem;
    CXBaseNavigationController *serviceNav = [[CXBaseNavigationController alloc] initWithRootViewController:mineVC];
    [viewControllers addObject:serviceNav];
    
    self.viewControllers = viewControllers;
}

@end
