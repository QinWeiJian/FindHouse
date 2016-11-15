//
//  CXCalculatorPriceView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXCalculatorPriceView.h"
#import "CXDetailTextFieldCell.h"
#import "CXDetailDisclosureIndicatorCell.h"

#define CellHeight 45

@interface CXCalculatorPriceView ()

@property(nonatomic,retain)CXInsetsField *footerView;

@property(nonatomic,retain)CXDetailDisclosureIndicatorCell *paybackWayCell;
@property(nonatomic,retain)CXDetailTextFieldCell *sumLoanCell;
@property(nonatomic,retain)CXDetailDisclosureIndicatorCell *deadlineCell;
@property(nonatomic,retain)CXDetailDisclosureIndicatorCell *interestCell;

@property(nonatomic,retain)CXDetailTextFieldCell *businessLoanCell;
@property(nonatomic,retain)CXDetailDisclosureIndicatorCell *businessInterestCell;
@property(nonatomic,retain)CXDetailDisclosureIndicatorCell *fundInterestCell;

@end

@implementation CXCalculatorPriceView

- (id)initWithFrame:(CGRect)frame priceType:(CXCalculatorPriceViewType)priceType
{
    if (self = [super initWithFrame:frame style:UITableViewStyleGrouped])
    {
        self.priceType = priceType;
        
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        self.delegate = self;
        self.dataSource = self;
        
        [self addSubview:self.myTableView];
    }
    
    return self;
}

#pragma mark - Getter

- (CXInsetsField *)footerView
{
    if (!_footerView)
    {
        _footerView = [[CXInsetsField alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, CellHeight) margin:ViewMargin_10];
        _footerView.enabled = NO;
        _footerView.textColor = CX_GrayColor;
        _footerView.text = @"以上为2016年央行最新利率，计算结果仅供参考。";
    }
    
    return _footerView;
}

- (CXDetailDisclosureIndicatorCell *)paybackWayCell
{
    if (!_paybackWayCell)
    {
        _paybackWayCell = [[CXDetailDisclosureIndicatorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        _paybackWayCell.titleLabel.text = @"还款方式";
        _paybackWayCell.detailLabel.text = @"等额本息";
    }
    
    return _paybackWayCell;
}

- (CXDetailTextFieldCell *)sumLoanCell
{
    if (!_sumLoanCell)
    {
        _sumLoanCell = [[CXDetailTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        _sumLoanCell.titleLabel.text = @"贷款总额(元)";
        _sumLoanCell.detailTextField.placeholder = @"输入贷款总额";
    }
    
    return _sumLoanCell;
}

- (CXDetailDisclosureIndicatorCell *)deadlineCell
{
    if (!_deadlineCell)
    {
        _deadlineCell = [[CXDetailDisclosureIndicatorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        _deadlineCell.titleLabel.text = @"期限(年)";
        _deadlineCell.detailLabel.text = @"5";
    }
    
    return _deadlineCell;
}

- (CXDetailDisclosureIndicatorCell *)interestCell
{
    if (!_interestCell)
    {
        _interestCell = [[CXDetailDisclosureIndicatorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        _interestCell.titleLabel.text = @"利率(%)";
        _interestCell.detailLabel.text = @"4.75";
    }
    
    return _interestCell;
}

- (CXDetailTextFieldCell *)businessLoanCell
{
    if (!_businessLoanCell)
    {
        _businessLoanCell = [[CXDetailTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        _businessLoanCell.titleLabel.text = @"商贷金额(元)";
        _businessLoanCell.detailTextField.placeholder = @"输入贷款总额";
    }
    
    return _businessLoanCell;
}

- (CXDetailDisclosureIndicatorCell *)businessInterestCell
{
    if (!_businessInterestCell)
    {
        _businessInterestCell = [[CXDetailDisclosureIndicatorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        _businessInterestCell.titleLabel.text = @"商贷利率(%)";
        _businessInterestCell.detailLabel.text = @"4.75";
    }
    
    return _businessInterestCell;
}

- (CXDetailDisclosureIndicatorCell *)fundInterestCell
{
    if (!_fundInterestCell)
    {
        _fundInterestCell = [[CXDetailDisclosureIndicatorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        _fundInterestCell.titleLabel.text = @"公积金利率(%)";
        _fundInterestCell.detailLabel.text = @"2.75";
    }
    
    return _fundInterestCell;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.priceType == CXCalculatorPriceViewTypeFund)
    {
        return 4;
    }else if (self.priceType == CXCalculatorPriceViewTypeCombination)
    {
        return 6;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.priceType == CXCalculatorPriceViewTypeFund)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                return self.paybackWayCell;
            }
                break;
                
            case 1:
            {
                return self.sumLoanCell;
            }
                break;
                
            case 2:
            {
                return self.deadlineCell;
            }
                break;
                
            case 3:
            {
                return self.interestCell;
            }
                break;
                
            default:
                break;
        }
    }else if (self.priceType == CXCalculatorPriceViewTypeCombination)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                return self.paybackWayCell;
            }
                break;
                
            case 1:
            {
                return self.businessLoanCell;
            }
                break;
                
            case 2:
            {
                return self.sumLoanCell;
            }
                break;
                
            case 3:
            {
                return self.deadlineCell;
            }
                break;
                
            case 4:
            {
                return self.businessInterestCell;
            }
                break;
                
            case 5:
            {
                return self.fundInterestCell;
            }
                break;
                
            default:
                break;
        }
    }
    return nil;
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
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.priceType == CXCalculatorPriceViewTypeFund)
    {
        return CellHeight;
    }
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.priceType == CXCalculatorPriceViewTypeFund)
    {
        return self.footerView;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
