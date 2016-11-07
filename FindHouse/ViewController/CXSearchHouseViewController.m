//
//  CXSearchHouseViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSearchHouseViewController.h"
#import "CXSearchView.h"

@interface CXSearchHouseViewController ()

@property(nonatomic,retain)CXBaseView *navigationBarView;
@property(nonatomic,retain)UIButton *backButton;
@property(nonatomic,retain)UIButton *mapButton;
@property(nonatomic,retain)CXSearchView *searchView;

@end

@implementation CXSearchHouseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.navigationBarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (CXBaseView *)navigationBarView
{
    if (!_navigationBarView)
    {
        _navigationBarView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, StatusNavigationBarHeight)];
        _navigationBarView.backgroundColor = CX_ThemeGreenColor;
        
        [_navigationBarView addSubview:self.backButton];
        [_navigationBarView addSubview:self.mapButton];
        [_navigationBarView addSubview:self.searchView];
    }
    
    return _navigationBarView;
}

- (UIButton *)backButton
{
    if (!_backButton)
    {
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, StatusBarHeight, NavigationBarHeight, NavigationBarHeight)];
        [_backButton setImage:ImageWithNamed(@"navigationBar_back") forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backItemAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backButton;
}

- (UIButton *)mapButton
{
    if (!_mapButton)
    {
        _mapButton = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width-NavigationBarHeight, StatusBarHeight, NavigationBarHeight, NavigationBarHeight)];
        [_mapButton setImage:ImageWithNamed(@"navigationBar_map") forState:UIControlStateNormal];
//        [_mapButton addTarget:self action:@selector(backItemAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _mapButton;
}

- (CXSearchView *)searchView
{
    if (!_searchView)
    {
        _searchView = [[CXSearchView alloc] initWithFrame:CGRectMake(self.backButton.viewDistanceX, StatusBarHeight+ViewMargin_5, self.mapButton.viewOriginX-self.backButton.viewDistanceX, NavigationBarHeight-ViewMargin_10)];
    }
    
    return _searchView;
}

@end
