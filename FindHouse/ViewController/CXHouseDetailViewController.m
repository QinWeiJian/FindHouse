//
//  CXHouseDetailViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/11.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHouseDetailViewController.h"
#import "RunImageScrollView.h"
#import "CXHouseMessageCell.h"
#import "CXHouseVerifyHeaderView.h"
#import "CXHouseCommentCell.h"
#import "CXHouseListCell.h"
#import "CXContactSecretaryView.h"
#import "CXReportHouseViewController.h"

#define BottomBarHeight 50

#define BannerHeight (5*Screen_Width)/9

static NSString *houseMessageCellIdentifier = @"houseMessageCellIdentifier";
static NSString *houseCommentCellIdentifier = @"houseCommentCellIdentifier";
static NSString *normalCellIdentifier = @"normalCellIdentifier";
static NSString *houseListCellIdentifier = @"houseListCellIdentifier";

@interface CXHouseDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UIButton *backButton;
@property(nonatomic,retain)UIButton *shareButton;
@property(nonatomic,retain)UIView *customNavigationBarView;

@property(nonatomic,retain)UIButton *collectButton;
@property(nonatomic,retain)UIButton *secretaryButton;
@property(nonatomic,retain)UIButton *onlineButton;
@property(nonatomic,retain)UIControl *ownerControl;

@property(nonatomic,retain)CXBaseTableView *myTableView;

@property(nonatomic,retain)RunImageScrollView *bannerView;

@property(nonatomic,retain)CXHouseVerifyHeaderView *houseVerifyHeaderView;
@property(nonatomic,retain)CXInsetsField *mapHeaderView;
@property(nonatomic,retain)CXInsetsField *moreHeaderView;

@property(nonatomic,retain)CXContactSecretaryView *contactSecretaryView;

@end

@implementation CXHouseDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.myTableView];
    
    [self.view addSubview:self.customNavigationBarView];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.shareButton];
    
    [self.view addSubview:self.collectButton];
    [self.view addSubview:self.secretaryButton];
    [self.view addSubview:self.onlineButton];
    [self.view addSubview:self.ownerControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (UIView *)customNavigationBarView
{
    if (!_customNavigationBarView)
    {
        _customNavigationBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, StatusNavigationBarHeight)];
        _customNavigationBarView.backgroundColor = CX_ThemeGreenColor;
        _customNavigationBarView.alpha = 0;
    }
    
    return _customNavigationBarView;
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

- (UIButton *)shareButton
{
    if (!_shareButton)
    {
        _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width-NavigationBarHeight, StatusBarHeight, NavigationBarHeight, NavigationBarHeight)];
        [_shareButton setImage:ImageWithNamed(@"navigationBar_share") forState:UIControlStateNormal];
        //        [_mapButton addTarget:self action:@selector(backItemAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _shareButton;
}

- (UIButton *)collectButton
{
    if (!_collectButton)
    {
        _collectButton = [[UIButton alloc] initWithFrame:CGRectMake(0, Screen_Height-BottomBarHeight, Screen_Width/5, BottomBarHeight)];
        _collectButton.titleLabel.font = FontSize(10);
        _collectButton.backgroundColor = CX_WhiteColor;
        [_collectButton setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectButton setTitleColor:CX_GrayColor forState:UIControlStateNormal];
        [_collectButton setImage:ImageWithNamed(@"house_collect_normal") forState:UIControlStateNormal];
        [_collectButton setImage:ImageWithNamed(@"house_collect_selected") forState:UIControlStateSelected];
        
        _collectButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [_collectButton setTitleEdgeInsets:UIEdgeInsetsMake(_collectButton.imageView.frame.size.height+ViewMargin_5+3 ,-_collectButton.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        [_collectButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0.0,0.0, -_collectButton.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
        
    }
    
    return _collectButton;
}

- (UIButton *)secretaryButton
{
    if (!_secretaryButton)
    {
        _secretaryButton = [[UIButton alloc] initWithFrame:CGRectMake(self.collectButton.viewDistanceX, self.collectButton.viewOriginY, Screen_Width/5, BottomBarHeight)];
        _secretaryButton.titleLabel.font = FontSize(10);
        _secretaryButton.backgroundColor = CX_WhiteColor;
        [_secretaryButton setTitle:@"咨询房小蜜" forState:UIControlStateNormal];
        [_secretaryButton setTitleColor:CX_GrayColor forState:UIControlStateNormal];
        [_secretaryButton setImage:ImageWithNamed(@"house_contact_secretary") forState:UIControlStateNormal];
        [_secretaryButton addTarget:self action:@selector(contactSecretaryAction) forControlEvents:UIControlEventTouchUpInside];
        
        _secretaryButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [_secretaryButton setTitleEdgeInsets:UIEdgeInsetsMake(_secretaryButton.imageView.frame.size.height+ViewMargin_5+3 ,-_secretaryButton.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        [_secretaryButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0.0,0.0, -_secretaryButton.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
        
    }
    
    return _secretaryButton;
}

- (UIButton *)onlineButton
{
    if (!_onlineButton)
    {
        _onlineButton = [[UIButton alloc] initWithFrame:CGRectMake(self.secretaryButton.viewDistanceX, self.collectButton.viewOriginY, (Screen_Width*3/5)*2/5, BottomBarHeight)];
        _onlineButton.titleLabel.font = FontSize(10);
        _onlineButton.backgroundColor = CX_BlueColor;
        [_onlineButton setTitle:@"在线联系" forState:UIControlStateNormal];
        [_onlineButton setTitleColor:CX_WhiteColor forState:UIControlStateNormal];
        [_onlineButton setImage:ImageWithNamed(@"house_contact_online") forState:UIControlStateNormal];
        
        _onlineButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [_onlineButton setTitleEdgeInsets:UIEdgeInsetsMake(_onlineButton.imageView.frame.size.height+ViewMargin_5+3 ,-_onlineButton.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        [_onlineButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0.0,0.0, -_onlineButton.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
        
    }
    
    return _onlineButton;
}

- (UIControl *)ownerControl
{
    if (!_ownerControl)
    {
        _ownerControl = [[UIControl alloc] initWithFrame:CGRectMake(self.onlineButton.viewDistanceX, self.onlineButton.viewOriginY, (Screen_Width*3/5)*3/5, BottomBarHeight)];
        _ownerControl.backgroundColor = CX_ThemeGreenColor;
        
        CXBaseImageView *phoneImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(0, 0, _ownerControl.viewSizeHeight, _ownerControl.viewSizeHeight)];
        phoneImageView.image = ImageWithNamed(@"house_contact_phone");
        [_ownerControl addSubview:phoneImageView];
        
        CXBaseLabel *nameLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(phoneImageView.viewDistanceX, 0, _ownerControl.viewSizeWidth-phoneImageView.viewDistanceX-ViewMargin_5, _ownerControl.viewSizeHeight)];
        nameLabel.font = FontSize(10);
        nameLabel.textColor = CX_WhiteColor;
        nameLabel.text = @"黄小姐\n联系业主";
        nameLabel.numberOfLines = 0;
        nameLabel.attributedText = [nameLabel.text cx_changeTextColorWithReplaceString:@"黄小姐" ChangeColor:CX_WhiteColor ChangeFont:FontSize(14)];
        [_ownerControl addSubview:nameLabel];
    }
    
    return _ownerControl;
}

- (CXBaseTableView *)myTableView
{
    if (!_myTableView)
    {
        _myTableView = [[CXBaseTableView alloc] initWithFrame:CGRectMake(0, -20, Screen_Width, Screen_Height-BottomBarHeight+20) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        [_myTableView registerClass:[CXHouseMessageCell class] forCellReuseIdentifier:houseMessageCellIdentifier];
        [_myTableView registerClass:[CXHouseCommentCell class] forCellReuseIdentifier:houseCommentCellIdentifier];
        [_myTableView registerClass:[CXHouseListCell class] forCellReuseIdentifier:houseListCellIdentifier];
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:normalCellIdentifier];
    }
    
    return _myTableView;
}

- (RunImageScrollView *)bannerView
{
    if (!_bannerView)
    {
        _bannerView = [[RunImageScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, BannerHeight) ContentMode:UIViewContentModeScaleAspectFill NeedRun:NO];
        
        _bannerView.imageArray = [NSArray arrayWithObject:@"http://img.firefoxchina.cn/2016/11/8/201611110959460.jpg"];
    }
    
    return _bannerView;
}

- (CXHouseVerifyHeaderView *)houseVerifyHeaderView
{
    if (!_houseVerifyHeaderView)
    {
        _houseVerifyHeaderView = [[CXHouseVerifyHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45)];
        [_houseVerifyHeaderView.reportButton addTarget:self action:@selector(reportAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _houseVerifyHeaderView;
}

- (CXInsetsField *)mapHeaderView
{
    if (!_mapHeaderView)
    {
        _mapHeaderView = [[CXInsetsField alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 40) margin:ViewMargin_10];
        _mapHeaderView.enabled = NO;
        _mapHeaderView.textColor = CX_ThemeGreenColor;
        _mapHeaderView.backgroundColor = CX_WhiteColor;
        _mapHeaderView.text = @"地图";
    }
    
    return _mapHeaderView;
}

- (CXInsetsField *)moreHeaderView
{
    if (!_moreHeaderView)
    {
        _moreHeaderView = [[CXInsetsField alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 40) margin:ViewMargin_10];
        _moreHeaderView.enabled = NO;
        _moreHeaderView.textColor = CX_ThemeGreenColor;
        _moreHeaderView.backgroundColor = CX_WhiteColor;
        _moreHeaderView.text = @"更多推荐";
    }
    
    return _moreHeaderView;
}

- (CXContactSecretaryView *)contactSecretaryView
{
    if (!_contactSecretaryView)
    {
        _contactSecretaryView = [[CXContactSecretaryView alloc] init];
    }
    
    return _contactSecretaryView;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 2;
    }else if (section == 3)
    {
        return 5;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        CXHouseMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:houseMessageCellIdentifier];
        
        return cell;
    }else if (indexPath.section == 1)
    {
        CXHouseCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:houseCommentCellIdentifier];
        
        return cell;
    }else if (indexPath.section == 3)
    {
        CXHouseListCell *cell = [tableView dequeueReusableCellWithIdentifier:houseListCellIdentifier];
        
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:normalCellIdentifier];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 220;
    }else if (indexPath.section == 1)
    {
        return 160;
    }else if (indexPath.section == 2)
    {
        return BannerHeight;
    }
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return BannerHeight;
    }else if (section == 1)
    {
        return self.houseVerifyHeaderView.viewSizeHeight;
    }else if (section == 2)
    {
        return self.mapHeaderView.viewSizeHeight;
    }else if (section == 3)
    {
        return self.moreHeaderView.viewSizeHeight;
    }
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return ViewMargin_10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.bannerView;
    }else if (section == 1)
    {
        return self.houseVerifyHeaderView;
    }else if (section == 2)
    {
        return self.mapHeaderView;
    }else if (section == 3)
    {
        return self.moreHeaderView;
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
    
    if (y >= 0)
    {
        self.customNavigationBarView.alpha = 0.005*y;
    }else
    {
        self.customNavigationBarView.alpha = 0;
    }
}

#pragma mark - Action

- (void)contactSecretaryAction
{
    [self.contactSecretaryView show];
}

- (void)reportAction
{
    CXReportHouseViewController *reportVC = [[CXReportHouseViewController alloc] init];
    [self.navigationController pushViewController:reportVC animated:YES];
}

@end
