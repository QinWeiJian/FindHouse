//
//  CXSearchViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/21.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSearchViewController.h"
#import "CXSearchView.h"

@interface CXSearchViewController ()

@property(nonatomic,retain)CXBaseView *navigationBarView;
@property(nonatomic,retain)UIButton *rightButton;
@property(nonatomic,retain)CXSearchView *searchView;

@end

@implementation CXSearchViewController

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
        
        [_navigationBarView addSubview:self.searchView];
        [_navigationBarView addSubview:self.rightButton];
    }
    
    return _navigationBarView;
}

- (UIButton *)rightButton
{
    if (!_rightButton)
    {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width-50, StatusBarHeight, 50, NavigationBarHeight)];
        _rightButton.titleLabel.font = FontSize(14);
        [_rightButton setTitleColor:CX_WhiteColor forState:UIControlStateNormal];
        [_rightButton setTitle:@"取消" forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(backItemAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _rightButton;
}

- (CXSearchView *)searchView
{
    if (!_searchView)
    {
        _searchView = [[CXSearchView alloc] initWithFrame:CGRectMake(ViewMargin_10, StatusBarHeight+ViewMargin_5, self.rightButton.viewOriginX-ViewMargin_10, NavigationBarHeight-ViewMargin_10)];
        _searchView.layer.cornerRadius = _searchView.viewSizeHeight/2;
        _searchView.searchField.returnKeyType = UIReturnKeySearch;
    }
    
    return _searchView;
}

@end
