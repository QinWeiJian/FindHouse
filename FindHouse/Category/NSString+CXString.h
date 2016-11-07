//
//  NSString+CXString.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CXString)

/**计算字符串Size*/
- (CGSize)cx_sizeWithFont:(UIFont *)font ContentMargin:(CGFloat)contentMargin;

/**计算字符串Rect*/
- (CGRect)cx_boundsWithFont:(UIFont *)font BounceSize:(CGSize)bounceSize;

/**改变文本中多个范围字体颜色*/
- (NSAttributedString *)cx_changeTextColorWithReplaceStringArray:(NSArray *)replaceStringArray ChangeColor:(UIColor *)changeColor ChangeFontArray:(NSArray *)changeFontArray;

/**改变文本中单个范围字体颜色*/
- (NSAttributedString *)cx_changeTextColorWithReplaceString:(NSString *)replaceString ChangeColor:(UIColor *)changeColor ChangeFont:(UIFont *)changeFont;

/**给字符串画线*/
- (NSAttributedString *)cx_drawLineWithReplaceString:(NSString *)replaceString ChangeFont:(UIFont *)changeFont;

/**字符串MD5加密*/
- (NSString *)cx_md5HexDigest;

/**处理图片路径*/
- (NSString *)cx_processImageUrlString;

- (NSDate *)cx_getDateWithFormatter:(NSString *)formatter;

/**处理字符串返回<null>*/
- (NSString *)cx_processNullParameter;

@end
