//
//  CXSaleHouseCellView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/22.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSaleHouseCellView.h"

@implementation CXSaleHouseCellView

- (id)initWithFrame:(CGRect)frame tapImage:(UIImage *)tapImage title:(NSString *)title detail:(NSString *)detail
{
    if (self = [super initWithFrame:frame])
    {
        self.tapImageView.image = tapImage;
        self.titleLabel.text = title;
        self.detailLabel.text = detail;
        
        [self addSubview:self.tapImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.arrowImageView];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseImageView *)tapImageView
{
    if (!_tapImageView)
    {
        _tapImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(ViewMargin_10, ViewMargin_10, self.height-ViewMargin_Double_10, self.height-ViewMargin_Double_10)];
        _tapImageView.layer.cornerRadius = _tapImageView.height/2;
    }
    
    return _tapImageView;
}

- (CXBaseImageView *)arrowImageView
{
    if (!_arrowImageView)
    {
        UIImage *arrowImage = ImageWithNamed(@"cell_rightArrow_big");
        
        _arrowImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(self.width-ViewMargin_10-arrowImage.size.width, 0, arrowImage.size.width, self.height)];
        _arrowImageView.image = arrowImage;
    }
    
    return _arrowImageView;
}

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.tapImageView.viewDistanceX+ViewMargin_10, self.tapImageView.y, self.arrowImageView.x-self.tapImageView.viewDistanceX-ViewMargin_Double_10, self.tapImageView.height/2)];
        _titleLabel.font = BoldFontSize(15);
    }
    
    return _titleLabel;
}

- (CXBaseLabel *)detailLabel
{
    if (!_detailLabel)
    {
        _detailLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.titleLabel.x, self.titleLabel.viewDistanceY, self.titleLabel.width, self.titleLabel.height)];
        _detailLabel.textColor = CX_GrayColor;
        _detailLabel.font = FontSize(13);
    }
    
    return _detailLabel;
}

@end
