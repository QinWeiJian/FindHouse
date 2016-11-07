//
//  NSString+CXString.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "NSString+CXString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (CXString)

/**计算字符串Size*/
- (CGSize)cx_sizeWithFont:(UIFont *)font ContentMargin:(CGFloat)contentMargin
{
    CGSize contentSize = [self sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    contentSize.width += contentMargin;
    
    return contentSize;
}

/**计算字符串Rect*/
- (CGRect)cx_boundsWithFont:(UIFont *)font BounceSize:(CGSize)bounceSize
{
    CGRect bounceRect = [self boundingRectWithSize:bounceSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    
    return bounceRect;
}

/**改变文本中多个范围字体颜色*/
- (NSAttributedString *)cx_changeTextColorWithReplaceStringArray:(NSArray *)replaceStringArray ChangeColor:(UIColor *)changeColor ChangeFontArray:(NSArray *)changeFontArray
{
    NSRange range;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (int i = 0; i < replaceStringArray.count; i++)
    {
        range = [self rangeOfString:[replaceStringArray objectAtIndex:i]];
        [str addAttribute:NSForegroundColorAttributeName value:changeColor range:range];
        [str addAttribute:NSFontAttributeName value:[changeFontArray objectAtIndex:i] range:range];
    }
    
    return str;
}

/**改变文本中单个范围字体颜色*/
- (NSAttributedString *)cx_changeTextColorWithReplaceString:(NSString *)replaceString ChangeColor:(UIColor *)changeColor ChangeFont:(UIFont *)changeFont
{
    NSRange range = [self rangeOfString:replaceString];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self];
    [str addAttribute:NSForegroundColorAttributeName value:changeColor range:range];
    [str addAttribute:NSFontAttributeName value:changeFont range:range];
    
    return str;
}

/**给字符串画线*/
- (NSAttributedString *)cx_drawLineWithReplaceString:(NSString *)replaceString ChangeFont:(UIFont *)changeFont
{
    NSRange range = [self rangeOfString:replaceString];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self];
    [str addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    [str addAttribute:NSFontAttributeName value:changeFont range:range];
    
    return str;
}

/**字符串MD5加密*/
- (NSString *)cx_md5HexDigest
{
    const char *original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++)
    {
        [hash appendFormat:@"%02X", result[i]];
    }
    
    return [hash lowercaseString];
}

/**处理图片路径*/
- (NSString *)cx_processImageUrlString
{
    if (self.length >= 4)
    {
        NSRange prefixRange = NSMakeRange(0, 4);
        
        NSString *prefixString = [self substringWithRange:prefixRange];
        
        NSMutableString *returnString;
        if ([prefixString isEqualToString:@"http"])
        {
            returnString = [NSMutableString stringWithString:self];
            [returnString replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, returnString.length)];
        }else
        {
            returnString = [NSMutableString stringWithString:[NSString stringWithFormat:@"http://blm.ichengxi.cn/res/%@",self]];
            [returnString replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, returnString.length)];
        }
        
        return returnString;
    }
    
    return self;
}

- (NSDate *)cx_getDateWithFormatter:(NSString *)formatter
{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:formatter];
    
    return [timeFormatter dateFromString:self];
}

/**处理字符串返回<null>*/
- (NSString *)cx_processNullParameter
{
    if (![self isEqualToString:@"<null>"])
    {
        return self;
    }
    
    return @"";
}

@end
