//
//  CXSegmentView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSegmentView.h"

@interface CXSegmentView()

@property(nonatomic,retain)NSArray *dataSource;
@property(nonatomic,retain)UIView *selectView;

@property(nonatomic,assign)NSInteger selectedIndex;

@property(nonatomic,retain)NSMutableArray *itemArray;

@end

@implementation CXSegmentView

- (id)initWithFrame:(CGRect)frame objects:(NSArray *)objects
{
    if (self = [super initWithFrame:frame])
    {
        self.dataSource = objects;
        self.selectedIndex = 0;
        
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews
{
    for (int i = 0; i < self.dataSource.count; i++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.viewSizeWidth/self.dataSource.count)*i, 0, self.viewSizeWidth/self.dataSource.count, self.viewSizeHeight)];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:[self.dataSource objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:CX_LightGrayColor forState:UIControlStateNormal];
        [button setTitleColor:CX_WhiteColor forState:UIControlStateSelected];
        button.tag = ButtonTag+i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.itemArray addObject:button];
        
        if (i == 0)
        {
            button.selected = YES;
        }
    }
    
    [self addSubview:self.selectView];
}

#pragma mark - Getter

- (UIView *)selectView
{
    if (!_selectView)
    {
        _selectView = [[UIView alloc] initWithFrame:CGRectMake((self.viewSizeWidth/self.dataSource.count-30)/2, self.viewSizeHeight-2, 30, 2)];
        _selectView.backgroundColor = CX_WhiteColor;
    }
    
    return _selectView;
}

- (NSMutableArray *)itemArray
{
    if (!_itemArray)
    {
        _itemArray = [[NSMutableArray alloc] init];
    }
    
    return _itemArray;
}

#pragma mark - Action

- (void)buttonAction:(UIButton *)sender
{
    if (self.selectedIndex != sender.tag-ButtonTag)
    {
        WS(weakSelf);
        [UIView animateWithDuration:0.2 animations:^{
            CGPoint selectCenter = weakSelf.selectView.center;
            selectCenter.x = sender.center.x;
            weakSelf.selectView.center = selectCenter;
        }];
        
        [self clearButtonState];
        
        sender.selected = YES;
        
        self.selectedIndex = sender.tag - ButtonTag;
        
        if ([self.delegate respondsToSelector:@selector(cx_segmentView:didSelectedWithIndex:)])
        {
            [self.delegate cx_segmentView:self didSelectedWithIndex:self.selectedIndex];
        }
    }
}

#pragma mark - Private Method

- (void)clearButtonState
{
    for (UIButton *button in self.itemArray)
    {
        button.selected = NO;
    }
}

@end
