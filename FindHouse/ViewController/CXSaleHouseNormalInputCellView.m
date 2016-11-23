//
//  CXSaleHouseNormalInputCellView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSaleHouseNormalInputCellView.h"

@implementation CXSaleHouseNormalInputCellView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title placeholder:(NSString *)placeholder haveUnit:(BOOL)haveUnit unit:(NSString *)unit
{
    if (self = [super initWithFrame:frame])
    {
        self.titleLabel.text = title;
        self.inputField.placeholder = placeholder;
        self.haveUnit = haveUnit;
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.inputField];
        [self addSubview:self.lineView];
        
        if (haveUnit)
        {
            self.unitLabel.text = unit;

            [self addSubview:self.unitLabel];
        }
        
        [self layoutSubFrames];
    }
    
    return self;
}

- (void)layoutSubFrames
{
    CGSize titleSize = [self.titleLabel.text cx_sizeWithFont:self.titleLabel.font ContentMargin:0];
    self.titleLabel.frame = CGRectMake(ViewMargin_10, 0, titleSize.width, self.height);
    
    if (self.haveUnit)
    {
        self.inputField.frame = CGRectMake(self.titleLabel.viewDistanceX+ViewMargin_10, 0, self.unitLabel.viewOriginX-self.titleLabel.viewDistanceX-ViewMargin_10, self.height);
    }else
    {
        self.inputField.frame = CGRectMake(self.titleLabel.viewDistanceX+ViewMargin_10, 0, self.width-self.titleLabel.viewDistanceX-ViewMargin_Double_10, self.height);
    }
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
    }
    
    return _titleLabel;
}

- (CXInsetsField *)inputField
{
    if (!_inputField)
    {
        _inputField = [[CXInsetsField alloc] initWithFrame:CGRectZero margin:0];
        _inputField.textAlignment = 2;
    }
    
    return _inputField;
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
