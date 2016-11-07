//
//  CXBaseNavigationController.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseNavigationController.h"

@interface CXBaseNavigationController ()

@end

@implementation CXBaseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationBar.barTintColor = CX_ThemeGreenColor;
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationBar.translucent = NO;
    
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
