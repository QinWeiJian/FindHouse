//
//  CXHouseTapLabel.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/11.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"

@interface CXHouseTapLabel : CXBaseView

@property(nonatomic,retain)CXBaseLabel *tapLabel;
@property(nonatomic,retain)CXBaseLabel *contentLabel;

- (id)initWithFrame:(CGRect)frame tap:(NSString *)tap;

@end
