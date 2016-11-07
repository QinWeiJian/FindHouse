//
//  CXMessageNormalCell.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableViewCell.h"

@interface CXMessageNormalCell : CXBaseTableViewCell

@property(nonatomic,retain)CXBaseImageView *headImageView;
@property(nonatomic,retain)CXBaseLabel *nameLabel;
@property(nonatomic,retain)CXBaseLabel *timeLabel;
@property(nonatomic,retain)CXBaseLabel *contentLabel;

@end
