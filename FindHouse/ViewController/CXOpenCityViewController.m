//
//  CXOpenCityViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/10.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXOpenCityViewController.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXOpenCityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)CXBaseTableView *myTableView;

@property(nonatomic,retain)UIBarButtonItem *backButton;

@property(nonatomic,retain)CXBaseView *currentCityView;
@property(nonatomic,retain)CXBaseImageView *locationImageView;
@property(nonatomic,retain)CXBaseLabel *currentCityLabel;
@property(nonatomic,retain)UIButton *retryButton;

@end

@implementation CXOpenCityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"开通城市";
    
    self.navigationItem.leftBarButtonItem = self.backButton;
    
    [self.view addSubview:self.currentCityView];
    
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (UIBarButtonItem *)backButton
{
    if (!_backButton)
    {
        _backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationBar_back_x"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    }
    
    return _backButton;
}

- (CXBaseView *)currentCityView
{
    if (!_currentCityView)
    {
        _currentCityView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 0)];
        _currentCityView.backgroundColor = CX_ThemeGreenColor;
        
        [_currentCityView addSubview:self.locationImageView];
        [_currentCityView addSubview:self.currentCityLabel];
        [_currentCityView addSubview:self.retryButton];
        
        _currentCityView.height = self.retryButton.viewDistanceY+ViewMargin_10+ViewMargin_5;
    }
    
    return _currentCityView;
}

- (CXBaseImageView *)locationImageView
{
    if (!_locationImageView)
    {
        UIImage *logoImage = ImageWithNamed(@"location_logo");
        
        _locationImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(Screen_Width/2-logoImage.size.width/2, 0, logoImage.size.width, logoImage.size.height)];
        _locationImageView.image = logoImage;
    }
    
    return _locationImageView;
}

- (CXBaseLabel *)currentCityLabel
{
    if (!_currentCityLabel)
    {
        _currentCityLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.locationImageView.viewDistanceY, Screen_Width-ViewMargin_Double_10, 40)];
        _currentCityLabel.textColor = CX_WhiteColor;
        _currentCityLabel.textAlignment = 1;
        _currentCityLabel.text = @"当前城市：广州";
    }
    
    return _currentCityLabel;
}

- (UIButton *)retryButton
{
    if (!_retryButton)
    {
        NSString *text = @"重新定位";
        
        CGSize size = [text cx_sizeWithFont:FontSize(14) ContentMargin:ViewMargin_Double_10];
        
        _retryButton = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width/2 - size.width/2, self.currentCityLabel.viewDistanceY, size.width, size.height+ViewMargin_10)];
        _retryButton.layer.cornerRadius = _retryButton.viewSizeHeight/2;
        _retryButton.layer.masksToBounds = YES;
        _retryButton.layer.borderColor = CX_WhiteColor.CGColor;
        _retryButton.layer.borderWidth = 1;
        _retryButton.titleLabel.font = FontSize(14);
        [_retryButton setTitle:text forState:UIControlStateNormal];
        [_retryButton setTitleColor:CX_WhiteColor forState:UIControlStateNormal];
    }
    
    return _retryButton;
}

- (CXBaseTableView *)myTableView
{
    if (!_myTableView)
    {
        _myTableView = [[CXBaseTableView alloc] initWithFrame:CGRectMake(0, self.currentCityView.viewDistanceY, Screen_Width, Screen_Height-self.currentCityView.viewSizeHeight-StatusNavigationBarHeight) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    
    return _myTableView;
}

#pragma mark - Action

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.font = FontSize(14);
    cell.textLabel.textColor = CX_BlackColor;
    
    cell.textLabel.text = @"广州";
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"已开通城市";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
