//
//  CXSaleHouseChooseCellView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSaleHouseChooseCellView.h"

@implementation CXSaleHouseChooseCellView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title detail:(NSString *)detail
{
    if (self = [super initWithFrame:frame])
    {
        self.titleLabel.text = title;
        self.detailLabel.text = detail;
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.arrowImageView];
        [self addSubview:self.lineView];
        
        [self layoutSubFrames];
    }
    
    return self;
}

- (void)layoutSubFrames
{
    CGSize titleSize = [self.titleLabel.text cx_sizeWithFont:self.titleLabel.font ContentMargin:0];
    self.titleLabel.frame = CGRectMake(ViewMargin_10, 0, titleSize.width, self.height);
    
    self.detailLabel.frame = CGRectMake(self.titleLabel.viewDistanceX+ViewMargin_10, 0, self.width-self.titleLabel.viewDistanceX-ViewMargin_10-40, self.height);
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
    }
    
    return _titleLabel;
}

- (CXBaseLabel *)detailLabel
{
    if (!_detailLabel)
    {
        _detailLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _detailLabel.textAlignment = 2;
    }
    
    return _detailLabel;
}

- (CXBaseImageView *)arrowImageView
{
    if (!_arrowImageView)
    {
        UIImage *image = ImageWithNamed(@"cell_rightArrow");
        
        _arrowImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(self.width-ViewMargin_10-image.size.width, 0, image.size.width, self.height)];
        _arrowImageView.image = image;
    }
    
    return _arrowImageView;
}

- (UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(ViewMargin_10, self.height-0.5, self.width-ViewMargin_10, 0.5)];
        _lineView.backgroundColor = CX_BackgroundColor;
    }
    
    return _lineView;
}

@end
