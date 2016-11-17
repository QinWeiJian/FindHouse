//
//  CXProgressHud.h
//  FindHouse
//
//  Created by chengxikeji on 16/11/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXBaseView.h"
#import "CXBaseLabel.h"

@interface CXProgressHud : CXBaseView

@property(nonatomic,retain)CXBaseLabel *progressLabel;

- (id)initWithView:(UIView *)view progressText:(NSString *)progressText;

- (void)show;

- (void)hide;

@end
