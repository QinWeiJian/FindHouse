//
//  CXInsetsField.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXInsetsField.h"

@interface CXInsetsField ()<UITextFieldDelegate>

@property(nonatomic,assign)CGFloat margin;

@end

@implementation CXInsetsField

- (id)initWithFrame:(CGRect)frame
{
    if (self = [self initWithFrame:frame margin:0])
    {
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame margin:(CGFloat)margin
{
    if (self = [super initWithFrame:frame])
    {
        _margin = margin;
        self.delegate = self;
        self.textColor = CX_BlackColor;
        self.font = [UIFont systemFontOfSize:14];
        self.backgroundColor = [UIColor clearColor];
//        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset( bounds , _margin , 0 );
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset( bounds , _margin , 0 );
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
