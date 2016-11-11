//
//  CXHouseMessageCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/11.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHouseMessageCell.h"

@implementation CXHouseMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = CX_WhiteColor;
        
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.sumPriceLabel];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.everyPriceLabel];
        [self.contentView addSubview:self.calculatorButton];
        [self.contentView addSubview:self.lineView];
        
        [self.contentView addSubview:self.houseTypeLabel];
        [self.contentView addSubview:self.houseAreaLabel];
        [self.contentView addSubview:self.houseDirectionLabel];
        [self.contentView addSubview:self.houseFloorLabel];
        [self.contentView addSubview:self.houseYearLabel];
        [self.contentView addSubview:self.houseFitmentLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    CGSize sumPriceSize = [self.sumPriceLabel.text cx_sizeWithFont:FontSize(16) ContentMargin:0];
    
    self.sumPriceLabel.frame = CGRectMake(Screen_Width-ViewMargin_10-sumPriceSize.width, ViewMargin_5, sumPriceSize.width, 40);
    
    self.nameLabel.frame = CGRectMake(ViewMargin_10, ViewMargin_5, self.sumPriceLabel.viewOriginX-ViewMargin_Double_10, self.sumPriceLabel.viewSizeHeight);
    
    CGSize locationSize = [self.locationLabel.text cx_sizeWithFont:self.locationLabel.font ContentMargin:0];
    
    self.locationLabel.frame = CGRectMake(ViewMargin_10, self.nameLabel.viewDistanceY+ViewMargin_5, locationSize.width, locationSize.height);
    
    self.everyPriceLabel.frame = CGRectMake(self.locationLabel.viewDistanceX+ViewMargin_10, self.locationLabel.viewOriginY, Screen_Width-self.locationLabel.viewDistanceX-ViewMargin_Double_10, self.locationLabel.viewSizeHeight);
    
    self.calculatorButton.frame = CGRectMake(Screen_Width-80, self.everyPriceLabel.viewDistanceY, 80, 40);
    
    self.lineView.frame = CGRectMake(ViewMargin_10, self.calculatorButton.viewDistanceY, Screen_Width-ViewMargin_Double_10, 0.5);
    
    self.houseTypeLabel.frame = CGRectMake(ViewMargin_10, self.lineView.viewDistanceY+ViewMargin_10, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight);
    self.houseAreaLabel.frame = CGRectMake(self.houseTypeLabel.viewDistanceX+ViewMargin_10, self.houseTypeLabel.viewOriginY, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight);
    self.houseDirectionLabel.frame = CGRectMake(ViewMargin_10, self.houseTypeLabel.viewDistanceY+ViewMargin_10, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight);
    self.houseFloorLabel.frame = CGRectMake(self.houseAreaLabel.viewOriginX, self.houseDirectionLabel.viewOriginY, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight);
    self.houseYearLabel.frame = CGRectMake(ViewMargin_10, self.houseDirectionLabel.viewDistanceY+ViewMargin_10, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight);
    self.houseFitmentLabel.frame = CGRectMake(self.houseFloorLabel.viewOriginX, self.houseYearLabel.viewOriginY, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight);
}

#pragma mark - Getter

- (CXBaseLabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _nameLabel.font = [UIFont boldSystemFontOfSize:18];
        _nameLabel.numberOfLines = 2;
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

- (UIButton *)calculatorButton
{
    if (!_calculatorButton)
    {
        _calculatorButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _calculatorButton.titleLabel.font = FontSize(12);
        [_calculatorButton setTitle:@" 计算器" forState:UIControlStateNormal];
        [_calculatorButton setTitleColor:CX_GrayColor forState:UIControlStateNormal];
        [_calculatorButton setImage:ImageWithNamed(@"house_detail_calculator") forState:UIControlStateNormal];
        
        [_calculatorButton setImageEdgeInsets:UIEdgeInsetsMake(2, 0.0,0.0, 0)];
    }
    
    return _calculatorButton;
}

- (UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc] initWithFrame:CGRectZero];
        _lineView.backgroundColor = CX_LightGrayColor;
    }
    
    return _lineView;
}

- (CXHouseTapLabel *)houseTypeLabel
{
    if (!_houseTypeLabel)
    {
        _houseTypeLabel = [[CXHouseTapLabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width/2-ViewMargin_10-ViewMargin_5, 25) tap:@"户型："];
        _houseTypeLabel.contentLabel.text = @"三房一厅";
    }
    
    return _houseTypeLabel;
}

- (CXHouseTapLabel *)houseAreaLabel
{
    if (!_houseAreaLabel)
    {
        _houseAreaLabel = [[CXHouseTapLabel alloc] initWithFrame:CGRectMake(0, 0, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight) tap:@"面积："];
        _houseAreaLabel.contentLabel.text = @"91㎡";
    }
    
    return _houseAreaLabel;
}

- (CXHouseTapLabel *)houseDirectionLabel
{
    if (!_houseDirectionLabel)
    {
        _houseDirectionLabel = [[CXHouseTapLabel alloc] initWithFrame:CGRectMake(0, 0, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight) tap:@"朝向："];
        _houseDirectionLabel.contentLabel.text = @"南";
    }
    
    return _houseDirectionLabel;
}

- (CXHouseTapLabel *)houseFloorLabel
{
    if (!_houseFloorLabel)
    {
        _houseFloorLabel = [[CXHouseTapLabel alloc] initWithFrame:CGRectMake(0, 0, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight) tap:@"楼层："];
        _houseFloorLabel.contentLabel.text = @"29/33";
    }
    
    return _houseFloorLabel;
}

- (CXHouseTapLabel *)houseYearLabel
{
    if (!_houseYearLabel)
    {
        _houseYearLabel = [[CXHouseTapLabel alloc] initWithFrame:CGRectMake(0, 0, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight) tap:@"年代："];
        _houseYearLabel.contentLabel.text = @"2016年6月";
    }
    
    return _houseYearLabel;
}

- (CXHouseTapLabel *)houseFitmentLabel
{
    if (!_houseFitmentLabel)
    {
        _houseFitmentLabel = [[CXHouseTapLabel alloc] initWithFrame:CGRectMake(0, 0, self.houseTypeLabel.viewSizeWidth, self.houseTypeLabel.viewSizeHeight) tap:@"装修："];
        _houseFitmentLabel.contentLabel.text = @"豪华装修";
    }
    
    return _houseFitmentLabel;
}

@end
