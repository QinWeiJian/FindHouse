//
//  CXSegmentView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@class CXSegmentView;

@protocol CXSegmentViewDelegate <NSObject>

@optional

- (void)cx_segmentView:(CXSegmentView *)segmentView didSelectedWithIndex:(NSInteger)selectedIndex;

@end

@interface CXSegmentView : CXBaseView

@property(nonatomic,assign)id<CXSegmentViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame objects:(NSArray *)objects;

@end
