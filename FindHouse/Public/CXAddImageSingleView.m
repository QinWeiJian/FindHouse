//
//  CXAddImageSingleView.m
//  Bolema
//
//  Created by chengxikeji on 16/8/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXAddImageSingleView.h"

@implementation CXAddImageSingleView

- (void)dealloc
{
    [self.uploadOperation cancel];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.userInteractionEnabled = YES;
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews
{
    [self addSubview:self.deleteButton];
    [self insertSubview:self.indicatorView belowSubview:self.deleteButton];
    [self insertSubview:self.failButton belowSubview:self.deleteButton];
}

#pragma mark - Getter

- (UIButton *)deleteButton
{
    if (!_deleteButton)
    {
        UIImage *deleteImage = ImageWithNamed(@"uploadImage_delete");;
        
        _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(self.viewSizeWidth-deleteImage.size.width, 0, deleteImage.size.width, deleteImage.size.height)];
        [_deleteButton setImage:deleteImage forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _deleteButton;
}

- (UIActivityIndicatorView *)indicatorView
{
    if (!_indicatorView)
    {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _indicatorView.frame = self.bounds;
        _indicatorView.hidden = YES;
    }
    
    return _indicatorView;
}

- (UIButton *)failButton
{
    if (!_failButton)
    {
        _failButton = [[UIButton alloc] initWithFrame:self.bounds];
        [_failButton setImage:ImageWithNamed(@"uploadImage_fail") forState:UIControlStateNormal];
        [_failButton addTarget:self action:@selector(failAction) forControlEvents:UIControlEventTouchUpInside];
        _failButton.hidden = YES;
    }
    
    return _failButton;
}

#pragma mark - Setter

- (void)setImage:(UIImage *)image
{
    [super setImage:image];
    
    [self uploadImage];
}

- (void)uploadImage
{
    self.indicatorView.hidden = NO;
    self.failButton.hidden = YES;
    [self.indicatorView startAnimating];
    
//    WS(weakSelf);
    
//    self.uploadOperation = [CXGetDataTool cx_uploadImageWithImage:self.image sub:@"Posts/" success:^(id JSON, NSURLSessionDataTask *operation) {
//        [weakSelf.indicatorView stopAnimating];
//        weakSelf.indicatorView.hidden = YES;
//        
//        NSLog(@"%@",JSON);
//        
//        NSInteger code = [[NSString stringWithFormat:@"%@",[JSON objectForKey:@"code"]] integerValue];
//        
//        if (code == CX_RequestCode_200)
//        {
//            NSDictionary *resultDict = [JSON objectForKey:@"result"];
//            NSString *imageString = [NSString stringWithFormat:@"%@",[resultDict objectForKey:@"src"]];
//            
//            weakSelf.uploadImageString = imageString;
//        }else
//        {
//            weakSelf.failButton.hidden = NO;
//        }
//    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
//        [weakSelf.indicatorView stopAnimating];
//        weakSelf.indicatorView.hidden = YES;
//        weakSelf.failButton.hidden = NO;
//    }];
}

#pragma mark - Action

- (void)failAction
{
    [self uploadImage];
}

- (void)deleteAction
{
    [self.uploadOperation cancel];
}


@end
