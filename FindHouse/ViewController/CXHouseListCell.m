//
//  CXHouseListCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/14.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHouseListCell.h"

#define CellHeight 100

@implementation CXHouseListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.houseImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.sumPriceLabel];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.everyPriceLabel];
        [self.contentView addSubview:self.lineView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    CGSize sumPriceSize = [self.sumPriceLabel.text cx_sizeWithFont:FontSize(16) ContentMargin:0];
    
    self.sumPriceLabel.frame = CGRectMake(Screen_Width-ViewMargin_10-sumPriceSize.width, self.houseImageView.viewOriginY, sumPriceSize.width, 20);
    
    self.nameLabel.frame = CGRectMake(self.houseImageView.viewDistanceX+ViewMargin_10, self.houseImageView.viewOriginY, self.sumPriceLabel.viewOriginX-ViewMargin_Double_10-self.houseImageView.viewDistanceX, self.sumPriceLabel.viewSizeHeight);
    
    CGSize locationSize = [self.locationLabel.text cx_sizeWithFont:self.locationLabel.font ContentMargin:0];
    
    self.locationLabel.frame = CGRectMake(self.nameLabel.viewOriginX, self.nameLabel.viewDistanceY+ViewMargin_5, locationSize.width, locationSize.height);
    
    self.everyPriceLabel.frame = CGRectMake(self.locationLabel.viewDistanceX+ViewMargin_10, self.locationLabel.viewOriginY, Screen_Width-self.locationLabel.viewDistanceX-ViewMargin_Double_10, self.locationLabel.viewSizeHeight);
}

#pragma mark - Getter

- (UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(ViewMargin_10, CellHeight-1, Screen_Width-ViewMargin_Double_10, 0.5)];
        _lineView.backgroundColor = CX_LightGrayColor;
    }
    
    return _lineView;
}

- (CXBaseImageView *)houseImageView
{
    if (!_houseImageView)
    {
        _houseImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(ViewMargin_10, ViewMargin_10, CellHeight, CellHeight-ViewMargin_Double_10)];
        _houseImageView.backgroundColor = [UIColor blackColor];
    }
    
    return _houseImageView;
}

- (CXBaseLabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _nameLabel.font = FontSize(16);
        _nameLabel.adjustsFontSizeToFitWidth = YES;
        _nameLabel.text = @"岭南林语";
    }
    
    return _nameLabel;
}

- (CXBaseLabel *)sumPriceLabel
{
    if (!_sumPriceLabel)
    {
        _sumPriceLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _sumPriceLabel.font = FontSize(12);
        _sumPriceLabel.text = @"300万";
        _sumPriceLabel.textColor = CX_GrayColor;
        _sumPriceLabel.textAlignment = 2;
        
        _sumPriceLabel.attributedText = [_sumPriceLabel.text cx_changeTextColorWithReplaceString:@"300" ChangeColor:CX_RedColor ChangeFont:FontSize(16)];
    }
    
    return _sumPriceLabel;
}

- (CXBaseLabel *)locationLabel
{
    if (!_locationLabel)
    {
        _locationLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _locationLabel.font = FontSize(12);
        _locationLabel.textColor = CX_GrayColor;
        _locationLabel.text = @"天河-东圃";
    }
    
    return _locationLabel;
}

- (CXBaseLabel *)everyPriceLabel
{
    if (!_everyPriceLabel)
    {
        _everyPriceLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _everyPriceLabel.font = FontSize(12);
        _everyPriceLabel.textColor = CX_GrayColor;
        _everyPriceLabel.text = @"50000元/㎡";
        _everyPriceLabel.textAlignment = 2;
    }
    
    return _everyPriceLabel;
}

@end
