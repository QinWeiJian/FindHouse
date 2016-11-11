//
//  CXHouseMessageCell.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/11.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableViewCell.h"
#import "CXHouseTapLabel.h"

@interface CXHouseMessageCell : CXBaseTableViewCell

@property(nonatomic,retain)CXBaseLabel *nameLabel;
@property(nonatomic,retain)CXBaseLabel *sumPriceLabel;
@property(nonatomic,retain)CXBaseLabel *everyPriceLabel;
@property(nonatomic,retain)CXBaseLabel *locationLabel;
@property(nonatomic,retain)UIButton *calculatorButton;
@property(nonatomic,retain)UIView *lineView;

@property(nonatomic,retain)CXHouseTapLabel *houseTypeLabel;
@property(nonatomic,retain)CXHouseTapLabel *houseAreaLabel;
@property(nonatomic,retain)CXHouseTapLabel *houseDirectionLabel;
@property(nonatomic,retain)CXHouseTapLabel *houseFloorLabel;
@property(nonatomic,retain)CXHouseTapLabel *houseYearLabel;
@property(nonatomic,retain)CXHouseTapLabel *houseFitmentLabel;

@end
