//
//  UIView+CXView.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CXView)

@property(nonatomic,assign,readonly)CGFloat viewDistanceX;
@property(nonatomic,assign,readonly)CGFloat viewDistanceY;
@property(nonatomic,assign,readonly)CGFloat viewSizeWidth;
@property(nonatomic,assign,readonly)CGFloat viewSizeHeight;
@property(nonatomic,assign,readonly)CGFloat viewOriginX;
@property(nonatomic,assign,readonly)CGFloat viewOriginY;

@property (nonatomic,assign)CGFloat x;
@property (nonatomic,assign)CGFloat y;
@property (nonatomic,assign)CGFloat centerX;
@property (nonatomic,assign)CGFloat centerY;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGSize size;
@property (nonatomic,assign)CGPoint origin;

@end
