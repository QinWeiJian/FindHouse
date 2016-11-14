//
//  CXHouseListCell.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/14.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableViewCell.h"

@interface CXHouseListCell : CXBaseTableViewCell

@property(nonatomic,retain)CXBaseImageView *houseImageView;
@property(nonatomic,retain)CXBaseLabel *nameLabel;
@property(nonatomic,retain)CXBaseLabel *sumPriceLabel;
@property(nonatomic,retain)CXBaseLabel *everyPriceLabel;
@property(nonatomic,retain)CXBaseLabel *locationLabel;
@property(nonatomic,retain)UIView *lineView;

@end
