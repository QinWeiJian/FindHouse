//
//  CXLoginViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXLoginViewController.h"
#import "CXLoginInputView.h"

#define BannerHeight (5*Screen_Width)/9

@interface CXLoginViewController ()

@property(nonatomic,retain)TPKeyboardAvoidingScrollView *bgView;

@property(nonatomic,retain)UIButton *backButton;

@property(nonatomic,retain)CXBaseImageView *headImageView;

@property(nonatomic,retain)CXLoginInputView *phoneView;

@property(nonatomic,retain)CXLoginInputView *verifyCodeView;

@property(nonatomic,retain)CXBaseLabel *protocolLabel;

@property(nonatomic,retain)UIButton *loginButton;

@end

@implementation CXLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.backButton];
    
    [self.bgView addSubview:self.headImageView];
    [self.bgView addSubview:self.phoneView];
    [self.bgView addSubview:self.verifyCodeView];
    [self.bgView addSubview:self.protocolLabel];
    [self.bgView addSubview:self.loginButton];
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
        _bgView.backgroundColor = CX_WhiteColor;
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

- (CXLoginInputView *)phoneView
{
    if (!_phoneView)
    {
        _phoneView = [[CXLoginInputView alloc] initWithFrame:CGRectMake(ViewMargin_10*3, self.headImageView.viewDistanceY+ViewMargin_10*3, Screen_Width-ViewMargin_10*6, 45) tapImage:ImageWithNamed(@"login_phone") placeholder:@"手机号" needCode:NO];
        _phoneView.inputField.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    return _phoneView;
}

- (CXLoginInputView *)verifyCodeView
{
    if (!_verifyCodeView)
    {
        _verifyCodeView = [[CXLoginInputView alloc] initWithFrame:CGRectMake(self.phoneView.viewOriginX, self.phoneView.viewDistanceY+ViewMargin_Double_10, self.phoneView.viewSizeWidth, self.phoneView.viewSizeHeight) tapImage:ImageWithNamed(@"login_veriftCode") placeholder:@"验证码" needCode:YES];
    }
    
    return _verifyCodeView;
}

- (CXBaseLabel *)protocolLabel
{
    if (!_protocolLabel)
    {
        _protocolLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.verifyCodeView.viewDistanceY+ViewMargin_10, Screen_Width-ViewMargin_Double_10, 30)];
        _protocolLabel.font = FontSize(13);
        _protocolLabel.textAlignment = 1;
        _protocolLabel.text = @"登录即表示您已阅读并同意《用户注册条款》";
        
        _protocolLabel.attributedText = [_protocolLabel.text cx_changeTextColorWithReplaceString:@"《用户注册条款》" ChangeColor:CX_BlueColor ChangeFont:_protocolLabel.font];
    }
    
    return _protocolLabel;
}

- (UIButton *)loginButton
{
    if (!_loginButton)
    {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(self.phoneView.viewOriginX, self.protocolLabel.viewDistanceY+ViewMargin_10, self.phoneView.viewSizeWidth, self.phoneView.viewSizeHeight)];
        _loginButton.backgroundColor = CX_ThemeGreenColor;
        _loginButton.titleLabel.font = FontSize(14);
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:CX_WhiteColor forState:UIControlStateNormal];
    }
    
    return _loginButton;
}

#pragma mark - Action

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
