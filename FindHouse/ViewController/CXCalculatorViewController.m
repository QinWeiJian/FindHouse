//
//  CXCalculatorViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXCalculatorViewController.h"
#import "CXSegmentView.h"
#import "CXCalculatorHeadView.h"
#import "CXCalculatorPriceView.h"

@interface CXCalculatorViewController ()<CXSegmentViewDelegate>

@property(nonatomic,retain)CXSegmentView *segmentView;
@property(nonatomic,retain)CXCalculatorHeadView *headView;

@property(nonatomic,retain)CXCalculatorPriceView *businessView;
@property(nonatomic,retain)CXCalculatorPriceView *fundView;
@property(nonatomic,retain)CXCalculatorPriceView *combinationView;

@end

@implementation CXCalculatorViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"房产计算器";
    
    [self.view addSubview:self.segmentView];
    [self.view addSubview:self.headView];
    
    [self.view addSubview:self.businessView];
    [self.view addSubview:self.fundView];
    [self.view addSubview:self.combinationView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (CXSegmentView *)segmentView
{
    if (!_segmentView)
    {
        _segmentView = [[CXSegmentView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, TabBarHeight) objects:[NSArray arrayWithObjects:@"商业贷款",@"公积金贷款",@"组合贷款", nil]];
        _segmentView.backgroundColor = CX_ThemeGreenColor;
        _segmentView.delegate = self;
    }
    
    return _segmentView;
}

- (CXCalculatorHeadView *)headView
{
    if (!_headView)
    {
        _headView = [[CXCalculatorHeadView alloc] initWithFrame:CGRectMake(0, self.segmentView.viewDistanceY, Screen_Width, 220)];
    }
    
    return _headView;
}

- (CXCalculatorPriceView *)businessView
{
    if (!_businessView)
    {
        _businessView = [[CXCalculatorPriceView alloc] initWithFrame:CGRectMake(0, self.headView.viewDistanceY, Screen_Width, Screen_Height-StatusNavigationBarHeight-self.headView.viewSizeHeight-TabBarHeight) priceType:CXCalculatorPriceViewTypeFund];
    }
    
    return _businessView;
}

- (CXCalculatorPriceView *)fundView
{
    if (!_fundView)
    {
        _fundView = [[CXCalculatorPriceView alloc] initWithFrame:self.businessView.frame priceType:CXCalculatorPriceViewTypeFund];
        _fundView.hidden = YES;
    }
    
    return _fundView;
}

- (CXCalculatorPriceView *)combinationView
{
    if (!_combinationView)
    {
        _combinationView = [[CXCalculatorPriceView alloc] initWithFrame:self.businessView.frame priceType:CXCalculatorPriceViewTypeCombination];
        _combinationView.hidden = YES;
    }
    
    return _combinationView;
}

#pragma mark - CXSegmentViewDelegate

- (void)cx_segmentView:(CXSegmentView *)segmentView didSelectedWithIndex:(NSInteger)selectedIndex
{
    if (selectedIndex == 1)
    {
        self.businessView.hidden = YES;
        self.fundView.hidden = NO;
        self.combinationView.hidden = YES;
    }else if (selectedIndex == 2)
    {
        self.businessView.hidden = YES;
        self.fundView.hidden = YES;
        self.combinationView.hidden = NO;
    }else
    {
        self.businessView.hidden = NO;
        self.fundView.hidden = YES;
        self.combinationView.hidden = YES;
    }
}

@end
