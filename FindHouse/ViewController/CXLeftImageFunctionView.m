//
//  CXLeftImageFunctionView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXLeftImageFunctionView.h"

@implementation CXLeftImageFunctionView

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
    self.myImageView.frame = CGRectMake(self.viewSizeWidth/2-self.myImageView.image.size.width, 0, self.myImageView.image.size.width, self.viewSizeHeight);
    
    self.myLabel.frame = CGRectMake(self.myImageView.viewDistanceX+ViewMargin_Double_10, 0, self.viewSizeWidth-self.myImageView.viewDistanceX-ViewMargin_Double_10*2, self.viewSizeHeight);
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
        _myLabel.font = FontSize(18);
    }
    
    return _myLabel;
}

@end
