//
//  CXSearchViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/21.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSearchViewController.h"
#import "CXSearchView.h"

#define CellHeight 45

static NSString *searchCellIdentifier = @"searchCellIdentifier";

@interface CXSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property(nonatomic,retain)CXBaseView *navigationBarView;
@property(nonatomic,retain)UIButton *rightButton;
@property(nonatomic,retain)CXSearchView *searchView;

@property(nonatomic,retain)CXBaseTableView *searchTableView;

@property(nonatomic,retain)CXInsetsField *searchHistoryTitleField;
@property(nonatomic,retain)CXBaseView *clearView;
@property(nonatomic,retain)UIButton *clearButton;

@property(nonatomic,retain)NSMutableArray *historyArray;
@property(nonatomic,retain)NSString *searchString;

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
    
    [self getHistory];
    
    [self.view addSubview:self.navigationBarView];
    [self.view addSubview:self.searchTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)getHistory
{
    NSArray *defaultsHistoryArray = [[NSUserDefaults standardUserDefaults] objectForKey:CX_SearchHistory_Defaults];
    
    if (defaultsHistoryArray.count == 0)
    {
        self.clearView.hidden = YES;
    }else
    {
        [self.historyArray addObjectsFromArray:[[NSUserDefaults standardUserDefaults] objectForKey:CX_SearchHistory_Defaults]];
    }
}

- (void)saveHistory
{
    self.clearView.hidden = NO;
    
    self.searchString = self.searchView.searchField.text;
    
    //    [self.historyDict setObject:self.searchString forKey:self.searchString];
    //
    //    [[NSUserDefaults standardUserDefaults] setObject:self.historyDict forKey:SearchHistory_Defaults];
    
    BOOL hasSame = NO;
    
    for (NSString *history in self.historyArray)
    {
        if ([history isEqualToString:self.searchString])
        {
            hasSame = YES;
            
            break;
        }
    }
    
    if (hasSame)
    {
        [self.historyArray removeObject:self.searchString];
    }
    
    [self.historyArray addObject:self.searchString];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.historyArray forKey:CX_SearchHistory_Defaults];
    
    
    [self.searchTableView reloadData];
    
    //        NSLog(@"%@",self.historyDict);
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
        _searchView.searchField.delegate = self;
    }
    
    return _searchView;
}

- (CXBaseTableView *)searchTableView
{
    if (!_searchTableView)
    {
        _searchTableView = [[CXBaseTableView alloc] initWithFrame:CGRectMake(0, StatusNavigationBarHeight, Screen_Width, Screen_Height-StatusNavigationBarHeight) style:UITableViewStyleGrouped];
        _searchTableView.delegate = self;
        _searchTableView.dataSource = self;
        _searchTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        [_searchTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:searchCellIdentifier];
    }
    
    return _searchTableView;
}

- (CXInsetsField *)searchHistoryTitleField
{
    if (!_searchHistoryTitleField)
    {
        _searchHistoryTitleField = [[CXInsetsField alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, CellHeight) margin:ViewMargin_10+ViewMargin_5];
        _searchHistoryTitleField.enabled = NO;
        _searchHistoryTitleField.textColor = CX_GrayColor;
        _searchHistoryTitleField.font = FontSize(13);
        _searchHistoryTitleField.text = @"搜索历史";
    }
    
    return _searchHistoryTitleField;
}

- (CXBaseView *)clearView
{
    if (!_clearView)
    {
        _clearView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 75)];
        _clearView.backgroundColor = [UIColor clearColor];
        
        [_clearView addSubview:self.clearButton];
    }
    
    return _clearView;
}

- (UIButton *)clearButton
{
    if (!_clearButton)
    {
        _clearButton = [[UIButton alloc] initWithFrame:CGRectMake(self.clearView.width/2-150/2, ViewMargin_Double_10, 150, 35)];
        _clearButton.layer.cornerRadius = 5;
        _clearButton.layer.masksToBounds = YES;
        _clearButton.layer.borderWidth = 0.5;
        _clearButton.layer.borderColor = CX_LightGrayColor.CGColor;
        _clearButton.backgroundColor = CX_WhiteColor;
        _clearButton.titleLabel.font = FontSize(14);
        [_clearButton setTitle:@"清除历史记录" forState:UIControlStateNormal];
        [_clearButton setTitleColor:CX_GrayColor forState:UIControlStateNormal];
        [_clearButton addTarget:self action:@selector(clearHistoryAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _clearButton;
}

- (NSMutableArray *)historyArray
{
    if (!_historyArray)
    {
        _historyArray = [[NSMutableArray alloc] init];
    }
    
    return _historyArray;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.historyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellIdentifier];
    
    cell.textLabel.font = FontSize(14);
    cell.textLabel.textColor = CX_BlackColor;
    
    cell.textLabel.text = [self.historyArray objectAtIndex:self.historyArray.count-1-indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.searchHistoryTitleField.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.clearView.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.searchHistoryTitleField;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return self.clearView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *string = [self.searchView.searchField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (string.length > 0)
    {
        [self saveHistory];
    }
    
    return [textField resignFirstResponder];
}

#pragma mark - Action

- (void)clearHistoryAction
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray array] forKey:CX_SearchHistory_Defaults];
    
    [self.historyArray removeAllObjects];
    
    self.clearView.hidden = YES;
    
    [self.searchTableView reloadData];
}

@end
