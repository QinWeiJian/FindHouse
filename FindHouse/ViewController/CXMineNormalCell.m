//
//  CXMineNormalCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXMineNormalCell.h"

#define CellHeight 45

@implementation CXMineNormalCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.myImageView];
        [self.contentView addSubview:self.myLabel];
        [self.contentView addSubview:self.arrowImageView];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseImageView *)arrowImageView
{
    if (!_arrowImageView)
    {
        _arrowImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(Screen_Width-ViewMargin_10-ImageWithNamed(@"mine_rightArrow").size.width, 0, ImageWithNamed(@"mine_rightArrow").size.width, CellHeight)];
        _arrowImageView.image = ImageWithNamed(@"mine_rightArrow");
    }
    
    return _arrowImageView;
}

- (CXBaseImageView *)myImageView
{
    if (!_myImageView)
    {
        _myImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(0, 0, CellHeight, CellHeight)];
    }
    
    return _myImageView;
}

- (CXBaseLabel *)myLabel
{
    if (!_myLabel)
    {
        _myLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.myImageView.viewDistanceX, 0, self.arrowImageView.viewOriginX-self.myImageView.viewDistanceX-ViewMargin_10, CellHeight)];
    }
    
    return _myLabel;
}

@end
