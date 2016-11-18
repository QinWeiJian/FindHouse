//
//  CXHousePriceCustomFilterView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/16.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHousePriceCustomFilterView.h"

@implementation CXHousePriceCustomFilterView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.priceSlider];
        [self addSubview:self.commitButton];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        NSString *text = @"自定义租金";
        CGSize size = [text cx_sizeWithFont:FontSize(12) ContentMargin:0];
        
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, 0, size.width, 45)];
        _titleLabel.font = FontSize(12);
        _titleLabel.textColor = CX_GrayColor;
        _titleLabel.text = text;
    }
    
    return _titleLabel;
}

- (CXBaseLabel *)priceLabel
{
    if (!_priceLabel)
    {
        _priceLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.titleLabel.viewDistanceX+ViewMargin_10, 0, self.viewSizeWidth-self.titleLabel.viewDistanceX-ViewMargin_Double_10, 45)];
        _priceLabel.textColor = CX_OrangeColor;
        _priceLabel.font = FontSize(16);
        _priceLabel.textAlignment = 2;
        _priceLabel.text = @"0-5000元/月";
        
        _priceLabel.attributedText = [_priceLabel.text cx_changeTextColorWithReplaceString:@"元/月" ChangeColor:CX_GrayColor ChangeFont:FontSize(12)];
    }
    
    return _priceLabel;
}

- (MARKRangeSlider *)priceSlider
{
    if (!_priceSlider)
    {
        _priceSlider = [[MARKRangeSlider alloc] initWithFrame:CGRectMake(ViewMargin_10*2, self.titleLabel.viewDistanceY, self.viewSizeWidth-ViewMargin_Double_10*2, 45)];
        _priceSlider.minimumDistance = 0;
        _priceSlider.leftThumbImage = ImageWithNamed(@"slider_thumb");
        _priceSlider.rightThumbImage = ImageWithNamed(@"slider_thumb");
        _priceSlider.trackImage = ImageWithNamed(@"slider_track");
        _priceSlider.rangeImage = ImageWithNamed(@"slider_range");
        
        [_priceSlider addTarget:self action:@selector(rangeSliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _priceSlider;
}

- (UIButton *)commitButton
{
    if (!_commitButton)
    {
        _commitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.viewSizeWidth/2-100/2, self.priceSlider.viewDistanceY, 100, 45-ViewMargin_10)];
        _commitButton.layer.cornerRadius = 5;
        _commitButton.layer.masksToBounds = YES;
        _commitButton.layer.borderWidth = 0.5;
        _commitButton.layer.borderColor = CX_OrangeColor.CGColor;
        _commitButton.titleLabel.font = FontSize(14);
        [_commitButton setTitle:@"确定" forState:UIControlStateNormal];
        [_commitButton setTitleColor:CX_OrangeColor forState:UIControlStateNormal];
    }
    
    return _commitButton;
}

#pragma mark - Action

- (void)rangeSliderValueDidChange:(MARKRangeSlider *)slider
{
    NSInteger minValue = slider.leftValue*5000;
    NSInteger maxValue = slider.rightValue*5000;
    
    NSString *string = [NSString stringWithFormat:@"%ld-%ld元/月",(long)minValue,(long)maxValue];
    
    _priceLabel.attributedText = [string cx_changeTextColorWithReplaceString:@"元/月" ChangeColor:CX_GrayColor ChangeFont:FontSize(12)];
}

@end
