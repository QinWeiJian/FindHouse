//
//  CXSaleHouseFloorCellView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSaleHouseFloorCellView.h"

@implementation CXSaleHouseFloorCellView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.leftField];
        [self addSubview:self.rightField];
        [self addSubview:self.sepLabel];
        [self addSubview:self.unitLabel];
        [self addSubview:self.lineView];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        NSString *titleString = @"楼层";
        CGSize titleSize = [titleString cx_sizeWithFont:FontSize(14) ContentMargin:0];
        
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, 0, titleSize.width, self.height)];
        _titleLabel.text = titleString;
    }
    
    return _titleLabel;
}

- (CXInsetsField *)rightField
{
    if (!_rightField)
    {
        _rightField = [[CXInsetsField alloc] initWithFrame:CGRectMake(self.unitLabel.viewOriginX-30, 0, 30, self.height) margin:0];
        _rightField.textAlignment = 1;
        _rightField.placeholder = @"总楼";
        _rightField.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    return _rightField;
}

- (CXBaseLabel *)sepLabel
{
    if (!_sepLabel)
    {
        _sepLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.rightField.viewOriginX-20, 0, 20, self.height)];
        _sepLabel.text = @"/";
        _sepLabel.textAlignment = 1;
    }
    
    return _sepLabel;
}

- (CXInsetsField *)leftField
{
    if (!_leftField)
    {
        _leftField = [[CXInsetsField alloc] initWithFrame:CGRectMake(self.sepLabel.viewOriginX-self.rightField.width, 0, self.rightField.width, self.height) margin:0];
        _leftField.textAlignment = 1;
        _leftField.placeholder = @"楼层";
        _leftField.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    return _leftField;
}

- (CXBaseLabel *)unitLabel
{
    if (!_unitLabel)
    {
        _unitLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.width-ViewMargin_10-30, 0, 30, self.height)];
        _unitLabel.font = FontSize(13);
        _unitLabel.textAlignment = 2;
        _unitLabel.textColor = CX_GrayColor;
        _unitLabel.adjustsFontSizeToFitWidth = YES;
        _unitLabel.text = @"楼";
    }
    
    return _unitLabel;
}

- (UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(ViewMargin_10, self.height-0.5, self.width-ViewMargin_10, 0.5)];
        _lineView.backgroundColor = CX_BackgroundColor;
    }
    
    return _lineView;
}

@end
