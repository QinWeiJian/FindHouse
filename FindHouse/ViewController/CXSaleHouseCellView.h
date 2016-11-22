//
//  CXSaleHouseCellView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/22.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXSaleHouseCellView : CXBaseView

@property(nonatomic,retain)CXBaseImageView *tapImageView;
@property(nonatomic,retain)CXBaseLabel *titleLabel;
@property(nonatomic,retain)CXBaseLabel *detailLabel;
@property(nonatomic,retain)CXBaseImageView *arrowImageView;

- (id)initWithFrame:(CGRect)frame tapImage:(UIImage *)tapImage title:(NSString *)title detail:(NSString *)detail;

@end
