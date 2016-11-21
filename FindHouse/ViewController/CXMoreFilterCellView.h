//
//  CXMoreFilterCellView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/21.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXMoreFilterCellView : CXBaseView

@property(nonatomic,retain)CXBaseLabel *titleLabel;
@property(nonatomic,retain)NSArray *contentArray;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title contentArray:(NSArray *)contentArray;

- (void)resetItem;

@end
