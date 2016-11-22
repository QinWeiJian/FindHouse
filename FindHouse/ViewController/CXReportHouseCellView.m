//
//  CXReportHouseCellView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/22.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXReportHouseCellView.h"

@implementation CXReportHouseCellView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.contentLabel];
        [self addSubview:self.selectedButton];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedAction)]];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)contentLabel
{
    if (!_contentLabel)
    {
        _contentLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10+ViewMargin_5, 0, self.selectedButton.x-ViewMargin_10*3, self.viewSizeHeight)];
    }
    
    return _contentLabel;
}

- (UIButton *)selectedButton
{
    if (!_selectedButton)
    {
        UIImage *tickImage = ImageWithNamed(@"houseReport_tick");
        
        _selectedButton = [[UIButton alloc] initWithFrame:CGRectMake(self.width-ViewMargin_10-tickImage.size.width, 0, tickImage.size.width, self.height)];
        [_selectedButton setImage:tickImage forState:UIControlStateSelected];
        [_selectedButton addTarget:self action:@selector(selectedAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _selectedButton;
}

#pragma mark - Action

- (void)selectedAction
{
    self.selectedButton.selected = !self.selectedButton.selected;
    
    if (self.selectedButton.selected)
    {
        self.contentLabel.textColor = CX_ThemeGreenColor;
    }else
    {
        self.contentLabel.textColor = CX_BlackColor;
    }
}

@end
