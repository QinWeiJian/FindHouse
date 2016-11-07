//
//  YYViewPicturesScrollView.m
//  yiyuanjiugou
//
//  Created by mac on 15/10/21.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "YYViewPicturesScrollView.h"
#import "YYViewPicturesZoomScrollView.h"

@interface YYViewPicturesScrollView ()<UIScrollViewDelegate>
{
    UIScrollView *_mainScrollView;
    UILabel *_currentLabel;
}

@end

@implementation YYViewPicturesScrollView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor blackColor];
//        self.alpha = 0.5;
        [self createMainScrollView];
    }
    
    return self;
}

- (void)createMainScrollView
{
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeWidth, self.viewSizeHeight)];
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.delegate = self;
    _mainScrollView.userInteractionEnabled = YES;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.backgroundColor = [UIColor clearColor];
//    _mainScrollView.alpha = 0.8;
    [self addSubview:_mainScrollView];
    
}

- (void)removeAction:(UITapGestureRecognizer *)sender
{
    __block YYViewPicturesScrollView *weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

- (void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    
    [self createSubViews];
}

- (void)createSubViews
{
    
    _mainScrollView.contentSize = CGSizeMake(_mainScrollView.viewSizeWidth*_imageArray.count, _mainScrollView.viewSizeHeight);
    _mainScrollView.contentOffset = CGPointMake(_mainScrollView.viewSizeWidth*_currentPage, 0);
    
    for (int i = 0; i < _imageArray.count; i++)
    {
        YYViewPicturesZoomScrollView *zoomView = [[YYViewPicturesZoomScrollView alloc] initWithFrame:CGRectMake(_mainScrollView.viewSizeWidth*i, 0, _mainScrollView.viewSizeWidth, _mainScrollView.viewSizeHeight)];
        zoomView.tag = ButtonTag+i;
        zoomView.imageUrlString = [_imageArray objectAtIndex:i];
        [_mainScrollView addSubview:zoomView];
    }
    
    _currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.viewSizeHeight-30, self.viewSizeWidth, 30)];
    _currentLabel.backgroundColor = [UIColor clearColor];
    _currentLabel.textColor = [UIColor whiteColor];
    _currentLabel.font = [UIFont boldSystemFontOfSize:14];
    _currentLabel.textAlignment = 1;
    _currentLabel.text = [NSString stringWithFormat:@"%ld/%lu",_currentPage+1,(unsigned long)_imageArray.count];
    [self addSubview:_currentLabel];
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/self.viewSizeWidth;
    
    YYViewPicturesZoomScrollView *zoomView = (YYViewPicturesZoomScrollView *)[_mainScrollView viewWithTag:ButtonTag+page-1];
    zoomView.mainScrollView.zoomScale = 1;
    
    YYViewPicturesZoomScrollView *zoomView1 = (YYViewPicturesZoomScrollView *)[_mainScrollView viewWithTag:ButtonTag+page+1];
    zoomView1.mainScrollView.zoomScale = 1;
    
    _currentLabel.text = [NSString stringWithFormat:@"%ld/%lu",page+1,(unsigned long)_imageArray.count];
}

@end
