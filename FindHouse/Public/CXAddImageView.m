//
//  CXAddImageView.m
//  Bolema
//
//  Created by chengxikeji on 16/8/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXAddImageView.h"
#import "CXAddImageSingleView.h"

#define ImageWidth(rowCount) (self.viewSizeWidth-ViewMargin_10*(rowCount+1))/rowCount
#define ViewTag 10024

@interface CXAddImageView ()

@property(nonatomic,retain)UIButton *addButton;

@end

@implementation CXAddImageView

- (id)initWithFrame:(CGRect)frame maxImageCount:(NSInteger)maxImageCount rowImageCount:(NSInteger)rowImageCount
{
    if (self = [super initWithFrame:frame])
    {
        self.userInteractionEnabled = YES;
        
        self.maxImageCount = maxImageCount;
        self.rowImageCount = rowImageCount;
        
        [self layoutFrames];
    }
    
    return self;
}

- (void)addImage:(UIImage *)image
{
    CXAddImageSingleView *imageView = [[CXAddImageSingleView alloc] initWithFrame:CGRectMake(0, 0, ImageWidth(self.rowImageCount), ImageWidth(self.rowImageCount))];
    imageView.image = image;
    [imageView.deleteButton addTarget:self action:@selector(deleteImageAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.singleImageViewArray addObject:imageView];
    
    [self layoutFrames];
}

- (void)addImages:(NSArray *)imagesArray
{
    for (int i = 0; i < imagesArray.count; i++)
    {
        CXAddImageSingleView *imageView = [[CXAddImageSingleView alloc] initWithFrame:CGRectMake(0, 0, ImageWidth(self.rowImageCount), ImageWidth(self.rowImageCount))];
        imageView.image = [imagesArray objectAtIndex:i];
        [imageView.deleteButton addTarget:self action:@selector(deleteImageAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.singleImageViewArray addObject:imageView];
    }
    
    [self layoutFrames];
}

- (void)layoutFrames
{
    for (UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
    
    /**图片*/
    CGFloat orignY = ViewMargin_10;
    CGFloat orignX = ViewMargin_10;
    CGFloat imageWidth = ImageWidth(self.rowImageCount);
    
    CXAddImageSingleView *singleView;
    for (int i = 1; i <=  self.singleImageViewArray.count; i++)
    {
        singleView = [self.singleImageViewArray objectAtIndex:i-1];
        singleView.frame = CGRectMake(orignX, orignY, imageWidth, imageWidth);
        singleView.deleteButton.tag = ViewTag+i-1;
        [self addSubview:singleView];
        
        if (i % self.rowImageCount == 0)
        {
            orignX = ViewMargin_10;
            orignY += ViewMargin_10+imageWidth;
        }else
        {
            orignX += imageWidth+ViewMargin_10;
        }
    }
    
    if (self.singleImageViewArray.count < self.maxImageCount)
    {
        self.addButton.frame = CGRectMake(orignX, orignY, imageWidth, imageWidth);
        [self addSubview:self.addButton];
        
        self.contentSize = CGSizeMake(self.viewSizeWidth, self.addButton.viewDistanceY);
        
        self.height = self.addButton.viewDistanceY+ViewMargin_10;
    }else
    {
        self.contentSize = CGSizeMake(self.viewSizeWidth, singleView.viewDistanceY);
        
        self.height = singleView.viewDistanceY+ViewMargin_10;
    }
}

#pragma mark - Getter

- (NSMutableArray *)singleImageViewArray
{
    if (!_singleImageViewArray)
    {
        _singleImageViewArray = [[NSMutableArray alloc] init];
    }
    
    return _singleImageViewArray;
}

- (UIButton *)addButton
{
    if (!_addButton)
    {
        _addButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _addButton.backgroundColor = [UIColor clearColor];
        [_addButton setImage:[UIImage imageNamed:@"uploadImage_add"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(addImageAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _addButton;
}

#pragma mark - Acton

- (void)addImageAction
{
    if ([self.delegate respondsToSelector:@selector(cx_addImageViewAddAction:)])
    {
        [self.delegate cx_addImageViewAddAction:self];
    }
}

- (void)deleteImageAction:(UIButton *)sender
{
    [self.singleImageViewArray removeObjectAtIndex:sender.tag-ViewTag];
    
    [self layoutFrames];
    
    if ([self.delegate respondsToSelector:@selector(cx_addImageViewDidDeleteImage:)])
    {
        [self.delegate cx_addImageViewDidDeleteImage:self];
    }
}


@end
