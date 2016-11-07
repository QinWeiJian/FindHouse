//
//  CXHomeMarketView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXHomeMarketView : CXBaseView

@property(nonatomic,retain)CXBaseLabel *titleLabel;
@property(nonatomic,retain)CXBaseLabel *contentLabel;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title;

@end
