//
//  CXLoginInputView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXLoginInputView : CXBaseView

@property(nonatomic,retain)CXBaseImageView *tapImageView;
@property(nonatomic,retain)CXInsetsField *inputField;
@property(nonatomic,retain)UIButton *codeButton;

@property(nonatomic,assign)BOOL needCode;

- (id)initWithFrame:(CGRect)frame tapImage:(UIImage *)tapImage placeholder:(NSString *)placeholder needCode:(BOOL)needCode;

@end
