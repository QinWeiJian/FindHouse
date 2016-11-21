//
//  CXContactSecretaryView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/21.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXContactSecretaryView.h"

@interface CXContactSecretaryView ()

@property(nonatomic,retain)UIControl *bgControl;

@property(nonatomic,retain)CXBaseView *alertView;
@property(nonatomic,retain)UIButton *deleteButton;
@property(nonatomic,retain)CXBaseImageView *headImageView;
@property(nonatomic,retain)CXBaseLabel *nameLabel;
@property(nonatomic,retain)CXBaseLabel *introductionLabel;
@property(nonatomic,retain)UIButton *phoneButton;
@property(nonatomic,retain)UIButton *onlineButton;

@end

@implementation CXContactSecretaryView

- (id)init
{
    if (self = [super init])
    {
        UIWindow *keyWindow = [[UIApplication sharedApplication].windows lastObject];
        self.frame = keyWindow.bounds;
        [keyWindow addSubview:self];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.hidden = YES;
        
        [self createSubViews];
        [self layoutSubFrames];
    }
    
    return self;
}

- (void)createSubViews
{
    [self addSubview:self.bgControl];
    [self addSubview:self.alertView];
    [self.alertView addSubview:self.deleteButton];
    [self.alertView addSubview:self.headImageView];
    [self.alertView addSubview:self.nameLabel];
    [self.alertView addSubview:self.introductionLabel];
    [self.alertView addSubview:self.phoneButton];
    [self.alertView addSubview:self.onlineButton];
}

- (void)layoutSubFrames
{
    CGRect introductionRect = [self.introductionLabel.text cx_boundsWithFont:self.introductionLabel.font BounceSize:CGSizeMake(self.introductionLabel.viewSizeWidth, 200)];
    self.introductionLabel.height = introductionRect.size.height+ViewMargin_Double_10;
    
    self.phoneButton.y = self.introductionLabel.viewDistanceY+ViewMargin_10;
    self.onlineButton.y = self.phoneButton.viewOriginY;
    
    self.alertView.height = self.phoneButton.viewDistanceY;
    self.alertView.center = self.center;
    
    [self.alertView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(0, self.phoneButton.y) endPosition:CGPointMake(self.alertView.width, self.phoneButton.y) LineWidth:0.5]];
    [self.alertView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(self.alertView.width/2, self.phoneButton.y) endPosition:CGPointMake(self.alertView.width/2, self.alertView.height) LineWidth:0.5]];
}

- (void)show
{
    WS(weakSelf);
    
    self.hidden = NO;
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.bgControl.alpha = 0.4;
        weakSelf.alertView.alpha = 1;
    }];
}

- (void)hide
{
    WS(weakSelf);
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.bgControl.alpha = 0;
        weakSelf.alertView.alpha = 0;
    }completion:^(BOOL finished) {
        if (finished)
        {
            weakSelf.hidden = YES;
//            [weakSelf removeFromSuperview];
        }
    }];
}

#pragma mark - Getter

- (UIControl *)bgControl
{
    if (!_bgControl)
    {
        _bgControl = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeWidth, self.viewSizeHeight)];
        _bgControl.backgroundColor = [UIColor blackColor];
        _bgControl.alpha = 0;
        [_bgControl addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _bgControl;
}

- (CXBaseView *)alertView
{
    if (!_alertView)
    {
        _alertView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeWidth-ViewMargin_10, 0)];
        _alertView.alpha = 0;
        _alertView.layer.cornerRadius = 5;
    }
    
    return _alertView;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton)
    {
        _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(self.alertView.viewSizeWidth-30, 0, 30, 30)];
        [_deleteButton setImage:ImageWithNamed(@"alert_close") forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _deleteButton;
}

- (CXBaseImageView *)headImageView
{
    if (!_headImageView)
    {
        _headImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(self.alertView.viewSizeWidth/2 - 50/2, self.deleteButton.viewDistanceY, 50, 50)];
        _headImageView.layer.cornerRadius = _headImageView.viewSizeHeight/2;
        _headImageView.backgroundColor = [UIColor blackColor];
    }
    
    return _headImageView;
}

- (CXBaseLabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.headImageView.viewDistanceY, self.alertView.viewSizeWidth-ViewMargin_Double_10, 40)];
        _nameLabel.font = FontSize(15);
        _nameLabel.textAlignment = 1;
        _nameLabel.text = @"王尼玛";
    }
    
    return _nameLabel;
}

- (CXBaseLabel *)introductionLabel
{
    if (!_introductionLabel)
    {
        _introductionLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.nameLabel.viewDistanceY, self.alertView.viewSizeWidth-ViewMargin_Double_10, 0)];
        _introductionLabel.font = FontSize(12);
        _introductionLabel.numberOfLines = 0;
        _introductionLabel.text = @"小米找房小米找房小米找房小米找房小米找房小米找房小米找房小米找房小米找房小米找房小米找房小米找房小米找房小米找房";
    }
    
    return _introductionLabel;
}

- (UIButton *)phoneButton
{
    if (!_phoneButton)
    {
        _phoneButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.alertView.viewSizeWidth/2, 50)];
        _phoneButton.titleLabel.font = FontSize(15);
        [_phoneButton setTitle:@"  13800138000" forState:UIControlStateNormal];
        [_phoneButton setTitleColor:CX_ThemeGreenColor forState:UIControlStateNormal];
        [_phoneButton setImage:ImageWithNamed(@"house_contact_phone_solid") forState:UIControlStateNormal];
    }
    
    return _phoneButton;
}

- (UIButton *)onlineButton
{
    if (!_onlineButton)
    {
        _onlineButton = [[UIButton alloc] initWithFrame:CGRectMake(self.phoneButton.viewDistanceX, 0, self.phoneButton.viewSizeWidth, self.phoneButton.viewSizeHeight)];
        _onlineButton.titleLabel.font = FontSize(15);
        [_onlineButton setTitle:@"  在线咨询" forState:UIControlStateNormal];
        [_onlineButton setTitleColor:CX_BlackColor forState:UIControlStateNormal];
        [_onlineButton setImage:ImageWithNamed(@"house_contact_online_solid") forState:UIControlStateNormal];
    }
    
    return _onlineButton;
}

@end
