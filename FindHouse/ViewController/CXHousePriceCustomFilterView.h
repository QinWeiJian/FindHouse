//
//  CXHousePriceCustomFilterView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/16.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"
#import "MARKRangeSlider.h"

@interface CXHousePriceCustomFilterView : CXBaseView

@property(nonatomic,retain)CXBaseLabel *titleLabel;
@property(nonatomic,retain)CXBaseLabel *priceLabel;
@property(nonatomic,retain)MARKRangeSlider *priceSlider;
@property(nonatomic,retain)UIButton *commitButton;

@end
