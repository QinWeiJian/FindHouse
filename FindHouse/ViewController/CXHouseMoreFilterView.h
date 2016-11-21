//
//  CXHouseMoreFilterView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/21.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseTableView.h"

@interface CXHouseMoreFilterView : CXBaseTableView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UIButton *commitButton;
@property(nonatomic,retain)UIButton *resetButton;

@end
