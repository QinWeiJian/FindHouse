//
//  CXHouseCommentCell.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/11.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableViewCell.h"

@interface CXHouseCommentCell : CXBaseTableViewCell

@property(nonatomic,retain)CXBaseImageView *headImageView;
@property(nonatomic,retain)CXBaseLabel *nameLabel;
@property(nonatomic,retain)CXBaseLabel *contentLabel;
@property(nonatomic,retain)UIView *lineView;

@end
