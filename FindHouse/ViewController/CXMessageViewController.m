//
//  CXMessageViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXMessageViewController.h"
#import "CXMessageNormalCell.h"
#import "CXLoginViewController.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)CXBaseTableView *myTableView;

@end

@implementation CXMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"消息";
    
    [self.view addSubview:self.myTableView];
    
    self.navigationItem.leftBarButtonItem = nil;
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
        _myTableView = [[CXBaseTableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-TabBarHeight-StatusNavigationBarHeight) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        [_myTableView registerClass:[CXMessageNormalCell class] forCellReuseIdentifier:cellIdentifier];
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
    CXMessageNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CXLoginViewController *loginVC = [[CXLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:^{
        
    }];
}


@end
