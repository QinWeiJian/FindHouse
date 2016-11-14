//
//  UIPlaceHolderTextView.h
//  Kazubulou
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView<UITextViewDelegate>

@property(nonatomic, retain)UILabel *placeHolderLabel;
@property(nonatomic, retain)NSString *placeholder;
@property(nonatomic, retain)UIColor *placeholderColor;

- (void)textChanged:(NSNotification*)notification;

@end
