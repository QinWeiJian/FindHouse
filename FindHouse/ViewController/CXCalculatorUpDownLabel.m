//
//  CXCalculatorUpDownLabel.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXCalculatorUpDownLabel.h"

@implementation CXCalculatorUpDownLabel

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.upLabel];
        [self addSubview:self.downField];
        
        self.upLabel.text = title;
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)upLabel
{
    if (!_upLabel)
    {
        _upLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeWidth, 25)];
        _upLabel.textColor = CX_WhiteColor;
        _upLabel.font = FontSize(13);
    }
    
    return _upLabel;
}

- (CXInsetsField *)downField
{
    if (!_downField)
    {
        _downField = [[CXInsetsField alloc] initWithFrame:CGRectMake(0, self.upLabel.viewDistanceY, self.viewSizeWidth, self.viewSizeHeight-self.upLabel.viewDistanceY) margin:0];
        _downField.enabled = NO;
        _downField.textColor = [UIColor yellowColor];
    }
    
    return _downField;
}

@end
