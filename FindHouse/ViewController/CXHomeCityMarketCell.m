//
//  CXHomeCityMarketCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHomeCityMarketCell.h"

#define CellHeight 110

@implementation CXHomeCityMarketCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.titleLabel];
        
        [self.contentView addSubview:self.volumeLabel];
        [self.contentView addSubview:self.averagePriceLabel];
        
        [self.contentView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(Screen_Width/2, ViewMargin_10+self.titleLabel.viewDistanceY) endPosition:CGPointMake(Screen_Width/2, CellHeight-ViewMargin_10) LineWidth:1]];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, ViewMargin_10, Screen_Width-ViewMargin_Double_10, 30)];
        _titleLabel.textAlignment = 1;
        _titleLabel.font = FontSize(15);
        _titleLabel.text = @"九月份广州行情";
    }
    
    return _titleLabel;
}

- (CXHomeMarketView *)volumeLabel
{
    if (!_volumeLabel)
    {
        _volumeLabel = [[CXHomeMarketView alloc] initWithFrame:CGRectMake(0, self.titleLabel.viewDistanceY, Screen_Width/2, 60) title:@"[成交量] 成交量(套)"];
        _volumeLabel.contentLabel.text = @"900";
    }
    
    return _volumeLabel;
}

- (CXHomeMarketView *)averagePriceLabel
{
    if (!_averagePriceLabel)
    {
        _averagePriceLabel = [[CXHomeMarketView alloc] initWithFrame:CGRectMake(self.volumeLabel.viewDistanceX, self.titleLabel.viewDistanceY, Screen_Width/2, self.volumeLabel.viewSizeHeight) title:@"[均价] 均价(元/㎡)"];
        _averagePriceLabel.contentLabel.text = @"18000";
    }
    
    return _averagePriceLabel;
}

@end
