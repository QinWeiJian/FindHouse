//
//  CXCalculatorUpDownLabel.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXCalculatorUpDownLabel : CXBaseView

@property(nonatomic,retain)CXBaseLabel *upLabel;
@property(nonatomic,retain)CXInsetsField *downField;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title;

@end
