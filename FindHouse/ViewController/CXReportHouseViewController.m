//
//  CXReportHouseViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/22.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXReportHouseViewController.h"
#import "UIPlaceHolderTextView.h"
#import "CXReportHouseCellView.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXReportHouseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)CXBaseTableView *myTableView;

@property(nonatomic,retain)CXInsetsField *typeTitleField;

@property(nonatomic,retain)CXInsetsField *otherTitleField;

@property(nonatomic,retain)CXBaseView *commitView;

@property(nonatomic,retain)UIPlaceHolderTextView *otherView;

@property(nonatomic,retain)NSArray *typeArray;

@property(nonatomic,retain)NSMutableArray *typeViewsArray;

@end

@implementation CXReportHouseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"举报房源";
    
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
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        [_myTableView registerClass:[CXBaseTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    
    return _myTableView;
}

- (UIPlaceHolderTextView *)otherView
{
    if (!_otherView)
    {
        _otherView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(ViewMargin_10, ViewMargin_10, Screen_Width-ViewMargin_Double_10, 100)];
        _otherView.placeholder = @"请输入其他举报信息";
        _otherView.backgroundColor = CX_WhiteColor;
        _otherView.textColor = CX_BlackColor;
        _otherView.font = FontSize(15);
    }
    
    return _otherView;
}

- (CXInsetsField *)typeTitleField
{
    if (!_typeTitleField)
    {
        _typeTitleField = [[CXInsetsField alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45) margin:ViewMargin_10+ViewMargin_5];
        _typeTitleField.enabled = NO;
        _typeTitleField.font = FontSize(13);
        _typeTitleField.textColor = CX_GrayColor;
        _typeTitleField.text = @"举报类型(可多选)";
    }
    
    return _typeTitleField;
}

- (CXInsetsField *)otherTitleField
{
    if (!_otherTitleField)
    {
        _otherTitleField = [[CXInsetsField alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45) margin:ViewMargin_10+ViewMargin_5];
        _otherTitleField.enabled = NO;
        _otherTitleField.font = FontSize(13);
        _otherTitleField.textColor = CX_GrayColor;
        _otherTitleField.text = @"信息补充";
    }
    
    return _otherTitleField;
}

- (CXBaseView *)commitView
{
    if (!_commitView)
    {
        _commitView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45+ViewMargin_10*6)];
        _commitView.backgroundColor = [UIColor clearColor];
        
        UIButton *commitButton = [[UIButton alloc] initWithFrame:CGRectMake(ViewMargin_10*3, ViewMargin_10*3, Screen_Width-ViewMargin_10*6, 45)];
        commitButton.backgroundColor = CX_ThemeGreenColor;
        commitButton.titleLabel.font = FontSize(15);
        [commitButton setTitle:@"提交" forState:UIControlStateNormal];
        [commitButton setTitleColor:CX_WhiteColor forState:UIControlStateNormal];
        [_commitView addSubview:commitButton];
    }
    
    return _commitView;
}

- (NSArray *)typeArray
{
    if (!_typeArray)
    {
        _typeArray = [[NSArray alloc] initWithObjects:@"房源已售或不存在",@"房源图片不真实",@"对方是中介",@"价格不真实",@"其他", nil];
    }
    
    return _typeArray;
}

- (NSMutableArray *)typeViewsArray
{
    if (!_typeViewsArray)
    {
        _typeViewsArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < self.typeArray.count; i++)
        {
            CXReportHouseCellView *cellView = [[CXReportHouseCellView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45)];
            cellView.contentLabel.text = [self.typeArray objectAtIndex:i];
            [_typeViewsArray addObject:cellView];
        }
    }
    
    return _typeViewsArray;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.typeArray.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    if (indexPath.section == 1)
    {
        [cell.contentView addSubview:self.otherView];
    }else
    {
        [cell.contentView addSubview:[self.typeViewsArray objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return 120;
    }
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 45+ViewMargin_10*6;
    }
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return self.otherTitleField;
    }
    
    return self.typeTitleField;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        return self.commitView;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
