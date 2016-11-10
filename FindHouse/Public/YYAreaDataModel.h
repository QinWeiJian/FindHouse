//
//  YYAreaDataModel.h
//  TSYY-Client
//
//  Created by chengxikeji on 16/7/9.
//  Copyright © 2016年 TORRES9. All rights reserved.
//

#import "CXBaseDataModel.h"

@interface YYAreaDataModel : CXBaseDataModel

@property(nonatomic,copy)NSString *name;

@property(nonatomic,retain)NSMutableArray *childrenArray;

+ (NSArray *)getAreaArray;

@end
