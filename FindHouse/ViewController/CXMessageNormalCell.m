//
//  CXMessageNormalCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXMessageNormalCell.h"

#define CellHeight 70

@implementation CXMessageNormalCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.headImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.contentLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    CGSize timeSize = [self.timeLabel.text cx_sizeWithFont:self.timeLabel.font ContentMargin:0];
    
    self.timeLabel.frame = CGRectMake(Screen_Width-ViewMargin_10-timeSize.width, self.headImageView.viewOriginY, timeSize.width, self.headImageView.viewSizeHeight/2);
    
    self.nameLabel.frame = CGRectMake(self.headImageView.viewDistanceX+ViewMargin_10, self.headImageView.viewOriginY, self.timeLabel.viewOriginX-self.headImageView.viewDistanceX-ViewMargin_Double_10, self.headImageView.viewSizeHeight/2);
    
    self.contentLabel.frame = CGRectMake(self.nameLabel.viewOriginX, self.nameLabel.viewDistanceY, Screen_Width-self.headImageView.viewDistanceX-ViewMargin_Double_10, self.headImageView.viewSizeHeight/2);
}

#pragma mark - Getter

- (CXBaseImageView *)headImageView
{
    if (!_headImageView)
    {
        _headImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(ViewMargin_10, ViewMargin_10, CellHeight-ViewMargin_Double_10, CellHeight-ViewMargin_Double_10)];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.layer.cornerRadius = _headImageView.viewSizeHeight/2;
        _headImageView.image = ImageWithNamed(@"home_secretary");
    }
    
    return _headImageView;
}

- (CXBaseLabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _nameLabel.font = FontSize(15);
        _nameLabel.text = @"房产顾问";
    }
    
    return _nameLabel;
}

- (CXBaseLabel *)timeLabel
{
    if (!_timeLabel)
    {
        _timeLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _timeLabel.textAlignment = 2;
        _timeLabel.textColor = CX_GrayColor;
        _timeLabel.text = @"11:11";
    }
    
    return _timeLabel;
}

- (CXBaseLabel *)contentLabel
{
    if (!_contentLabel)
    {
        _contentLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _contentLabel.text = @"hahahhahahhaha";
    }
    
    return _contentLabel;
}

@end
