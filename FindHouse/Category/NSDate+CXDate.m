//
//  NSDate+CXDate.m
//  Bolema
//
//  Created by chengxikeji on 16/8/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "NSDate+CXDate.h"

@implementation NSDate (CXDate)

- (NSInteger)hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_HOUR);
}

/*标准时间日期描述*/
- (NSString *)cx_formattedNormalTime
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString * dateNow = [formatter stringFromDate:[NSDate date]];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:[[dateNow substringWithRange:NSMakeRange(8,2)] intValue]];
    [components setMonth:[[dateNow substringWithRange:NSMakeRange(5,2)] intValue]];
    [components setYear:[[dateNow substringWithRange:NSMakeRange(0,4)] intValue]];
    //        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
    //            self.edgesForExtendedLayout =  UIRectEdgeNone;
    //        }
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [gregorian dateFromComponents:components]; //今天 0点时间
    NSInteger hour = [self hoursAfterDate:date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *ret = @"";
    
    //hasAMPM==TURE为12小时制，否则为24小时制
    //    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
    //    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    //    BOOL hasAMPM = containsA.location != NSNotFound;
    
    //    if (!hasAMPM) { //24小时制
    if (hour <= 24 && hour >= 0)
    {
        [dateFormatter setDateFormat:@"今天 HH:mm"];
    }else if (hour < 0 && hour >= -24)
    {
        [dateFormatter setDateFormat:@"昨天 HH:mm"];
    }else
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    //    }else {
    //        if (hour >= 0 && hour <= 6) {
    //            dateFormatter = [NSDateFormatter dateFormatterWithFormat:NSLocalizedString(@"NSDateCategory.text9", @"")];
    //        }else if (hour > 6 && hour <=11 ) {
    //            dateFormatter = [NSDateFormatter dateFormatterWithFormat:NSLocalizedString(@"NSDateCategory.text10", @"")];
    //        }else if (hour > 11 && hour <= 17) {
    //            dateFormatter = [NSDateFormatter dateFormatterWithFormat:NSLocalizedString(@"NSDateCategory.text11", @"")];
    //        }else if (hour > 17 && hour <= 24) {
    //            dateFormatter = [NSDateFormatter dateFormatterWithFormat:NSLocalizedString(@"NSDateCategory.text12", @"")];
    //        }else if (hour < 0 && hour >= -24){
    //            dateFormatter = [NSDateFormatter dateFormatterWithFormat:NSLocalizedString(@"NSDateCategory.text13", @"")];
    //        }else  {
    //            dateFormatter = [NSDateFormatter dateFormatterWithFormat:@"yyyy-MM-dd HH:mm"];
    //        }
    //    }
    
    ret = [dateFormatter stringFromDate:self];
    return ret;
}

/**dateformatter = @"MM月dd日 HH:mm"*/
- (NSString *)cx_formatDateWithFormatter_1
{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:DateFormatter_2];
    
    return [timeFormatter stringFromDate:self];
}

/**dateformatter = @"yyyy-MM-dd HH:mm"*/
- (NSString *)cx_formatDateWithFormatter_5
{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:DateFormatter_5];
    
    return [timeFormatter stringFromDate:self];
}

/**dateformatter = @"yyyy-MM-dd"*/
- (NSString *)cx_formatDateWithFormatter_4
{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:DateFormatter_4];
    
    return [timeFormatter stringFromDate:self];
}

@end
