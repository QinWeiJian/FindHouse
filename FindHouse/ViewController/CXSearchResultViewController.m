//
//  CXSearchResultViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/22.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSearchResultViewController.h"
#import "CXSearchHouseCell.h"
#import "CXHouseDetailViewController.h"

#define CellImageHeight (5*Screen_Width)/9

#define CellHeight CellImageHeight+60

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXSearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)CXBaseTableView *myTableView;

@end

@implementation CXSearchResultViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
        
        [_myTableView registerClass:[CXSearchHouseCell class] forCellReuseIdentifier:cellIdentifier];
        
        _myTableView.mj_header = [self cx_getRefreshHeaderWithTarget:self refreshingAction:@selector(headerRefreshing)];
        
        _myTableView.mj_footer = [self cx_getRefreshFooterWithTarget:self refreshingAction:@selector(footerRefreshing)];
    }
    
    return _myTableView;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXSearchHouseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ViewMargin_10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CXHouseDetailViewController *detailVC = [[CXHouseDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Refreshing

- (void)headerRefreshing
{
    
}

- (void)footerRefreshing
{
    [self.myTableView.mj_footer endRefreshingWithNoMoreData];
}

@end
