//
//  CXLoginViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXLoginViewController.h"

#define BannerHeight (5*Screen_Width)/9

@interface CXLoginViewController ()

@property(nonatomic,retain)TPKeyboardAvoidingScrollView *bgView;

@property(nonatomic,retain)UIButton *backButton;

@property(nonatomic,retain)CXBaseImageView *headImageView;

@end

@implementation CXLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.bgView];
    
    [self.bgView addSubview:self.headImageView];
    [self.bgView addSubview:self.backButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (TPKeyboardAvoidingScrollView *)bgView
{
    if (!_bgView)
    {
        _bgView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
        _bgView.showsVerticalScrollIndicator = NO;
    }
    
    return _bgView;
}

- (UIButton *)backButton
{
    if (!_backButton)
    {
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, StatusBarHeight, NavigationBarHeight, NavigationBarHeight)];
        [_backButton setImage:ImageWithNamed(@"navigationBar_back") forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backButton;
}

- (CXBaseImageView *)headImageView
{
    if (!_headImageView)
    {
        _headImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Height, BannerHeight)];
        _headImageView.backgroundColor = CX_BlackColor;
    }
    
    return _headImageView;
}

#pragma mark - Action

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
