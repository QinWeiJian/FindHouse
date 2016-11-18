//
//  CXHomeViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHomeViewController.h"
#import "CXHomeNavigationBarView.h"
#import "CXHomeSearchView.h"
#import "RunImageScrollView.h"
#import "CXHomeFunctionCell.h"
#import "CXHomeCityMarketCell.h"
#import "CXSearchHouseViewController.h"
#import "CXOpenCityViewController.h"
#import "CXCalculatorViewController.h"

#define BannerHeight (5*Screen_Width)/9

#define RunImageViewHeight (6*Screen_Width)/16

static NSString *functionIdentifier = @"functionIdentifier";
static NSString *marketIdentifier = @"marketIdentifier";

@interface CXHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)CXHomeNavigationBarView *navigationBarView;

@property(nonatomic,retain)CXBaseTableView *myTableView;

@property(nonatomic,retain)CXBaseView *headerView;

@property(nonatomic,retain)CXHomeSearchView *searchView;

@property(nonatomic,retain)RunImageScrollView *runImageView;

@end

@implementation CXHomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.myTableView];
    
    [self.view addSubview:self.navigationBarView];
    
    [self.view addSubview:self.searchView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (CXHomeNavigationBarView *)navigationBarView
{
    if (!_navigationBarView)
    {
        _navigationBarView = [[CXHomeNavigationBarView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, StatusNavigationBarHeight)];
        
        UIControl *control = [[UIControl alloc] initWithFrame:_navigationBarView.locateView.frame];
        [control addTarget:self action:@selector(cityAction) forControlEvents:UIControlEventTouchUpInside];
        [_navigationBarView addSubview:control];
    }
    
    return _navigationBarView;
}

- (CXBaseTableView *)myTableView
{
    if (!_myTableView)
    {
        _myTableView = [[CXBaseTableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-TabBarHeight) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        _myTableView.contentInset = UIEdgeInsetsMake(BannerHeight, 0, 0, 0);
        [_myTableView addSubview:self.headerView];
        
        [_myTableView registerClass:[CXHomeFunctionCell class] forCellReuseIdentifier:functionIdentifier];
        
        [_myTableView registerClass:[CXHomeCityMarketCell class] forCellReuseIdentifier:marketIdentifier];
    }
    
    return _myTableView;
}

- (CXBaseView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, -BannerHeight, Screen_Width, BannerHeight)];
        
        _headerView.backgroundColor = [UIColor blackColor];
    }
    
    return _headerView;
}

- (CXHomeSearchView *)searchView
{
    if (!_searchView)
    {
        _searchView = [[CXHomeSearchView alloc] initWithFrame:CGRectMake(ViewMargin_10*3, BannerHeight-ViewMargin_10-(NavigationBarHeight-ViewMargin_10), Screen_Width-ViewMargin_10*6, NavigationBarHeight-ViewMargin_10)];
        _searchView.backgroundColor = [UIColor whiteColor];
        
        [_searchView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchAction)]];
    }
    
    return _searchView;
}

- (RunImageScrollView *)runImageView
{
    if (!_runImageView)
    {
        _runImageView = [[RunImageScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, RunImageViewHeight) ContentMode:UIViewContentModeScaleAspectFill NeedRun:YES];
    }
    
    return _runImageView;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        CXHomeFunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:functionIdentifier];
        
        WS(weakSelf);
        
        cell.didSelectedBlock = ^(NSInteger index){
            [weakSelf functionDidSelected:index];
        };
        
        return cell;
    }
    
    CXHomeCityMarketCell *cell = [tableView dequeueReusableCellWithIdentifier:marketIdentifier];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 200;
    }
    return 110;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.1;
    }
    return RunImageViewHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return self.runImageView;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    
    CGFloat searchY = BannerHeight-ViewMargin_10-(NavigationBarHeight-ViewMargin_10)-y-BannerHeight;
    
//    CGFloat searchY = BannerHeight-ViewMargin_10-(NavigationBarHeight-ViewMargin_10)-y-20-BannerHeight;
    
    CGFloat searchBX = ViewMargin_10*3;
    
    CGFloat searchEX = self.navigationBarView.locateView.viewDistanceX+ViewMargin_10;
    
    CGFloat searchDX = searchEX - searchBX;
    
    CGFloat searchDY = BannerHeight-ViewMargin_10-(NavigationBarHeight-ViewMargin_10) - (StatusBarHeight+ViewMargin_5);
    
    CGFloat rateLeft = searchDX/(searchDY);
    
//    CGFloat rateLeft = searchDX/(searchDY-20);
    
//    CGFloat rateRight = (Screen_Width - ViewMargin_10 * 6 - (Screen_Width - ViewMargin_10 - searchEX))/(searchDY-20);
    
    CGFloat rateRight = (Screen_Width - ViewMargin_10 * 6 - (Screen_Width - ViewMargin_10 - searchEX))/(searchDY);
    
    if (searchY <= StatusBarHeight+ViewMargin_5)
    {
        self.searchView.y = StatusBarHeight+ViewMargin_5;
        
        self.searchView.x = searchEX;
        self.searchView.width = Screen_Width - ViewMargin_10 - self.searchView.x;
    }else
    {
        self.searchView.y = searchY;
        
        if (y > -BannerHeight)
        {
            self.searchView.x = rateLeft*(y+BannerHeight)+30;
            
            self.searchView.width = Screen_Width - ViewMargin_10 * 6 - rateRight*(y+BannerHeight);
        }else
        {
            self.searchView.x = 30;
            
            self.searchView.width = Screen_Width - ViewMargin_10 * 6;
        }
    }
    
    if (y >= -BannerHeight)
    {
        self.navigationBarView.backgroundView.alpha = 0.005*(y+BannerHeight);
        
        self.navigationBarView.locateView.alpha = 0.5 - 0.005*(y+BannerHeight);
    }else
    {
        self.navigationBarView.backgroundView.alpha = 0;
        
        self.navigationBarView.locateView.alpha = 0.5;
    }
    
    if (y <= -BannerHeight)
    {
        self.headerView.y = y;
        self.headerView.height = -y;
        
        _myTableView.contentInset = UIEdgeInsetsMake(BannerHeight, 0, 0, 0);
    }else if (y <= 0)
    {
        _myTableView.contentInset = UIEdgeInsetsMake(BannerHeight, 0, 0, 0);
    }else
    {
        _myTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

#pragma mark - Action

- (void)searchAction
{
    CXSearchHouseViewController *searchVC = [[CXSearchHouseViewController alloc] init];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)cityAction
{
    CXOpenCityViewController *cityVC = [[CXOpenCityViewController alloc] init];
    
    CXBaseNavigationController *cityNav = [[CXBaseNavigationController alloc] initWithRootViewController:cityVC];
    
    [self presentViewController:cityNav animated:YES completion:^{
        
    }];
}

#pragma mark - Private Method

- (void)functionDidSelected:(NSInteger)index
{
    switch (index)
    {
        case 0:
        {
            
        }
            break;
            
        case 1:
        {
            
        }
            break;
            
        case 2:
        {
            
        }
            break;
            
        case 3:
        {
            
        }
            break;
            
        case 4:
        {
            CXCalculatorViewController *calculatorVC = [[CXCalculatorViewController alloc] init];
            calculatorVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:calculatorVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
