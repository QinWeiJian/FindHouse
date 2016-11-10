//
//  CXLoginInputView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXLoginInputView.h"

@implementation CXLoginInputView

- (id)initWithFrame:(CGRect)frame tapImage:(UIImage *)tapImage placeholder:(NSString *)placeholder needCode:(BOOL)needCode
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = CX_BackgroundColor;
        
        self.needCode = needCode;
        
        self.tapImageView.image = tapImage;
        
        self.inputField.placeholder = placeholder;
        
        [self addSubview:self.tapImageView];
        [self addSubview:self.inputField];
        
        if (needCode)
        {
            [self addSubview:self.codeButton];
        }
        
        [self layoutSubFrames];
    }
    
    return self;
}

- (void)layoutSubFrames
{
    if (self.needCode)
    {
        self.codeButton.frame = CGRectMake(self.viewSizeWidth-ViewMargin_10-100, 0, 100, self.viewSizeHeight);
        
        self.inputField.frame = CGRectMake(self.tapImageView.viewDistanceX, 0, self.codeButton.viewOriginX-self.tapImageView.viewDistanceX-ViewMargin_10, self.viewSizeHeight);
    }else
    {
        self.inputField.frame = CGRectMake(self.tapImageView.viewDistanceX, 0, self.viewSizeWidth-self.tapImageView.viewDistanceX-ViewMargin_10, self.viewSizeHeight);
    }
}

#pragma mark - Getter

- (CXBaseImageView *)tapImageView
{
    if (!_tapImageView)
    {
        _tapImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeHeight, self.viewSizeHeight)];
    }
    
    return _tapImageView;
}

- (CXInsetsField *)inputField
{
    if (!_inputField)
    {
        _inputField = [[CXInsetsField alloc] initWithFrame:CGRectZero margin:0];
    }
    
    return _inputField;
}

- (UIButton *)codeButton
{
    if (!_codeButton)
    {
        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _codeButton.titleLabel.font = FontSize(14);
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_codeButton setTitleColor:CX_RedColor forState:UIControlStateNormal];
    }
    
    return _codeButton;
}

@end
