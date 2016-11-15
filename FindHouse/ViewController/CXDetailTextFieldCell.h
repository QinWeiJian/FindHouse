//
//  CXDetailTextFieldCell.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/15.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableViewCell.h"

@interface CXDetailTextFieldCell : CXBaseTableViewCell

@property(nonatomic,retain)CXBaseLabel *titleLabel;
@property(nonatomic,retain)CXInsetsField *detailTextField;

@end
