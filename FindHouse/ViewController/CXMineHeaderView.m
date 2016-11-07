//
//  CXMineHeaderView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXMineHeaderView.h"

#define CellHeight (5*Screen_Width)/9

@implementation CXMineHeaderView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.contentMode = UIViewContentModeScaleAspectFill;
        
        [self addSubview:self.headImageView];
        [self addSubview:self.phoneLabel];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseImageView *)headImageView
{
    if (!_headImageView)
    {
        _headImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(Screen_Width/2-50/2, CellHeight/2-50/2, 50, 50)];
        _headImageView.layer.cornerRadius = _headImageView.viewSizeHeight/2;
        _headImageView.layer.masksToBounds = YES;
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _headImageView.image = ImageWithNamed(@"home_secretary");
    }
    
    return _headImageView;
}

- (CXBaseLabel *)phoneLabel
{
    if (!_phoneLabel)
    {
        _phoneLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.headImageView.viewDistanceY+ViewMargin_Double_10, Screen_Width-ViewMargin_Double_10, 30)];
        _phoneLabel.textColor = CX_WhiteColor;
        _phoneLabel.text = @"13800138000";
        _phoneLabel.font = FontSize(15);
        _phoneLabel.textAlignment = 1;
    }
    
    return _phoneLabel;
}

@end
