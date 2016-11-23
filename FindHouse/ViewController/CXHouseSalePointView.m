//
//  CXHouseSalePointView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHouseSalePointView.h"

@interface CXHouseSalePointView ()

@property(nonatomic,retain)NSMutableArray *itemArray;

@end

@implementation CXHouseSalePointView

- (id)initWithFrame:(CGRect)frame objectsArray:(NSArray *)objectsArray
{
    if (self = [super initWithFrame:frame])
    {
        self.objectsArray = objectsArray;
        
        [self createItems];
    }
    
    return self;
}

#pragma mark - Private

- (void)createItems
{
    UIButton *tagButton;
    
    CGFloat lastViewDistanceX = ViewMargin_10;
    CGFloat lastViewDistanceY = ViewMargin_10;
    
    CGFloat itemWith = (self.viewSizeWidth-ViewMargin_10*5)/4;
    CGFloat itemHeight = 30;
    
    for (int i = 1; i <= self.objectsArray.count; i++)
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
        [tagButton setTitle:[self.objectsArray objectAtIndex:i-1] forState:UIControlStateNormal];
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

#pragma mark - Getter

- (NSMutableArray *)itemArray
{
    if (!_itemArray)
    {
        _itemArray = [[NSMutableArray alloc] init];
    }
    
    return _itemArray;
}

#pragma mark - Action

- (void)tagAction:(UIButton *)sender
{
    
}

@end
