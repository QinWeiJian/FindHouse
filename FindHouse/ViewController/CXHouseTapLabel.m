//
//  CXHouseTapLabel.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/11.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHouseTapLabel.h"

@implementation CXHouseTapLabel

- (id)initWithFrame:(CGRect)frame tap:(NSString *)tap
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.tapLabel];
        [self addSubview:self.contentLabel];
        
        self.tapLabel.text = tap;
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseLabel *)tapLabel
{
    if (!_tapLabel)
    {
        _tapLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(0, 0, 50, self.viewSizeHeight)];
        _tapLabel.textColor = CX_GrayColor;
    }
    
    return _tapLabel;
}

- (CXBaseLabel *)contentLabel
{
    if (!_contentLabel)
    {
        _contentLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.tapLabel.viewDistanceX, 0, self.viewSizeWidth-self.tapLabel.viewDistanceX, self.viewSizeHeight)];
        _contentLabel.textColor = CX_GrayColor;
    }
    
    return _contentLabel;
}

@end
