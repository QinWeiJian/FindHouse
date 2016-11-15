//
//  CXHomeFunctionCell.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableViewCell.h"
#import "CXLeftImageFunctionView.h"
#import "CXUpImageFunctionView.h"

typedef void(^CXHomeFunctionCellDidSelectedBlock)(NSInteger);

@interface CXHomeFunctionCell : CXBaseTableViewCell

@property(nonatomic,retain)CXLeftImageFunctionView *buyHouseView;
@property(nonatomic,retain)CXLeftImageFunctionView *saleHouseView;

@property(nonatomic,retain)CXUpImageFunctionView *tradeView;
@property(nonatomic,retain)CXUpImageFunctionView *secretaryView;
@property(nonatomic,retain)CXUpImageFunctionView *calculatorView;

@property(nonatomic,copy)CXHomeFunctionCellDidSelectedBlock didSelectedBlock;

@end
