//
//  CXCalculatorPriceView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "TPKeyboardAvoidingTableView.h"

typedef NS_ENUM(NSInteger, CXCalculatorPriceViewType) {
    CXCalculatorPriceViewTypeBusiness,
    CXCalculatorPriceViewTypeFund,
    CXCalculatorPriceViewTypeCombination
};

@interface CXCalculatorPriceView : TPKeyboardAvoidingTableView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)CXCalculatorPriceViewType priceType;

@property(nonatomic,retain)CXBaseTableView *myTableView;

- (id)initWithFrame:(CGRect)frame priceType:(CXCalculatorPriceViewType)priceType;

@end
