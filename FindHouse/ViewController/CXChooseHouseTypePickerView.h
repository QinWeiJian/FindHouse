//
//  CXChooseHouseTypePickerView.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/24.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

typedef void(^CXChooseHouseTypePickerViewCommitBlock)(NSString *);

@interface CXChooseHouseTypePickerView : CXBaseView

@property(nonatomic,copy)CXChooseHouseTypePickerViewCommitBlock commitBlock;

- (void)show;

- (void)hide;

@end
