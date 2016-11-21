//
//  CXHouseMoreFilterView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/21.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHouseMoreFilterView.h"
#import "CXMoreFilterCellView.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXHouseMoreFilterView ()

@property(nonatomic,retain)CXBaseView *footerView;

@property(nonatomic,retain)NSMutableArray *viewsArray;

@end

@implementation CXHouseMoreFilterView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.backgroundColor = CX_WhiteColor;
        
        [self registerClass:[CXBaseTableViewCell class] forCellReuseIdentifier:cellIdentifier];
        
        [self createCellViews];
    }
    
    return self;
}

#pragma mark - Private

- (void)createCellViews
{
    for (int i = 0; i < 5; i++)
    {
        CXMoreFilterCellView *cellView = [[CXMoreFilterCellView alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeWidth, 0) title:@"装修" contentArray:@[@"豪华",@"豪华",@"豪华",@"豪华",@"豪华"]];
        [self.viewsArray addObject:cellView];
    }
    
    [self reloadData];
}

#pragma mark - Getter

- (NSMutableArray *)viewsArray
{
    if (!_viewsArray)
    {
        _viewsArray = [[NSMutableArray alloc] init];
    }
    
    return _viewsArray;
}

- (CXBaseView *)footerView
{
    if (!_footerView)
    {
        _footerView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, 0, self.viewSizeWidth, 55)];
        
        [_footerView addSubview:self.commitButton];
        [_footerView addSubview:self.resetButton];
    }
    
    return _footerView;
}

- (UIButton *)commitButton
{
    if (!_commitButton)
    {
        _commitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.viewSizeWidth/2-ViewMargin_5-100, ViewMargin_10, 100, self.footerView.viewSizeHeight-ViewMargin_Double_10)];
        _commitButton.layer.cornerRadius = 5;
        _commitButton.layer.masksToBounds = YES;
        _commitButton.layer.borderWidth = 0.5;
        _commitButton.layer.borderColor = CX_OrangeColor.CGColor;
        _commitButton.titleLabel.font = FontSize(14);
        [_commitButton setTitle:@"确定" forState:UIControlStateNormal];
        [_commitButton setTitleColor:CX_OrangeColor forState:UIControlStateNormal];
    }
    
    return _commitButton;
}

- (UIButton *)resetButton
{
    if (!_resetButton)
    {
        _resetButton = [[UIButton alloc] initWithFrame:CGRectMake(self.commitButton.viewDistanceX+ViewMargin_10, self.commitButton.viewOriginY, self.commitButton.viewSizeWidth, self.commitButton.viewSizeHeight)];
        _resetButton.layer.cornerRadius = 5;
        _resetButton.layer.masksToBounds = YES;
        _resetButton.layer.borderWidth = 0.5;
        _resetButton.layer.borderColor = CX_LightGrayColor.CGColor;
        _resetButton.titleLabel.font = FontSize(14);
        [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
        [_resetButton setTitleColor:CX_BlackColor forState:UIControlStateNormal];
        [_resetButton addTarget:self action:@selector(resetAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _resetButton;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    [cell.contentView addSubview:[self.viewsArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [self.viewsArray objectAtIndex:indexPath.row];
    
    return view.viewSizeHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.footerView.viewSizeHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return self.footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Action

- (void)resetAction
{
    for (CXMoreFilterCellView *cellView in self.viewsArray)
    {
        [cellView resetItem];
    }
}

@end
