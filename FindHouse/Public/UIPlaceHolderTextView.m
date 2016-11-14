//
//  UIPlaceHolderTextView.m
//  Kazubulou
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIPlaceHolderTextView.h"

@implementation UIPlaceHolderTextView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_placeHolderLabel release]; _placeHolderLabel = nil;
    [_placeholderColor release]; _placeholderColor = nil;
    [_placeholder release]; _placeholder = nil;
    
    [super dealloc];
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setPlaceholder:@""];
    
    [self setPlaceholderColor:[UIColor lightGrayColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    if( (self = [super initWithFrame:frame]))
    {
        
        [self setPlaceholder:@""];
        self.delegate = self;
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    
    return self;
}



- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        
        return;
        
    }
    
    
    
    if([[self text] length] == 0)
        
    {
        
        [[self viewWithTag:999] setAlpha:1];
        
    }
    
    else
        
    {
        
        [[self viewWithTag:999] setAlpha:0];
        
    }
    
}



- (void)setText:(NSString *)text {
    
    [super setText:text];
    
    [self textChanged:nil];
    
}



- (void)drawRect:(CGRect)rect

{
    
    if( [[self placeholder] length] > 0 )
        
    {
        
        if ( _placeHolderLabel == nil )
            
        {
            
            _placeHolderLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(5,8,self.bounds.size.width - 16,0)];
            
//            _placeHolderLabel.lineBreakMode = UILineBreakModeWordWrap;
            
            _placeHolderLabel.numberOfLines = 0;
            
            _placeHolderLabel.font = self.font;
            
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            
            _placeHolderLabel.textColor = self.placeholderColor;
            
            _placeHolderLabel.alpha = 0;
            
            _placeHolderLabel.tag = 999;
            
            [self addSubview:_placeHolderLabel];
            
        }
        
        
        
        _placeHolderLabel.text = self.placeholder;
        
        [_placeHolderLabel sizeToFit];
        
        [self sendSubviewToBack:_placeHolderLabel];
        
    }
    
    
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
        
    {
        
        [[self viewWithTag:999] setAlpha:1];
        
    }
    
    
    
    [super drawRect:rect];
    
}

//隐藏键盘，实现UITextViewDelegate

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        return NO;
        
    }
    
    return YES;  
    
}

@end
