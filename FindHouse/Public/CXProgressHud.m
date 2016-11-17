//
//  CXProgressHud.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXProgressHud.h"

@interface CXProgressHud ()

@property(nonatomic,retain)UIControl *bgControl;

@property(nonatomic,retain)CXBaseImageView *progressImageView;

@end

@implementation CXProgressHud

- (id)initWithView:(UIView *)view progressText:(NSString *)progressText
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor clearColor];
        
        self.frame = view.bounds;
        
        self.progressLabel.text = progressText;
        
        [view addSubview:self];
//        [self addSubview:self.bgControl];
        [self addSubview:self.progressImageView];
        [self addSubview:self.progressLabel];
        
        [self layouySubFrames];
    }
    
    return self;
}

- (void)layouySubFrames
{
    self.progressImageView.frame = CGRectMake(self.viewSizeWidth/2-self.progressImageView.viewSizeWidth/2, self.viewSizeHeight/2-(self.progressImageView.viewSizeHeight+40)/2, self.progressImageView.viewSizeWidth, self.progressImageView.viewSizeHeight);
    
    self.progressLabel.frame = CGRectMake(0, self.progressImageView.viewDistanceY, self.viewSizeWidth, 40);
}

- (void)show
{
//    WS(weakSelf);
//    
//    [UIView animateWithDuration:0.2 animations:^{
//        weakSelf.bgControl.alpha = 0.4;
//    }];
    
    [self.progressImageView startAnimating];
}

- (void)hide
{
//    WS(weakSelf);
//    
//    [UIView animateWithDuration:0.2 animations:^{
//        weakSelf.bgControl.alpha = 0;
//    }completion:^(BOOL finished) {
//        [weakSelf removeFromSuperview];
//    }];
    
    [self.progressImageView stopAnimating];
    
    [self removeFromSuperview];
}

#pragma mark - Getter

- (UIControl *)bgControl
{
    if (!_bgControl)
    {
        _bgControl = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeWidth, self.viewSizeHeight)];
        _bgControl.backgroundColor = [UIColor blackColor];
        _bgControl.alpha = 0;
        //        [_bgControl addTarget:self action:@selector(hideAlert) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _bgControl;
}

- (CXBaseImageView *)progressImageView
{
    if (!_progressImageView)
    {
        UIImage *image = ImageWithNamed(@"loading_1");
        
        NSMutableArray *imageArray = [NSMutableArray array];
        
        for (int i = 0; i < 15; i++)
        {
            NSString *imageString = [NSString stringWithFormat:@"loading_%d",i+1];
            
            [imageArray addObject:ImageWithNamed(imageString)];
        }
        
        _progressImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _progressImageView.animationImages = imageArray;
        _progressImageView.animationDuration = 0.64f;
    }
    
    return _progressImageView;
}

- (CXBaseLabel *)progressLabel
{
    if (!_progressLabel)
    {
        _progressLabel = [[CXBaseLabel alloc] initWithFrame:CGRectZero];
        _progressLabel.font = FontSize(12);
        _progressLabel.textAlignment = 1;
        _progressLabel.textColor = CX_LightGrayColor;
    }
    
    return _progressLabel;
}

@end
