//
//  CXMineViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXMineViewController.h"
#import "CXMineHeaderView.h"
#import "CXMineNormalCell.h"

#define BannerHeight (5*Screen_Width)/9

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXMineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)CXBaseTableView *myTableView;

@property(nonatomic,retain)CXMineHeaderView *headerView;

@property(nonatomic,retain)NSArray *titleArray;
@property(nonatomic,retain)NSArray *imageArray;

@end

@implementation CXMineViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleArray = [NSArray arrayWithObjects:@"我的收藏",@"我的房源",@"关于我们",@"意见反馈",@"设置", nil];
    
    self.imageArray = [NSArray arrayWithObjects:ImageWithNamed(@"mine_myCollect"),ImageWithNamed(@"mine_myHouse"),ImageWithNamed(@"mine_aboutUs"),ImageWithNamed(@"mine_feedback"),ImageWithNamed(@"mine_setting"), nil];
    
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
        _myTableView = [[CXBaseTableView alloc] initWithFrame:CGRectMake(0, -20, Screen_Width, Screen_Height-TabBarHeight+20) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        [_myTableView registerClass:[CXMineNormalCell class] forCellReuseIdentifier:cellIdentifier];
    }
    
    return _myTableView;
}

- (CXMineHeaderView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[CXMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, BannerHeight)];
        
        _headerView.backgroundColor = [UIColor blackColor];
    }
    
    return _headerView;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXMineNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (indexPath.section == 0)
    {
        cell.myLabel.text = [self.titleArray objectAtIndex:indexPath.row];
        cell.myImageView.image = [self.imageArray objectAtIndex:indexPath.row];
    }else
    {
        cell.myLabel.text = [self.titleArray objectAtIndex:indexPath.row+2];
        cell.myImageView.image = [self.imageArray objectAtIndex:indexPath.row+2];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return BannerHeight;
    }
    return ViewMargin_10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.headerView;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
