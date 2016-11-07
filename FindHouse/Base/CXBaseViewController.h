//
//  CXBaseViewController.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXBaseViewController : UIViewController

/**返回Item*/ 
@property(nonatomic,retain)UIBarButtonItem *backItem;

- (void)backItemAction;

@end
