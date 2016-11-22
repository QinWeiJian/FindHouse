//
//  CXSaleHouseViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/22.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSaleHouseViewController.h"
#import "CXSaleHouseCellView.h"

@interface CXSaleHouseViewController ()

@property(nonatomic,retain)TPKeyboardAvoidingScrollView *bgView;

@property(nonatomic,retain)CXSaleHouseCellView *onlineView;
@property(nonatomic,retain)CXSaleHouseCellView *phoneView;

@property(nonatomic,retain)CXBaseView *flowView;

@end

@implementation CXSaleHouseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我要卖房";
    
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.onlineView];
    [self.bgView addSubview:self.phoneView];
    [self.bgView addSubview:self.flowView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (TPKeyboardAvoidingScrollView *)bgView
{
    if (!_bgView)
    {
        _bgView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds];
        _bgView.backgroundColor = CX_BackgroundColor;
        _bgView.bounces = NO;
        _bgView.showsVerticalScrollIndicator = NO;
    }
    
    return _bgView;
}

- (CXSaleHouseCellView *)onlineView
{
    if (!_onlineView)
    {
        _onlineView = [[CXSaleHouseCellView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 70) tapImage:ImageWithNamed(@"saleHouse_onlinePublish") title:@"在线发布" detail:@"在线一键快速发布房源信息"];
    }
    
    return _onlineView;
}

- (CXSaleHouseCellView *)phoneView
{
    if (!_phoneView)
    {
        _phoneView = [[CXSaleHouseCellView alloc] initWithFrame:CGRectMake(0, self.onlineView.viewDistanceY+1, Screen_Width, self.onlineView.height) tapImage:ImageWithNamed(@"saleHouse_phonePublish") title:@"电话委托" detail:@"一个电话快速卖房，还可以免费上门拍照"];
    }
    
    return _phoneView;
}

- (CXBaseView *)flowView
{
    if (!_flowView)
    {
        _flowView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, self.phoneView.viewDistanceY+ViewMargin_10, Screen_Width, 0)];
        
        CXBaseLabel *titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(0, 0, _flowView.width, 45)];
        titleLabel.font = FontSize(17);
        titleLabel.textAlignment = 1;
        titleLabel.textColor = CX_GrayColor;
        titleLabel.text = @"小蜜找房交易流程";
        [_flowView addSubview:titleLabel];
        
        CXSaleHouseCellView *flow1 = [[CXSaleHouseCellView alloc] initWithFrame:CGRectMake(0, titleLabel.viewDistanceY, _flowView.width, 60) tapImage:ImageWithNamed(@"saleHouse_flow_1") title:@"发布房源" detail:@"在线发布或拨打电话020-32294903"];
        flow1.arrowImageView.hidden = YES;
        [_flowView addSubview:flow1];
        
        CXSaleHouseCellView *flow2 = [[CXSaleHouseCellView alloc] initWithFrame:CGRectMake(flow1.x, flow1.viewDistanceY+ViewMargin_10*3, flow1.width, flow1.height) tapImage:ImageWithNamed(@"saleHouse_flow_2") title:@"直联买家" detail:@"在线联系买家，房小蜜提供免费咨询"];
        flow2.arrowImageView.hidden = YES;
        [_flowView addSubview:flow2];
        
        CXSaleHouseCellView *flow3 = [[CXSaleHouseCellView alloc] initWithFrame:CGRectMake(flow1.x, flow2.viewDistanceY+ViewMargin_10*3, flow1.width, flow1.height) tapImage:ImageWithNamed(@"saleHouse_flow_3") title:@"交易过户" detail:@"小蜜找房提供线下签约交易中心，代办过户"];
        flow3.arrowImageView.hidden = YES;
        [_flowView addSubview:flow3];
        
        [_flowView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(flow1.height/2, flow1.viewDistanceY) endPosition:CGPointMake(flow1.height/2, flow2.y) LineWidth:1]];
        
        [_flowView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(flow1.height/2, flow2.viewDistanceY) endPosition:CGPointMake(flow1.height/2, flow3.y) LineWidth:1]];
        
        CXBaseLabel *phoneLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(0, 0, _flowView.width, 40)];
        phoneLabel.font = FontSize(14);
        phoneLabel.textColor = CX_ThemeGreenColor;
        phoneLabel.textAlignment = 1;
        phoneLabel.text = @"咨询电话：020-32294903";
        [_flowView addSubview:phoneLabel];
        
        if (flow3.viewDistanceY+phoneLabel.height >= Screen_Height-ViewMargin_10-self.phoneView.viewDistanceY-StatusNavigationBarHeight)
        {
            _flowView.height = flow3.viewDistanceY+phoneLabel.height;
            phoneLabel.y = flow3.viewDistanceY;
        }else
        {
            _flowView.height = Screen_Height-ViewMargin_10-self.phoneView.viewDistanceY-StatusNavigationBarHeight;
            phoneLabel.y = _flowView.height-phoneLabel.height;
        }
        
        self.bgView.contentSize = CGSizeMake(Screen_Width, _flowView.viewDistanceY+StatusNavigationBarHeight);
    }
    
    return _flowView;
}

@end
