//
//  CXRefreshFooter.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXRefreshFooter.h"

@implementation CXRefreshFooter

- (void)prepare
{
    [super prepare];
    
    self.stateLabel.textColor = CX_LightGrayColor;
    
    self.stateLabel.font = FontSize(12);
    
    NSArray *imageArray = [[NSArray alloc] initWithObjects:ImageWithNamed(@"refresh_1"),ImageWithNamed(@"refresh_2"),ImageWithNamed(@"refresh_3"),ImageWithNamed(@"refresh_4"),ImageWithNamed(@"refresh_5"), nil];
    
    // 设置普通状态的动画图片
    [self setImages:imageArray forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [self setImages:imageArray forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [self setImages:imageArray forState:MJRefreshStateRefreshing];
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    UIImage *stateImage = ImageWithNamed(@"refresh_1");
    
    self.mj_h = stateImage.size.height+ViewMargin_10+30;
    
    self.stateLabel.frame = CGRectMake(ViewMargin_10, 0, Screen_Width-ViewMargin_Double_10, 30);
    
    self.gifView.frame = CGRectMake(Screen_Width/2-stateImage.size.width/2, self.stateLabel.viewDistanceY, stateImage.size.width, stateImage.size.height);
}

@end
