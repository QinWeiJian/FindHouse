//
//  CXHomeFunctionCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHomeFunctionCell.h"

@implementation CXHomeFunctionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.buyHouseView];
        [self.contentView addSubview:self.saleHouseView];
        
        [self.contentView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(Screen_Width/2, 100/2-30/2) endPosition:CGPointMake(Screen_Width/2, 100/2+30/2) LineWidth:1]];
        
        [self.contentView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(ViewMargin_10, 100) endPosition:CGPointMake(Screen_Width-ViewMargin_10, 100) LineWidth:1]];
        
        [self.contentView addSubview:self.tradeView];
        [self.contentView addSubview:self.secretaryView];
        [self.contentView addSubview:self.calculatorView];
    }
    
    return self;
}

#pragma mark - Getter

- (CXLeftImageFunctionView *)buyHouseView
{
    if (!_buyHouseView)
    {
        _buyHouseView = [[CXLeftImageFunctionView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width/2, 100) image:ImageWithNamed(@"home_buyHouse") text:@"买房"];
    }
    
    return _buyHouseView;
}

- (CXLeftImageFunctionView *)saleHouseView
{
    if (!_saleHouseView)
    {
        _saleHouseView = [[CXLeftImageFunctionView alloc] initWithFrame:CGRectMake(Screen_Width/2, 0, Screen_Width/2, 100) image:ImageWithNamed(@"home_saleHouse") text:@"卖房"];
    }
    
    return _saleHouseView;
}

- (CXUpImageFunctionView *)tradeView
{
    if (!_tradeView)
    {
        _tradeView = [[CXUpImageFunctionView alloc] initWithFrame:CGRectMake(0, 100, Screen_Width/3, 100) image:ImageWithNamed(@"home_trade") text:@"交易服务"];
    }
    
    return _tradeView;
}

- (CXUpImageFunctionView *)secretaryView
{
    if (!_secretaryView)
    {
        _secretaryView = [[CXUpImageFunctionView alloc] initWithFrame:CGRectMake(self.tradeView.viewDistanceX, self.tradeView.viewOriginY, self.tradeView.viewSizeWidth, self.tradeView.viewSizeHeight) image:ImageWithNamed(@"home_secretary") text:@"房小蜜"];
    }
    
    return _secretaryView;
}

- (CXUpImageFunctionView *)calculatorView
{
    if (!_calculatorView)
    {
        _calculatorView = [[CXUpImageFunctionView alloc] initWithFrame:CGRectMake(self.secretaryView.viewDistanceX, self.tradeView.viewOriginY, self.tradeView.viewSizeWidth, self.tradeView.viewSizeHeight) image:ImageWithNamed(@"home_calculator") text:@"计算器"];
    }
    
    return _calculatorView;
}

@end
