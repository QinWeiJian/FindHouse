//
//  CXUpImageFunctionView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXUpImageFunctionView : CXBaseView

@property(nonatomic,retain)CXBaseImageView *myImageView;
@property(nonatomic,retain)CXBaseLabel *myLabel;

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image text:(NSString *)text;

@end
