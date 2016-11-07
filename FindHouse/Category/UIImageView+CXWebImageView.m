//
//  UIImageView+CXWebImageView.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "UIImageView+CXWebImageView.h"

@implementation UIImageView (CXWebImageView)

- (void)cx_setImageWithUrlString:(NSString *)urlString ContentMode:(UIViewContentMode)contentMode
{
    NSURL *url = [NSURL URLWithString:[urlString cx_processImageUrlString]];
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    if ([manager diskImageExistsForURL:url])
    {
        self.contentMode = contentMode;
        self.image = [[manager imageCache] imageFromDiskCacheForKey:url.absoluteString];
    }else
    {
        WS(weakSelf);
        
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image)
            {
                weakSelf.contentMode = contentMode;
            }
        }];
    }
}

- (void)cx_setImageWithUrlString:(NSString *)urlString contentMode:(UIViewContentMode)contentMode placeholderImage:(UIImage *)placeholder
{
    NSURL *url = [NSURL URLWithString:[urlString cx_processImageUrlString]];
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    if ([manager diskImageExistsForURL:url])
    {
        self.contentMode = contentMode;
        self.image = [[manager imageCache] imageFromDiskCacheForKey:url.absoluteString];
    }else
    {
        WS(weakSelf);
        
        [self sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image)
            {
                weakSelf.contentMode = contentMode;
            }
        }];
    }
}

- (void)cx_setImageScaleToFillWithUrlString:(NSString *)urlString contentMode:(UIViewContentMode)contentMode completed:(SetImageCompleteBlock)setImageCompleteBlock
{
    NSURL *url = [NSURL URLWithString:[urlString cx_processImageUrlString]];
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    if ([manager diskImageExistsForURL:url])
    {
        self.contentMode = contentMode;
        self.image = [[manager imageCache] imageFromDiskCacheForKey:url.absoluteString];
        setImageCompleteBlock(self.image);
    }else
    {
        WS(weakSelf);
        
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            setImageCompleteBlock(image);
            if (image)
            {
                weakSelf.contentMode = contentMode;
            }
        }];
    }
}

@end
