//
//  CXSwitchCellView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/14.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSwitchCellView.h"

@implementation CXSwitchCellView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.switchButton];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, 0, self.viewSizeWidth/2-ViewMargin_10, self.viewSizeHeight)];
    }
    
    return _titleLabel;
}

- (UIButton *)switchButton
{
    if (!_switchButton)
    {
        UIImage *image = ImageWithNamed(@"switch_on");
        
        _switchButton = [[UIButton alloc] initWithFrame:CGRectMake(self.viewSizeWidth-ViewMargin_10-image.size.width, self.viewSizeHeight/2-image.size.height/2, image.size.width, image.size.height)];
        [_switchButton setImage:image forState:UIControlStateSelected];
        [_switchButton setImage:ImageWithNamed(@"switch_off") forState:UIControlStateNormal];
        [_switchButton addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _switchButton;
}

#pragma mark - Action

- (void)switchAction
{
    self.switchButton.selected = !self.switchButton.selected;
}

@end
