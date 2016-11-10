//
//  CXSearchHouseCell.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableViewCell.h"

@interface CXSearchHouseCell : CXBaseTableViewCell

@property(nonatomic,retain)CXBaseImageView *houseImageView;
@property(nonatomic,retain)CXBaseImageView *locationImageView;
@property(nonatomic,retain)CXBaseLabel *locationLabel;
@property(nonatomic,retain)CXBaseLabel *priceLabel;
@property(nonatomic,retain)CXBaseLabel *nameLabel;
@property(nonatomic,retain)CXBaseLabel *areaLabel;

@end
