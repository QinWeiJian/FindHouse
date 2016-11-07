//
//  CXHomeMarketView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHomeMarketView.h"

@implementation CXHomeMarketView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.contentLabel];
        
        self.titleLabel.attributedText = [CXGlobalTool cx_emotionStrWithString:title textColor:CX_GrayColor offset:-2];
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.viewSizeHeight/2-30, self.viewSizeWidth, 30)];
        _titleLabel.textAlignment = 1;
        _titleLabel.font = FontSize(15);
        _titleLabel.textColor = [UIColor grayColor];
    }
    
    return _titleLabel;
}

- (CXBaseLabel *)contentLabel
{
    if (!_contentLabel)
    {
        _contentLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.viewSizeHeight/2, self.viewSizeWidth, 30)];
        _contentLabel.textAlignment = 1;
        _contentLabel.font = FontSize(16);
    }
    
    return _contentLabel;
}

@end
