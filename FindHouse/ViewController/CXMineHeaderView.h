//
//  CXMineHeaderView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseImageView.h"

@interface CXMineHeaderView : CXBaseImageView

@property(nonatomic,retain)CXBaseImageView *headImageView;
@property(nonatomic,retain)CXBaseLabel *phoneLabel;

- (void)setSubFrame;

@end
