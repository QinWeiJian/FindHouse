//
//  CXHomeNavigationBarView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHomeNavigationBarView.h"

@implementation CXHomeNavigationBarView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.backgroundView];
        
        [self addSubview:self.locateView];
        [self addSubview:self.locateImageView];
        [self addSubview:self.locateLabel];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseView *)backgroundView
{
    if (!_backgroundView)
    {
        _backgroundView = [[CXBaseView alloc] initWithFrame:self.bounds];
        _backgroundView.backgroundColor = CX_ThemeGreenColor;
        _backgroundView.alpha = 0;
    }
    
    return _backgroundView;
}

- (CXBaseView *)locateView
{
    if (!_locateView)
    {
        _locateView = [[CXBaseView alloc] initWithFrame:CGRectMake(ViewMargin_10, StatusBarHeight+ViewMargin_10, ImageWithNamed(@"navigationBar_location").size.width+40+ViewMargin_5*3, NavigationBarHeight-ViewMargin_Double_10)];
        _locateView.layer.cornerRadius = _locateView.viewSizeHeight/2;
        _locateView.layer.masksToBounds = YES;
        _locateView.backgroundColor = [UIColor blackColor];
        _locateView.alpha = 0.5;
    }
    
    return _locateView;
}

- (CXBaseImageView *)locateImageView
{
    if (!_locateImageView)
    {
        _locateImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(ViewMargin_10+ViewMargin_5, StatusBarHeight+ViewMargin_10, ImageWithNamed(@"navigationBar_location").size.width, self.locateView.viewSizeHeight)];
        _locateImageView.image = ImageWithNamed(@"navigationBar_location");
    }
    
    return _locateImageView;
}

- (CXBaseLabel *)locateLabel
{
    if (!_locateLabel)
    {
        _locateLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.locateImageView.viewDistanceX+ViewMargin_5, self.locateImageView.viewOriginY, 40, self.locateView.viewSizeHeight)];
        _locateLabel.textColor = CX_WhiteColor;
        _locateLabel.text = @"广州";
//        _locateLabel.textAlignment = 1;
    }
    
    return _locateLabel;
}

@end
