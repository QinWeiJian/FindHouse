//
//  CXUpImageFunctionView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXUpImageFunctionView.h"

@implementation CXUpImageFunctionView

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image text:(NSString *)text
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.myImageView];
        [self addSubview:self.myLabel];
        
        self.myImageView.image = image;
        self.myLabel.text = text;
        
        [self layoutSubFrames];
    }
    
    return self;
}

- (void)layoutSubFrames
{
    self.myImageView.frame = CGRectMake(0, self.viewSizeHeight/2-self.myImageView.image.size.height, self.viewSizeWidth, self.myImageView.image.size.height);
    
    self.myLabel.frame = CGRectMake(0, self.myImageView.viewDistanceY, self.viewSizeWidth, self.viewSizeHeight/2);
}

#pragma mark - Getter

- (CXBaseImageView *)myImageView
{
    if (!_myImageView)
    {
        _myImageView = [[CXBaseImageView alloc] initWithFrame:CGRectZero];
    }
    
    return _myImageView;
}

- (CXBaseLabel *)myLabel
{
    if (!_myLabel)
    {
        _myLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _myLabel.font = FontSize(15);
        _myLabel.textAlignment = 1;
    }
    
    return _myLabel;
}

@end
