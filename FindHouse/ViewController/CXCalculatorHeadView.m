//
//  CXCalculatorHeadView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXCalculatorHeadView.h"

@implementation CXCalculatorHeadView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = CX_ThemeGreenColor;
        
        [self addSubview:self.sumLabel];
        [self addSubview:self.monthLabel];
        [self addSubview:self.interestLabel];
        
        [self.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_WhiteColor andStartPosition:CGPointMake(ViewMargin_10, self.sumLabel.viewDistanceY+ViewMargin_10) endPosition:CGPointMake(self.viewSizeWidth-ViewMargin_10, self.sumLabel.viewDistanceY+ViewMargin_10) LineWidth:0.5]];
        
        [self.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_WhiteColor andStartPosition:CGPointMake(self.viewSizeWidth/2, self.sumLabel.viewDistanceY+ViewMargin_10) endPosition:CGPointMake(self.viewSizeWidth/2, self.viewSizeHeight-ViewMargin_10) LineWidth:0.5]];
    }
    
    return self;
}

#pragma mark - Getter

- (CXCalculatorUpDownLabel *)sumLabel
{
    if (!_sumLabel)
    {
        _sumLabel = [[CXCalculatorUpDownLabel alloc] initWithFrame:CGRectMake(ViewMargin_Double_10, ViewMargin_Double_10, self.viewSizeWidth-ViewMargin_Double_10*2, 80) title:@"还款总额(元)"];
        _sumLabel.downField.text = @"800000.0";
        _sumLabel.downField.font = [UIFont boldSystemFontOfSize:30];
    }
    
    return _sumLabel;
}

- (CXCalculatorUpDownLabel *)monthLabel
{
    if (!_monthLabel)
    {
        _monthLabel = [[CXCalculatorUpDownLabel alloc] initWithFrame:CGRectMake(ViewMargin_Double_10, self.sumLabel.viewDistanceY+ViewMargin_Double_10, self.viewSizeWidth/2-ViewMargin_Double_10-ViewMargin_10, self.sumLabel.viewSizeHeight) title:@"月供参考(元)"];
        _monthLabel.downField.text = @"80000.0";
        _monthLabel.downField.font = [UIFont boldSystemFontOfSize:25];
    }
    
    return _monthLabel;
}


- (CXCalculatorUpDownLabel *)interestLabel
{
    if (!_interestLabel)
    {
        _interestLabel = [[CXCalculatorUpDownLabel alloc] initWithFrame:CGRectMake(self.monthLabel.viewDistanceX+ViewMargin_Double_10+ViewMargin_10, self.monthLabel.viewOriginY, self.monthLabel.viewSizeWidth, self.monthLabel.viewSizeHeight) title:@"支付利息(元)"];
        _interestLabel.downField.text = @"800.0";
        _interestLabel.downField.font = [UIFont boldSystemFontOfSize:25];
    }
    
    return _interestLabel;
}


@end
