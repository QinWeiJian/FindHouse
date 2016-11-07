//
//  RunImageScrollView.h
//  xiaomizhaofangclient
//
//  Created by mac on 15/7/17.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CXBaseImageView.h"

@protocol RunImageScrollViewDelegate <NSObject>

- (void)runImageScrollViewDidSelectWithIndex:(NSInteger)index;

@end

@interface RunImageScrollView : CXBaseImageView

@property(nonatomic,retain)UIScrollView *myScrollView;
@property(nonatomic,retain)UIPageControl *myPageControl;
@property(nonatomic,retain)NSArray *imageArray;
@property(nonatomic,assign)id <RunImageScrollViewDelegate>delegate;

@property(nonatomic,assign)BOOL needRun;

- (id)initWithFrame:(CGRect)frame ContentMode:(UIViewContentMode)contenMode NeedRun:(BOOL)needRun;

@end
