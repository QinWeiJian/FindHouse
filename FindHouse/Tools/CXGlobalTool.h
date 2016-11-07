//
//  CXGlobalTool.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXGlobalTool : NSObject

+ (NSMutableAttributedString *)cx_emotionStrWithString:(NSString *)text textColor:(UIColor *)textColor offset:(CGFloat)offset;

/**画线*/
+ (CAShapeLayer *)cx_drawSeparatorLineWithColor:(UIColor *)color andStartPosition:(CGPoint)startPoint endPosition:(CGPoint)endPoint LineWidth:(CGFloat)width;

/**修复上传图片方向*/
+ (UIImage *)cx_fixImageOrientation:(UIImage *)aImage;

@end
