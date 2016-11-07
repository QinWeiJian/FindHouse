//
//  CXHomeCityMarketCell.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableViewCell.h"
#import "CXHomeMarketView.h"

@interface CXHomeCityMarketCell : CXBaseTableViewCell

@property(nonatomic,retain)CXBaseLabel *titleLabel;

@property(nonatomic,retain)CXHomeMarketView *volumeLabel;
@property(nonatomic,retain)CXHomeMarketView *averagePriceLabel;

@end
