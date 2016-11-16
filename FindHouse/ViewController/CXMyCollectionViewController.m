//
//  CXMyCollectionViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/16.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXMyCollectionViewController.h"
#import "UITableViewRowAction+JZExtension.h"
#import "CXHouseListCell.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXMyCollectionViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)CXBaseTableView *myTableView;

@end

@implementation CXMyCollectionViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我的收藏";
    
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (CXBaseTableView *)myTableView
{
    if (!_myTableView)
    {
        _myTableView = [[CXBaseTableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-StatusNavigationBarHeight) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        [_myTableView registerClass:[CXHouseListCell class] forCellReuseIdentifier:cellIdentifier];
    }
    
    return _myTableView;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXHouseListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    WS(weakSelf);
    
    void(^rowActionHandler)(UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //        [weakSelf.myTableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationLeft];
    };
    
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault image:ImageWithNamed(@"cell_delete") handler:rowActionHandler];
    
    return @[action1];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
