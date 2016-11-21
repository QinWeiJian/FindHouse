//
//  CXMoreFilterCellView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/21.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXMoreFilterCellView.h"

@interface CXMoreFilterCellView ()

@property(nonatomic,retain)NSMutableArray *itemArray;

@end

@implementation CXMoreFilterCellView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title contentArray:(NSArray *)contentArray
{
    if (self = [super initWithFrame:frame])
    {
        self.contentArray = contentArray;
        self.titleLabel.text = title;
        
        [self addSubview:self.titleLabel];
        
        [self createItems];
    }
    
    return self;
}

#pragma mark -

- (void)createItems
{
    UIButton *tagButton;
    
    CGFloat lastViewDistanceX = ViewMargin_10;
    CGFloat lastViewDistanceY = self.titleLabel.viewDistanceY;
    
    CGFloat itemWith = (self.viewSizeWidth-ViewMargin_10*5)/4;
    CGFloat itemHeight = 30;
    
    for (int i = 1; i <= self.contentArray.count; i++)
    {
//        NSString *contentString = [self.contentArray objectAtIndex:i];
//        CGSize contentSize = [contentString cx_sizeWithFont:FontSize(13) ContentMargin:ViewMargin_Double_10];
//        
//        if ((Screen_Width - tagButton.viewDistanceX - ViewMargin_Double_10) < contentSize.width)
//        {
//            lastViewDistanceX = ViewMargin_10;
//            lastViewDistanceY = tagButton.viewDistanceY+ViewMargin_10;
//        }else
//        {
//            lastViewDistanceX = tagButton.viewDistanceX+ViewMargin_10;
//        }
        
        tagButton = [[UIButton alloc] initWithFrame:CGRectMake(lastViewDistanceX, lastViewDistanceY, itemWith, itemHeight)];
        tagButton.titleLabel.font = FontSize(12);
        tagButton.backgroundColor = CX_WhiteColor;
        tagButton.layer.cornerRadius = 5;
        tagButton.layer.borderWidth = 0.5;
        tagButton.layer.borderColor = CX_LightGrayColor.CGColor;
        [tagButton setTitle:[self.contentArray objectAtIndex:i-1] forState:UIControlStateNormal];
        [tagButton setTitleColor:CX_BlackColor forState:UIControlStateNormal];
        [tagButton setTitleColor:CX_WhiteColor forState:UIControlStateSelected];
        [tagButton addTarget:self action:@selector(tagAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i % 4 == 0)
        {
            lastViewDistanceX = ViewMargin_10;
            lastViewDistanceY += ViewMargin_10+itemHeight;
        }else
        {
            lastViewDistanceX += itemWith+ViewMargin_10;
        }
        
        [self addSubview:tagButton];
        
        [self.itemArray addObject:tagButton];
    }

    self.height = tagButton.viewDistanceY+ViewMargin_10;
}

- (void)resetItem
{
    for (UIButton *button in self.itemArray)
    {
        button.selected = NO;
        button.backgroundColor = CX_WhiteColor;
    }
}

#pragma mark - Getter

- (NSMutableArray *)itemArray
{
    if (!_itemArray)
    {
        _itemArray = [[NSMutableArray alloc] init];
    }
    
    return _itemArray;
}

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, 0, self.viewSizeWidth-ViewMargin_Double_10, 45)];
        _titleLabel.font = FontSize(12);
    }
    
    return _titleLabel;
}

#pragma mark - Action

- (void)tagAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected)
    {
        sender.backgroundColor = CX_ThemeGreenColor;
    }else
    {
        sender.backgroundColor = CX_WhiteColor;
    }
}

@end
