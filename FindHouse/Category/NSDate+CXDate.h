//
//  NSDate+CXDate.h
//  Bolema
//
//  Created by chengxikeji on 16/8/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CXDate)

/*标准时间日期描述*/
- (NSString *)cx_formattedNormalTime;

/**dateformatter = @"MM月dd日 HH:mm"*/
- (NSString *)cx_formatDateWithFormatter_1;

/**dateformatter = @"yyyy-MM-dd"*/
- (NSString *)cx_formatDateWithFormatter_4;

/**dateformatter = @"yyyy-MM-dd HH:mm"*/
- (NSString *)cx_formatDateWithFormatter_5;

@end
