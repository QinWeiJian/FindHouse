//
//  YYViewPicturesZoomScrollView.m
//  yiyuanjiugou
//
//  Created by mac on 15/10/21.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "YYViewPicturesZoomScrollView.h"

#define YY_DidFinishedViewPicture_Notification @"YY_DidFinishedViewPicture_Notification"

@interface YYViewPicturesZoomScrollView ()<UIScrollViewDelegate>
{
    UIImageView *_myImageView;
}

@property(nonatomic,assign)BOOL isDoubleTap;

@end

@implementation YYViewPicturesZoomScrollView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = YES;
        [self createSubViews];
        
//        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    }
    
    return self;
}

- (void)createSubViews
{
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeWidth, self.viewSizeHeight)];
    _mainScrollView.userInteractionEnabled = YES;
    _mainScrollView.maximumZoomScale = 2;
    _mainScrollView.minimumZoomScale = 1;
    _mainScrollView.delegate = self;
    _mainScrollView.bounces = YES;
    _mainScrollView.bouncesZoom = YES;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.showsVerticalScrollIndicator = NO;
    _mainScrollView.contentSize = CGSizeMake(self.viewSizeWidth, self.viewSizeHeight);
    _mainScrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:_mainScrollView];
    
    _myImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _myImageView.contentMode = UIViewContentModeCenter;
    _myImageView.userInteractionEnabled = YES;
    _myImageView.clipsToBounds = YES;
    _myImageView.backgroundColor = [UIColor clearColor];
    [_mainScrollView addSubview:_myImageView];
    
    UITapGestureRecognizer *removeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeAction:)];
    removeTap.delaysTouchesBegan = YES;
    [_mainScrollView addGestureRecognizer:removeTap];

    
    UITapGestureRecognizer *zoomTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomAction:)];
    zoomTap.numberOfTapsRequired = 2;
    [_mainScrollView addGestureRecognizer:zoomTap];
}

- (void)setImageUrlString:(NSString *)imageUrlString
{
    _imageUrlString = imageUrlString;
    
    [self loadImage];
    
//    [_myImageView sd_setImageWithURL:[NSURL URLWithString:_imageUrlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        [weakSelf adaptiveImageViewWithImage:image];
//    }];
    
//    [_myImageView sd_setImageWithURL:[NSURL URLWithString:_imageUrlString]];
}

- (void)loadImage
{
    __weak YYViewPicturesZoomScrollView *weakSelf = self;
    [_myImageView cx_setImageScaleToFillWithUrlString:_imageUrlString contentMode:UIViewContentModeScaleAspectFit completed:^(UIImage *image) {
        [weakSelf adaptiveImageViewWithImage:image];
    }];
}

- (void)adaptiveImageViewWithImage:(UIImage *)image
{
//     NSLog(@"%f,%f",image.size.width,image.size.height);
    
    if (image)
    {
        CGSize frame = image.size;
        
        if (frame.width > frame.height)
        {
            CGFloat imageviewSizeHeight = image.size.height*_myImageView.viewSizeWidth/image.size.width;
            _myImageView.frame = CGRectMake(0, 0, _mainScrollView.viewSizeWidth, imageviewSizeHeight);
        }else
        {
            if (frame.height >= _mainScrollView.viewSizeHeight)
            {
                CGFloat imageBi = frame.width/frame.height;
                CGFloat mainBi = _mainScrollView.viewSizeWidth/_mainScrollView.viewSizeHeight;
                
                if (imageBi > mainBi)
                {
                    CGFloat imageviewSizeHeight = image.size.height*_myImageView.viewSizeWidth/image.size.width;
                    _myImageView.frame = CGRectMake(0, 0, _mainScrollView.viewSizeWidth, imageviewSizeHeight);
                }else
                {
                    CGFloat imageviewSizeHeight = image.size.width*_myImageView.viewSizeHeight/image.size.height;
                    _myImageView.frame = CGRectMake(0, 0, imageviewSizeHeight, _mainScrollView.viewSizeHeight);
                }
                
            }else
            {
                CGFloat imageviewSizeWidth = image.size.width*_myImageView.viewSizeHeight/image.size.height;
                CGFloat imageviewSizeHeight = image.size.height*_myImageView.viewSizeWidth/image.size.width;
                
                if (imageviewSizeHeight > _mainScrollView.viewSizeHeight && imageviewSizeWidth > _mainScrollView.viewSizeWidth)
                {
                    _myImageView.frame = CGRectMake(0, 0, imageviewSizeWidth, _mainScrollView.viewSizeHeight);
                }else if (imageviewSizeHeight > _mainScrollView.viewSizeHeight && imageviewSizeWidth < _mainScrollView.viewSizeWidth)
                {
                    _myImageView.frame = CGRectMake(0, 0, imageviewSizeWidth, _mainScrollView.viewSizeHeight);
                }else if (imageviewSizeHeight < _mainScrollView.viewSizeHeight && imageviewSizeWidth > _mainScrollView.viewSizeWidth)
                {
                    _myImageView.frame = CGRectMake(0, 0, _mainScrollView.viewSizeWidth, imageviewSizeHeight);
                }else
                {
                    _myImageView.frame = CGRectMake(0, 0, _mainScrollView.viewSizeWidth, imageviewSizeHeight);
                }
            }
        }
        
//        _myImageView.frame = CGRectMake(0, 0, frame.width, frame.height);
        
        CGFloat offsetX = (_mainScrollView.bounds.size.width > _mainScrollView.contentSize.width)?(_mainScrollView.bounds.size.width - _mainScrollView.contentSize.width)/2 : 0.0;
        
        CGFloat offsetY = (_mainScrollView.bounds.size.height > _mainScrollView.contentSize.height)?(_mainScrollView.bounds.size.height - _mainScrollView.contentSize.height)/2 : 0.0;
        
        _myImageView.center = CGPointMake(_mainScrollView.contentSize.width/2 + offsetX ,_mainScrollView.contentSize.height/2 + offsetY);
    
        
        if (_myImageView.viewSizeWidth > _myImageView.viewSizeHeight)
        {
            _mainScrollView.maximumZoomScale = _mainScrollView.viewSizeHeight/_myImageView.viewSizeHeight+1;
        }else
        {
            if (_myImageView.viewSizeHeight < _mainScrollView.viewSizeHeight)
            {
                _mainScrollView.maximumZoomScale = _mainScrollView.viewSizeHeight/_myImageView.viewSizeHeight+1;
            }else
            {
                _mainScrollView.maximumZoomScale = _mainScrollView.viewSizeWidth/_myImageView.viewSizeWidth+1;
            }
        }
        
        
    }else
    {
        [self loadImage];
    }
    
//    NSLog(@"%f,%f",_myImageView.viewSizeWidth,_myImageView.viewSizeHeight);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _myImageView;
}

- (void)zoomAction:(UITapGestureRecognizer *)sender
{
    _isDoubleTap = YES;
    
    CGPoint zoomPoint = [sender locationInView:_myImageView];
//    CGPoint zoom = [_myImageView convertPoint:zoomPoint toView:_mainScrollView];
    
    if (_mainScrollView.zoomScale == _mainScrollView.maximumZoomScale)
    {
        [UIView animateWithDuration:0.3 animations:^{
            _mainScrollView.zoomScale = 1;
        }];
    }else if (_mainScrollView.zoomScale == 1)
    {
//        [UIView animateWithDuration:0.3 animations:^{
//            _mainScrollView.zoomScale = _mainScrollView.maximumZoomScale;
            [_mainScrollView zoomToRect:CGRectMake(zoomPoint.x-15, zoomPoint.y-15, 30, 30) animated:YES];
//        }];
    }
}

- (void)removeAction:(UITapGestureRecognizer *)sender
{
    _isDoubleTap = NO;
    
    [self performSelector:@selector(removeAction) withObject:nil afterDelay:0.3];
}

- (void)removeAction
{
    if (_isDoubleTap == YES)
    {
        return;
    }else
    {
//        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:YY_DidFinishedViewPicture_Notification object:nil];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.superview.superview.alpha = 0;
        } completion:^(BOOL finished) {
            [self.superview.superview removeFromSuperview];
        }];
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    [scrollView setZoomScale:scale animated:NO];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
    
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
    
    _myImageView.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
}

@end
