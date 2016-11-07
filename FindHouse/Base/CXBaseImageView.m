//
//  CXBaseImageView.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseImageView.h"

@implementation CXBaseImageView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeCenter;
    }
    
    return self;
}

@end
