//
//  CXSearchHouseViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSearchHouseViewController.h"
#import "CXSearchView.h"
#import "YYDropDownMenu.h"
#import "YYAreaDataModel.h"
#import "CXSearchHouseCell.h"
#import "CXHouseDetailViewController.h"
#import "CXHousePriceCustomFilterView.h"

#define CellImageHeight (5*Screen_Width)/9

#define CellHeight CellImageHeight+60

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXSearchHouseViewController ()<YYDropDownMenuDelegte,YYDropDownMenuDataSource,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)CXBaseView *navigationBarView;
@property(nonatomic,retain)UIButton *backButton;
@property(nonatomic,retain)UIButton *mapButton;
@property(nonatomic,retain)CXSearchView *searchView;

@property(nonatomic,retain)YYDropDownMenu *filterMenu;
@property(nonatomic,retain)NSString *areaString;
@property(nonatomic,retain)NSString *priceString;
@property(nonatomic,retain)NSString *houseTypeString;
@property(nonatomic,retain)NSString *moreString;

@property(nonatomic,retain)NSString *provinceString;
@property(nonatomic,retain)NSString *cityString;
@property(nonatomic,retain)NSString *districtString;

@property(nonatomic,retain)NSArray *addressArray;
@property(nonatomic,retain)NSArray *provinceArray;
@property(nonatomic,retain)NSArray *cityArray;
@property(nonatomic,retain)NSArray *areaArray;

@property(nonatomic,retain)NSArray *priceArray;
@property(nonatomic,retain)NSArray *houseTypeArray;
@property(nonatomic,retain)NSArray *moreArray;

@property(nonatomic,assign)NSInteger category0Section0Index;
@property(nonatomic,assign)NSInteger category0Section1Index;
@property(nonatomic,assign)NSInteger category0Section2Index;
@property(nonatomic,assign)NSInteger category1Section0Index;
@property(nonatomic,assign)NSInteger category2Section0Index;
@property(nonatomic,assign)NSInteger category3Section0Index;

@property(nonatomic,retain)CXHousePriceCustomFilterView *priceFilterView;

@property(nonatomic,retain)CXBaseTableView *myTableView;

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
    
    [self initAddressData];
    
    [self initMenu];
    
    [self.view insertSubview:self.myTableView belowSubview:self.filterMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

- (void)initAddressData
{
    self.addressArray = [YYAreaDataModel getAreaArray];
    
    NSMutableArray *provinceArray = [NSMutableArray array];
    for (YYAreaDataModel *dataModel in self.addressArray)
    {
        [provinceArray addObject:dataModel.name];
    }
    self.provinceArray = provinceArray;
}

- (void)initMenu
{
    self.areaString = @"区域";
    self.priceString = @"总价";
    self.houseTypeString = @"房型";
    self.moreString = @"更多";
    
    self.provinceString = @"";
    self.cityString = @"";
    self.districtString = @"";
    
    self.category0Section0Index = -1;
    self.category0Section1Index = -1;
    self.category0Section2Index = -1;
    self.category1Section0Index = -1;
    self.category2Section0Index = -1;
    self.category3Section0Index = -1;
    
    self.priceArray = [NSArray arrayWithObjects:@"不限",@"1000元以下",@"1000 - 2000元",@"2000 - 3000元",@"3000 - 4000元",@"4000 - 5000元",@"5000元以上", nil];
    self.houseTypeArray = [NSArray arrayWithObjects:@"一房一厅",@"单间",@"两房一厅",@"别墅", nil];
    self.moreArray = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    
    [self.view addSubview:self.filterMenu];
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

- (YYDropDownMenu *)filterMenu
{
    if (!_filterMenu)
    {
        _filterMenu = [[YYDropDownMenu alloc] initWithFrame:CGRectMake(0, StatusNavigationBarHeight, Screen_Width, TabBarHeight)];
        _filterMenu.dataSource = self;
        _filterMenu.delegate = self;
    }
    
    return _filterMenu;
}

- (CXBaseTableView *)myTableView
{
    if (!_myTableView)
    {
        _myTableView = [[CXBaseTableView alloc] initWithFrame:CGRectMake(0, self.filterMenu.viewDistanceY, Screen_Width, Screen_Height-self.filterMenu.viewDistanceY) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        [_myTableView registerClass:[CXSearchHouseCell class] forCellReuseIdentifier:cellIdentifier];
    }
    
    return _myTableView;
}

- (CXHousePriceCustomFilterView *)priceFilterView
{
    if (!_priceFilterView)
    {
        _priceFilterView = [[CXHousePriceCustomFilterView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45*3)];
        [_priceFilterView.commitButton addTarget:self action:@selector(priceFilterCommitAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _priceFilterView;
}

#pragma mark - YYDropDownMenuDataSource && YYDropDownMenuDelegte

- (void)resetAddressData
{
    if (self.provinceString.length == 0)
    {
        return;
    }
    
    /**省*/
    if ([self.provinceString isEqualToString:@"北京市"] || [self.provinceString isEqualToString:@"上海市"] || [self.provinceString isEqualToString:@"天津市"] || [self.provinceString isEqualToString:@"重庆市"])
    {
        self.category0Section0Index = 0;
    }else
    {
        for (int i = 0; i < self.provinceArray.count; i++)
        {
            NSString *areaString = [self.provinceArray objectAtIndex:i];
            
            if ([areaString isEqualToString:self.provinceString])
            {
                self.category0Section0Index = i;
                
                break;
            }
        }
    }
    
    /**市*/
    YYAreaDataModel *provinceModel1 = [self.addressArray objectAtIndex:self.category0Section0Index];
    NSMutableArray *cityArray1 = [NSMutableArray array];
    for (YYAreaDataModel *dataModel in provinceModel1.childrenArray)
    {
        [cityArray1 addObject:dataModel.name];
    }
    self.cityArray = cityArray1;
    
    for (int i = 0; i < self.cityArray.count; i++)
    {
        NSString *areaString = [self.cityArray objectAtIndex:i];
        
        if ([areaString isEqualToString:self.cityString])
        {
            self.category0Section1Index = i;
            
            break;
        }
    }
    
    /**区*/
    YYAreaDataModel *cityModel1 = [provinceModel1.childrenArray objectAtIndex:self.category0Section1Index];
    NSMutableArray *areaArray1 = [NSMutableArray array];
    for (YYAreaDataModel *dataModel in cityModel1.childrenArray)
    {
        [areaArray1 addObject:dataModel.name];
    }
    self.areaArray = areaArray1;
    
    for (int i = 0; i < self.areaArray.count; i++)
    {
        NSString *areaString = [self.areaArray objectAtIndex:i];
        
        if ([areaString isEqualToString:self.districtString])
        {
            self.category0Section2Index = i;
            
            break;
        }
    }
    
    [self.filterMenu reloadData];
}

- (NSInteger)yy_dropDownMenuNumberOfCategoryInMenu:(YYDropDownMenu *)menu
{
    return 4;
}

- (NSString *)yy_dropDownMenu:(YYDropDownMenu *)menu titleForCategory:(NSInteger)category
{
    if (category == 0)
    {
        return self.areaString;
    }else if (category == 1)
    {
        return self.priceString;
    }else if (category == 2)
    {
        return self.houseTypeString;
    }else
    {
        return self.moreString;
    }
}

- (NSInteger)yy_dropDownMenu:(YYDropDownMenu *)menu numberOfColumnsInCategory:(NSInteger)category
{
    if (category == 0)
    {
        return 3;
    }else
    {
        return 1;
    }
}

- (NSInteger)yy_dropDownMenu:(YYDropDownMenu *)menu numberOfRowInCategory:(NSInteger)category section:(NSInteger)section
{
    if (category == 0)
    {
        if (section == 0)
        {
            return self.provinceArray.count;
        }else if (section == 1)
        {
            return self.cityArray.count;
        }else if (section == 2)
        {
            return self.areaArray.count;
        }
    }else if (category == 1)
    {
        return self.priceArray.count;
    }else if (category == 2)
    {
        return self.houseTypeArray.count;
    }else
    {
        return self.moreArray.count;
    }
    
    return 0;
}

- (NSString *)yy_dropDownMenu:(YYDropDownMenu *)menu contentOfRowInCategory:(NSInteger)category indexPath:(NSIndexPath *)indexPath
{
    if (category == 0)
    {
        if (indexPath.section == 0)
        {
            return [self.provinceArray objectAtIndex:indexPath.row];
        }else if (indexPath.section == 1)
        {
            return [self.cityArray objectAtIndex:indexPath.row];
        }else if (indexPath.section == 2)
        {
            return [self.areaArray objectAtIndex:indexPath.row];
        }
    }else if (category == 1)
    {
        return [self.priceArray objectAtIndex:indexPath.row];
    }else if (category == 2)
    {
        return [self.houseTypeArray objectAtIndex:indexPath.row];
    }else
    {
        return [self.moreArray objectAtIndex:indexPath.row];
    }
    
    return @"";
}

- (NSInteger)yy_dropDownMenu:(YYDropDownMenu *)menu selectedIndexInCategory:(NSInteger)category section:(NSInteger)section
{
    if (category == 0)
    {
        if (section == 0)
        {
            return self.category0Section0Index;
        }else if (section == 1)
        {
            return self.category0Section1Index;
        }else if (section == 2)
        {
            return self.category0Section2Index;
        }
        
        return -1;
    }else if (category == 1)
    {
        return self.category1Section0Index;
    }else if (category == 2)
    {
        return self.category2Section0Index;
    }else
    {
        return self.category3Section0Index;
    }
}

- (void)yy_dropDownMenu:(YYDropDownMenu *)menu didSelectRowAtCategory:(NSInteger)category indexPath:(NSIndexPath *)indexPath
{
    if (category == 0)
    {
        if (indexPath.section == 0)
        {
            
            if (self.category0Section0Index != indexPath.row)
            {
                self.category0Section0Index = indexPath.row;
                self.category0Section1Index = -1;
                self.category0Section2Index = -1;
                
                YYAreaDataModel *provinceModel = [self.addressArray objectAtIndex:indexPath.row];
                NSMutableArray *cityArray = [NSMutableArray array];
                for (YYAreaDataModel *dataModel in provinceModel.childrenArray)
                {
                    [cityArray addObject:dataModel.name];
                }
                self.cityArray = cityArray;
                
                self.areaArray = [NSArray array];
                
                //                YYAreaDataModel *cityModel = [provinceModel.childrenArray firstObject];
                //                NSMutableArray *areaArray = [NSMutableArray array];
                //                for (YYAreaDataModel *dataModel in cityModel.childrenArray)
                //                {
                //                    [areaArray addObject:dataModel.name];
                //                }
                //                self.areaArray = areaArray;
                
                //                self.provinceString = [self.provinceArray objectAtIndex:self.category0Section0Index];
                //                self.cityString = [self.cityArray firstObject];
                //                self.districtString = [self.areaArray firstObject];
                
                //                if ([self.provinceString isEqualToString:@"直辖市"])
                //                {
                //                    self.areaString = [NSString stringWithFormat:@"%@%@",self.cityString,self.districtString];
                //                }else
                //                {
                //                    self.areaString = [NSString stringWithFormat:@"%@%@%@",self.provinceString,self.cityString,self.districtString];
                //                }
                
                //                [self.menu setCategoryString:self.areaString categoryIndex:category];
                
                [self.filterMenu reloadData];
            }
        }else if (indexPath.section == 1)
        {
            if (self.category0Section1Index != indexPath.row && self.category0Section0Index >= 0)
            {
                self.category0Section1Index = indexPath.row;
                self.category0Section2Index = -1;
                
                YYAreaDataModel *provinceModel = [self.addressArray objectAtIndex:self.category0Section0Index];
                YYAreaDataModel *cityModel = [provinceModel.childrenArray objectAtIndex:indexPath.row];
                NSMutableArray *areaArray = [NSMutableArray array];
                for (YYAreaDataModel *dataModel in cityModel.childrenArray)
                {
                    [areaArray addObject:dataModel.name];
                }
                self.areaArray = areaArray;
                
                //                NSArray *areaArray = [[[self.addressDict objectForKey:[self.provinceArray objectAtIndex:self.category0Section0Index]] lastObject] objectForKey:[self.cityArray objectAtIndex:self.category0Section1Index]];
                //                self.areaArray = areaArray;
                
                //                self.provinceString = [self.provinceArray objectAtIndex:self.category0Section0Index];
                //                self.cityString = [self.cityArray objectAtIndex: self.category0Section1Index];
                //                self.districtString = [self.areaArray firstObject];
                
                //                if ([self.provinceString isEqualToString:@"直辖市"])
                //                {
                //                    self.areaString = [NSString stringWithFormat:@"%@%@",self.cityString,self.districtString];
                //                }else
                //                {
                //                    self.areaString = [NSString stringWithFormat:@"%@%@%@",self.provinceString,self.cityString,self.districtString];
                //                }
                
                //                [self.menu setCategoryString:self.areaString categoryIndex:category];
                
                [self.filterMenu reloadData];
            }
        }else if (indexPath.section == 2 && self.category0Section1Index >= 0)
        {
            self.category0Section2Index = indexPath.row;
            
            self.provinceString = [self.provinceArray objectAtIndex:self.category0Section0Index];
            self.cityString = [self.cityArray objectAtIndex: self.category0Section1Index];
            self.districtString = [self.areaArray objectAtIndex:indexPath.row];
            
            //            if ([self.provinceString isEqualToString:@"直辖市"])
            //            {
            //                self.areaString = [NSString stringWithFormat:@"%@%@",self.cityString,self.districtString];
            //            }else
            //            {
            //                self.areaString = [NSString stringWithFormat:@"%@%@%@",self.provinceString,self.cityString,self.districtString];
            //            }
            
            [self.filterMenu setCategoryString:self.districtString categoryIndex:category];
            
            [self.filterMenu reloadData];
            
        }
    }else if (category == 1)
    {
        self.priceString = [self.priceArray objectAtIndex:indexPath.row];
        
        [self.filterMenu setCategoryString:self.priceString categoryIndex:category];
        
        self.category1Section0Index = indexPath.row;
    }else if (category == 2)
    {
        self.houseTypeString = [self.houseTypeArray objectAtIndex:indexPath.row];
        
        [self.filterMenu setCategoryString:self.houseTypeString categoryIndex:category];
        
        self.category2Section0Index = indexPath.row;
    }else
    {
        self.moreString = [self.moreArray objectAtIndex:indexPath.row];
        
        [self.filterMenu setCategoryString:self.moreString categoryIndex:category];
        
        self.category3Section0Index = indexPath.row;
    }
}

- (CGFloat)yy_dropDownMenu:(YYDropDownMenu *)menu heightForFooterInCategory:(NSInteger)category section:(NSInteger)section
{
    if (category == 1)
    {
        return 45*3;
    }
    
    return 0.1;
}

- (UIView *)yy_dropDownMenu:(YYDropDownMenu *)menu viewForFooterInCategory:(NSInteger)category section:(NSInteger)section
{
    if (category == 1)
    {
        return self.priceFilterView;
    }
    
    return nil;
}

- (void)yy_dropDownMenu:(YYDropDownMenu *)menu didSelectCategory:(NSInteger)category
{
    if (category == 0)
    {
        [self resetAddressData];
    }
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
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return ViewMargin_10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CXHouseDetailViewController *detailVC = [[CXHouseDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mrak - Action

- (void)priceFilterCommitAction
{
    self.category1Section0Index = -1;
    
    [self.filterMenu setCategoryString:self.priceFilterView.priceLabel.text categoryIndex:1];
    
    [self.filterMenu hideMenuAndShowAgain:NO];
}

@end
