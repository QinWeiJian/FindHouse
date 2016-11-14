//
//  CXDetailLabelCellView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/14.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXDetailLabelCellView.h"

@implementation CXDetailLabelCellView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, 0, self.viewSizeWidth/2-ViewMargin_10, self.viewSizeHeight)];
    }
    
    return _titleLabel;
}

- (CXBaseLabel *)detailLabel
{
    if (!_detailLabel)
    {
        _detailLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.titleLabel.viewDistanceX+ViewMargin_10, 0, self.viewSizeWidth-self.titleLabel.viewDistanceX-ViewMargin_Double_10, self.viewSizeHeight)];
        _detailLabel.textAlignment = 2;
    }
    
    return _detailLabel;
}

@end
