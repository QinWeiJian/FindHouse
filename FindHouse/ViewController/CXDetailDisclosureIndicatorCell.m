//
//  CXDetailDisclosureIndicatorCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXDetailDisclosureIndicatorCell.h"

#define CellHeight 45

@implementation CXDetailDisclosureIndicatorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.arrowImageView];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, 0, Screen_Width/2-ViewMargin_Double_10, CellHeight)];
    }
    
    return _titleLabel;
}

- (CXBaseLabel *)detailLabel
{
    if (!_detailLabel)
    {
        _detailLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.titleLabel.viewDistanceX+ViewMargin_10, 0, self.arrowImageView.viewOriginX-self.titleLabel.viewDistanceX-ViewMargin_Double_10, CellHeight)];
        _detailLabel.textAlignment = 2;
    }
    
    return _detailLabel;
}

- (CXBaseImageView *)arrowImageView
{
    if (!_arrowImageView)
    {
        UIImage *image = ImageWithNamed(@"cell_rightArrow");
        
        _arrowImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(Screen_Width-ViewMargin_10-image.size.width, 0, image.size.width, CellHeight)];
        _arrowImageView.image = image;
    }
    
    return _arrowImageView;
}

@end
