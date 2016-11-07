//
//  RunImageScrollView.m
//  xiaomizhaofangclient
//
//  Created by mac on 15/7/17.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "RunImageScrollView.h"
#import "UIImageView+WebCache.h"

@interface RunImageScrollView ()<UIScrollViewDelegate>
{
    NSTimer *_myTimer;
    
    int canRun;
}

@property(nonatomic,assign)UIViewContentMode imageContentMode;

@end

@implementation RunImageScrollView

- (void)dealloc
{
    [_myTimer invalidate];
    [_myPageControl release]; _myPageControl = nil;
    [_myScrollView release]; _myScrollView = nil;
    [_imageArray release]; _imageArray = nil;
    [_myTimer release]; _myTimer = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame ContentMode:(UIViewContentMode)contenMode NeedRun:(BOOL)needRun
{
    if (self = [super initWithFrame:frame])
    {
        self.needRun = needRun;
        
        canRun = 1;
        self.imageContentMode = contenMode;
        self.contentMode = UIViewContentModeCenter;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setImageArray:(NSArray *)imageArray
{
    if (_imageArray != imageArray)
    {
        [_imageArray release];
        _imageArray = [imageArray retain];
        
        for (UIView *view in [self subviews])
        {
            [view removeFromSuperview];
        }
        
        if (_myTimer)
        {
            [_myTimer invalidate];
            _myTimer = nil;
        }
        
        if (_imageArray.count > 0)
        {
            [self initSubViews];
        }
    }
}

- (void)initSubViews
{
    _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _myScrollView.showsHorizontalScrollIndicator = NO;
    _myScrollView.showsVerticalScrollIndicator = NO;
    _myScrollView.bounces = NO;
    _myScrollView.delegate = self;
    _myScrollView.pagingEnabled = YES;
    _myScrollView.backgroundColor = [UIColor whiteColor];
    _myScrollView.userInteractionEnabled = YES;
    [self addSubview:_myScrollView];

    _myPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20)];
    _myPageControl.hidesForSinglePage = YES;
    [_myPageControl setCurrentPageIndicatorTintColor:CX_ThemeGreenColor];
    [_myPageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    _myPageControl.numberOfPages = _imageArray.count;
    _myPageControl.currentPage = 0;
    [self addSubview:_myPageControl];
    
    if (_imageArray.count == 1)
    {
        _myPageControl.hidden = YES;
        CXBaseImageView *imageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(0, 0, _myScrollView.frame.size.width, _myScrollView.frame.size.height)];
        imageView.contentMode = UIViewContentModeCenter;
        imageView.clipsToBounds = YES;
        imageView.tag = ButtonTag;
        imageView.userInteractionEnabled = YES;
//        [imageView yy_setImageScaleToFillWithUrlString:[_imageArray objectAtIndex:0]];
        [imageView cx_setImageWithUrlString:[_imageArray objectAtIndex:0] ContentMode:self.imageContentMode];
        [_myScrollView addSubview:imageView];
        
        UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapAction:)];
        [imageView addGestureRecognizer:imageTap];
        [imageTap release];
        
        [imageView release];
    }else if (_imageArray.count > 1)
    {
        _myScrollView.contentSize = CGSizeMake(_myScrollView.frame.size.width*(_imageArray.count+2), _myScrollView.frame.size.height);
        for (int i = 0; i < _imageArray.count+2; i++)
        {
            CXBaseImageView *imageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(i*_myScrollView.frame.size.width, 0, _myScrollView.frame.size.width, _myScrollView.frame.size.height)];
            imageView.clipsToBounds = YES;
            imageView.userInteractionEnabled = YES;
            imageView.contentMode = UIViewContentModeCenter;
            if (i == 0)
            {
//                [imageView yy_setImageScaleToFillWithUrlString:[_imageArray objectAtIndex:_imageArray.count-1]];
                [imageView cx_setImageWithUrlString:[_imageArray objectAtIndex:_imageArray.count-1] ContentMode:self.imageContentMode];
            }else if (i == _imageArray.count+1)
            {
//                [imageView yy_setImageScaleToFillWithUrlString:[_imageArray objectAtIndex:0]];
                [imageView cx_setImageWithUrlString:[_imageArray objectAtIndex:0] ContentMode:self.imageContentMode];
            }else
            {
//                [imageView yy_setImageScaleToFillWithUrlString:[_imageArray objectAtIndex:i-1]];
                [imageView cx_setImageWithUrlString:[_imageArray objectAtIndex:i-1] ContentMode:self.imageContentMode];
                
                imageView.tag = ButtonTag+i-1;
                
                UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapAction:)];
                [imageView addGestureRecognizer:imageTap];
                [imageTap release];
            }
            
            [_myScrollView addSubview:imageView];
            [imageView release];
            
        }
        
        _myScrollView.contentOffset = CGPointMake(_myScrollView.frame.size.width, -0);
        
        if (self.needRun == NO)
        {
            return;
        }
        
        [self startRun];
    }else
    {
        _myPageControl.hidden = YES;
    }
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float currentX = _myScrollView.contentOffset.x;
    
    if (currentX < _myScrollView.frame.size.width)
    {
        _myPageControl.currentPage = _imageArray.count-1;
        [_myScrollView scrollRectToVisible:CGRectMake(_myScrollView.frame.size.width*_imageArray.count+1, 0, _myScrollView.frame.size.width, _myScrollView.frame.size.height) animated:NO];
    }else if (currentX > _myScrollView.frame.size.width*_imageArray.count+1)
    {
        _myPageControl.currentPage = 0;
        [_myScrollView scrollRectToVisible:CGRectMake(_myScrollView.frame.size.width, 0, _myScrollView.frame.size.width, _myScrollView.frame.size.height) animated:NO];
    }else
    {
        int currentPage = currentX/_myScrollView.frame.size.width-1;
        _myPageControl.currentPage = currentPage;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (canRun == 1)
    {
        [_myTimer invalidate];
        _myTimer = nil;
        canRun = 0;
        [self performSelector:@selector(startRun) withObject:nil afterDelay:4];
    }
}

- (void)runTimePage
{
    NSInteger page = _myPageControl.currentPage; // 获取当前的page
    page++;

    if (page > _imageArray.count-1) //
    {
        [UIView animateWithDuration:0.4f animations:^{
            _myScrollView.contentOffset = CGPointMake( self.frame.size.width*(page+1), 0);
        } completion:^(BOOL finished) {
            _myScrollView.contentOffset = CGPointMake(self.frame.size.width,0);
        }];
        page = 0;
    }else
    {
        [UIView animateWithDuration:0.4 animations:^{
            _myScrollView.contentOffset = CGPointMake(self.frame.size.width*(page+1), 0);
        } completion:^(BOOL finished) {
            
        }];
    }
    
    _myPageControl.currentPage = page;
}

- (void)startRun
{
    if (_myTimer)
    {
        [_myTimer invalidate];
        _myTimer = nil;
    }
    
    _myTimer = [NSTimer scheduledTimerWithTimeInterval:4.f target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_myTimer forMode:NSRunLoopCommonModes];
    canRun = 1;
}

- (void)imageTapAction:(UITapGestureRecognizer *)sender
{
    NSInteger currentIndex = sender.view.tag - ButtonTag;
    
    if ([self.delegate respondsToSelector:@selector(runImageScrollViewDidSelectWithIndex:)])
    {
        [self.delegate runImageScrollViewDidSelectWithIndex:currentIndex];
    }
    
//    NSLog(@"%d",currentIndex);
}

@end
