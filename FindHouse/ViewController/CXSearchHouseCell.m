//
//  CXSearchHouseCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSearchHouseCell.h"

#define CellImageHeight (5*Screen_Width)/9

#define CellHeight CellImageHeight+60

@implementation CXSearchHouseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.houseImageView];
        [self.contentView addSubview:self.locationImageView];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.areaLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    CGSize areaSize = [self.areaLabel.text cx_sizeWithFont:self.areaLabel.font ContentMargin:0];
    
    self.areaLabel.width = areaSize.width;
    self.areaLabel.x = Screen_Width - ViewMargin_10 - areaSize.width;
    
    self.nameLabel.width = self.areaLabel.viewOriginX - ViewMargin_Double_10;
}

#pragma mark - Getter

- (CXBaseImageView *)houseImageView
{
    if (!_houseImageView)
    {
        _houseImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, CellImageHeight)];
        _houseImageView.backgroundColor = [UIColor blackColor];
    }
    
    return _houseImageView;
}

- (CXBaseImageView *)locationImageView
{
    if (!_locationImageView)
    {
        _locationImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(ViewMargin_10, CellImageHeight-ViewMargin_10-25, ImageWithNamed(@"navigationBar_location").size.width, 25)];
        _locationImageView.image = ImageWithNamed(@"navigationBar_location");
    }
    
    return _locationImageView;
}

- (CXBaseLabel *)locationLabel
{
    if (!_locationLabel)
    {
        _locationLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.locationImageView.viewDistanceX+ViewMargin_5, self.locationImageView.viewOriginY, Screen_Width/2-self.locationImageView.viewDistanceX-ViewMargin_5, self.locationImageView.viewSizeHeight)];
        _locationLabel.textColor = CX_WhiteColor;
        _locationLabel.adjustsFontSizeToFitWidth = YES;
        _locationLabel.text = @"天河区 东圃";
    }
    
    return _locationLabel;
}

- (CXBaseLabel *)priceLabel
{
    if (!_priceLabel)
    {
        _priceLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(Screen_Width/2+ViewMargin_10, CellImageHeight-ViewMargin_10-25, Screen_Width-self.locationLabel.viewDistanceX-ViewMargin_Double_10, 25)];
        _priceLabel.textColor = CX_WhiteColor;
        _priceLabel.text = @"500万";
        _priceLabel.textAlignment = 2;
        _priceLabel.adjustsFontSizeToFitWidth = YES;
        _priceLabel.attributedText = [_priceLabel.text cx_changeTextColorWithReplaceString:@"500" ChangeColor:CX_RedColor ChangeFont:FontSize(18)];
    }
    
    return _priceLabel;
}

- (CXBaseLabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, CellImageHeight, 0, 40)];
        _nameLabel.font = FontSize(18);
        _nameLabel.text = @"岭南林语  3房1厅";
    }
    
    return _nameLabel;
}

- (CXBaseLabel *)areaLabel
{
    if (!_areaLabel)
    {
        _areaLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(0, self.nameLabel.viewOriginY, 0, self.nameLabel.viewSizeHeight)];
        _areaLabel.font = FontSize(16);
        _areaLabel.textColor = CX_GrayColor;
        _areaLabel.text = @"90㎡";
        _areaLabel.textAlignment = 2;
    }
    
    return _areaLabel;
}

@end
