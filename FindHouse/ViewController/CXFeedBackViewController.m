//
//  CXFeedBackViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/14.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXFeedBackViewController.h"
#import "UIPlaceHolderTextView.h"

@interface CXFeedBackViewController ()

@property(nonatomic,retain)UIPlaceHolderTextView *feedView;

@property(nonatomic,retain)UIButton *submitButton;

@end

@implementation CXFeedBackViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"意见反馈";
    
    [self.view addSubview:self.feedView];
    [self.view addSubview:self.submitButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (UIPlaceHolderTextView *)feedView
{
    if (!_feedView)
    {
        _feedView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 200)];
        _feedView.backgroundColor = CX_WhiteColor;
        _feedView.font = FontSize(14);
        _feedView.textColor = CX_BlackColor;
        _feedView.placeholder = @"您的意见或建议";
    }
    
    return _feedView;
}

- (UIButton *)submitButton
{
    if (!_submitButton)
    {
        _submitButton = [[UIButton alloc] initWithFrame:CGRectMake(ViewMargin_10*3, self.feedView.viewDistanceY+ViewMargin_10*3, Screen_Width-ViewMargin_10*6, 45)];
        _submitButton.backgroundColor = CX_ThemeGreenColor;
        _submitButton.titleLabel.font = FontSize(15);
        _submitButton.layer.cornerRadius = _submitButton.viewSizeHeight/2;
        [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_submitButton setTitleColor:CX_WhiteColor forState:UIControlStateNormal];
    }
    
    return _submitButton;
}

@end
