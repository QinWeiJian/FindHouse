//
//  CXBaseLabel.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseLabel.h"

@implementation CXBaseLabel

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.layer.masksToBounds = YES;
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = CX_BlackColor;
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

@end
