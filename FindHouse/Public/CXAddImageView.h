//
//  CXAddImageView.h
//  Bolema
//
//  Created by chengxikeji on 16/8/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CXAddImageView;

@protocol CXAddImageViewDelegate <NSObject>

- (void)cx_addImageViewAddAction:(CXAddImageView *)addView;

- (void)cx_addImageViewDidDeleteImage:(CXAddImageView *)addView;

@end

@interface CXAddImageView : UIScrollView

@property(nonatomic,retain)NSMutableArray *singleImageViewArray;
@property(nonatomic,assign)id<CXAddImageViewDelegate> delegate;
@property(nonatomic,assign)NSInteger maxImageCount;
@property(nonatomic,assign)NSInteger rowImageCount;

- (id)initWithFrame:(CGRect)frame maxImageCount:(NSInteger)maxImageCount rowImageCount:(NSInteger)rowImageCount;

- (void)addImage:(UIImage *)image;

- (void)addImages:(NSArray *)imagesArray;

@end
