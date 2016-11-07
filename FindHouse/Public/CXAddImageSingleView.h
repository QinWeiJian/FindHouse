//
//  CXAddImageSingleView.h
//  Bolema
//
//  Created by chengxikeji on 16/8/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXAddImageSingleView : UIImageView

@property(nonatomic,retain)UIButton *deleteButton;
@property(nonatomic,retain)UIActivityIndicatorView *indicatorView;
@property(nonatomic,retain)UIButton *failButton;
@property(nonatomic,retain)NSString *uploadImageString;

@property(nonatomic,retain)NSURLSessionDataTask *uploadOperation;

@end
