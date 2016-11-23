//
//  CXDetailTextFieldCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXDetailTextFieldCell.h"

#define CellHeight 45

@implementation CXDetailTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.detailTextField];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_15, 0, Screen_Width/2-ViewMargin_15-ViewMargin_10, CellHeight)];
    }
    
    return _titleLabel;
}

- (CXInsetsField *)detailTextField
{
    if (!_detailTextField)
    {
        _detailTextField = [[CXInsetsField alloc] initWithFrame:CGRectMake(self.titleLabel.viewDistanceX+ViewMargin_10, 0, Screen_Width-self.titleLabel.viewDistanceX-ViewMargin_Double_10, CellHeight) margin:0];
        _detailTextField.textAlignment = 2;
    }
    
    return _detailTextField;
}

@end
