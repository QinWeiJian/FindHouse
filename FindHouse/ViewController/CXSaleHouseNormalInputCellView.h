//
//  CXSaleHouseNormalInputCellView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXSaleHouseNormalInputCellView : CXBaseView

@property(nonatomic,retain)CXBaseLabel *titleLabel;
@property(nonatomic,retain)CXInsetsField *inputField;
@property(nonatomic,retain)CXBaseLabel *unitLabel;
@property(nonatomic,assign)BOOL haveUnit;
@property(nonatomic,retain)UIView *lineView;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title placeholder:(NSString *)placeholder haveUnit:(BOOL)haveUnit unit:(NSString *)unit;

@end
