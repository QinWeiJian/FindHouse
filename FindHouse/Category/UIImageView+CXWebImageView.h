//
//  UIImageView+CXWebImageView.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

typedef void(^SetImageCompleteBlock)(UIImage *image);

@interface UIImageView (CXWebImageView)

- (void)cx_setImageWithUrlString:(NSString *)urlString ContentMode:(UIViewContentMode)contentMode;

- (void)cx_setImageWithUrlString:(NSString *)urlString contentMode:(UIViewContentMode)contentMode placeholderImage:(UIImage *)placeholder;

- (void)cx_setImageScaleToFillWithUrlString:(NSString *)urlString contentMode:(UIViewContentMode)contentMode completed:(SetImageCompleteBlock)setImageCompleteBlock;

@end
