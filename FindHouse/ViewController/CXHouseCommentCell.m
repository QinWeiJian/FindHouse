//
//  CXHouseCommentCell.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/11.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXHouseCommentCell.h"

@implementation CXHouseCommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.headImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.lineView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    self.lineView.y = 159;
}

#pragma mark - Getter

- (CXBaseImageView *)headImageView
{
    if (!_headImageView)
    {
        _headImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(Screen_Width/2-40/2, ViewMargin_10, 40, 40)];
        _headImageView.layer.cornerRadius = _headImageView.viewSizeHeight/2;
        _headImageView.backgroundColor = [UIColor blackColor];
    }
    
    return _headImageView;
}

- (CXBaseLabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.headImageView.viewDistanceY, Screen_Width-ViewMargin_Double_10, 30)];
        _nameLabel.textColor = CX_GrayColor;
        _nameLabel.textAlignment = 1;
        _nameLabel.font = FontSize(10);
        _nameLabel.text = @"王尼玛 业主";
        
        _nameLabel.attributedText = [_nameLabel.text cx_changeTextColorWithReplaceString:@"王尼玛" ChangeColor:CX_BlackColor ChangeFont:FontSize(14)];
    }
    
    return _nameLabel;
}

- (CXBaseLabel *)contentLabel
{
    if (!_contentLabel)
    {
        _contentLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(ViewMargin_10, self.nameLabel.viewDistanceY, Screen_Width-ViewMargin_Double_10, 80)];
        _contentLabel.text = @"该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！该房源交通好！！！";
        _contentLabel.numberOfLines = 0;
    }
    
    return _contentLabel;
}

- (UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(ViewMargin_10, 0, Screen_Width-ViewMargin_Double_10, 0.5)];
        _lineView.backgroundColor = CX_LightGrayColor;
    }
    
    return _lineView;
}

@end
