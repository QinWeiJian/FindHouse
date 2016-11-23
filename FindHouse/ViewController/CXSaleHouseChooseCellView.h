//
//  CXSaleHouseChooseCellView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXSaleHouseChooseCellView : CXBaseView

@property(nonatomic,retain)CXBaseLabel *titleLabel;
@property(nonatomic,retain)CXBaseLabel *detailLabel;
@property(nonatomic,retain)CXBaseImageView *arrowImageView;
@property(nonatomic,retain)UIView *lineView;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title detail:(NSString *)detail;

@end
