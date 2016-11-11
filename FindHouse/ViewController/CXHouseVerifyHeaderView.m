//
//  CXHouseVerifyHeaderView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/11.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHouseVerifyHeaderView.h"

@implementation CXHouseVerifyHeaderView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.verifyButton];
        [self addSubview:self.reportButton];
    }
    
    return self;
}

#pragma mark - Getter

- (UIButton *)verifyButton
{
    if (!_verifyButton)
    {
        NSString *text = @" 房源已认证 ";
        CGSize size = [text cx_sizeWithFont:FontSize(12) ContentMargin:ViewMargin_10];
        
        _verifyButton = [[UIButton alloc] initWithFrame:CGRectMake(ViewMargin_10, self.viewSizeHeight/2-(size.height+ViewMargin_10)/2, size.width+ImageWithNamed(@"house_detail_verify").size.width, size.height+ViewMargin_10)];
        _verifyButton.titleLabel.font = FontSize(12);
        _verifyButton.layer.cornerRadius = _verifyButton.viewSizeHeight/2;
        _verifyButton.layer.masksToBounds = YES;
        _verifyButton.layer.borderColor = CX_GreenColor.CGColor;
        _verifyButton.layer.borderWidth = 1;
        [_verifyButton setTitle:text forState:UIControlStateNormal];
        [_verifyButton setTitleColor:CX_GreenColor forState:UIControlStateNormal];
        [_verifyButton setImage:ImageWithNamed(@"house_detail_verify") forState:UIControlStateNormal];
    }
    
    return _verifyButton;
}

- (UIButton *)reportButton
{
    if (!_reportButton)
    {
        NSString *text = @" 举报房源";
        CGSize size = [text cx_sizeWithFont:FontSize(12) ContentMargin:ViewMargin_5];
        
        _reportButton = [[UIButton alloc] initWithFrame:CGRectMake(self.viewSizeWidth-ViewMargin_10-ImageWithNamed(@"house_detail_report").size.width-size.width, 0, ImageWithNamed(@"house_detail_report").size.width+size.width, self.viewSizeHeight)];
        _reportButton.titleLabel.font = FontSize(12);
        [_reportButton setTitle:@" 举报房源" forState:UIControlStateNormal];
        [_reportButton setTitleColor:CX_LightGrayColor forState:UIControlStateNormal];
        [_reportButton setImage:ImageWithNamed(@"house_detail_report") forState:UIControlStateNormal];
        
        _reportButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    
    return _reportButton;
}

@end
