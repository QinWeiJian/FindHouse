//
//  CXSettingViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/14.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSettingViewController.h"
#import "CXSwitchCellView.h"
#import "CXDetailLabelCellView.h"

#define CellHeight 45

@interface CXSettingViewController ()

@property(nonatomic,retain)CXSwitchCellView *messageSwitchView;
@property(nonatomic,retain)CXDetailLabelCellView *cacheView;
@property(nonatomic,retain)UIButton *logoutButton;

@end

@implementation CXSettingViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self.view addSubview:self.messageSwitchView];
    [self.view addSubview:self.cacheView];
    [self.view addSubview:self.logoutButton];
    
    [self.view.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(ViewMargin_10, self.messageSwitchView.viewDistanceY) endPosition:CGPointMake(Screen_Width, self.messageSwitchView.viewDistanceY) LineWidth:0.5]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (CXSwitchCellView *)messageSwitchView
{
    if (!_messageSwitchView)
    {
        _messageSwitchView = [[CXSwitchCellView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, CellHeight)];
        _messageSwitchView.titleLabel.text = @"消息开关";
    }
    
    return _messageSwitchView;
}

- (CXDetailLabelCellView *)cacheView
{
    if (!_cacheView)
    {
        _cacheView = [[CXDetailLabelCellView alloc] initWithFrame:CGRectMake(0, self.messageSwitchView.viewDistanceY, Screen_Width, CellHeight)];
        _cacheView.titleLabel.text = @"清除缓存";
        _cacheView.detailLabel.text = @"1M";
    }
    
    return _cacheView;
}

- (UIButton *)logoutButton
{
    if (!_logoutButton)
    {
        _logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(ViewMargin_10*3, self.cacheView.viewDistanceY+ViewMargin_10*3, Screen_Width-ViewMargin_10*6, CellHeight)];
        _logoutButton.backgroundColor = CX_RedColor;
        _logoutButton.titleLabel.font = FontSize(15);
        _logoutButton.layer.cornerRadius = _logoutButton.viewSizeHeight/2;
        [_logoutButton setTitle:@"退出" forState:UIControlStateNormal];
        [_logoutButton setTitleColor:CX_WhiteColor forState:UIControlStateNormal];
    }
    
    return _logoutButton;
}

@end
