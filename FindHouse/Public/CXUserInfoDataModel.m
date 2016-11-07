//
//  CXUserInfoDataModel.m
//  Bolema
//
//  Created by chengxikeji on 16/8/8.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXUserInfoDataModel.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation CXUserInfoDataModel

// 返回self的所有对象名称
+ (NSArray *)propertyOfSelf
{
    unsigned int count;
    // 1. 获得类中的所有成员变量
    Ivar *ivarList = class_copyIvarList(self, &count);
    NSMutableArray *properNames =[NSMutableArray array];
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = ivarList[i];
        // 2.获得成员属性名
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 3.除去下划线，从第一个角标开始截取
        NSString *key = [name substringFromIndex:1];
        [properNames addObject:key];
    }
    
    free(ivarList);//修复调用此方法,造成的几处内存泄露(5.18-ZHU)
    
    return [properNames copy];
}

// 归档
- (void)encodeWithCoder:(NSCoder *)enCoder
{
    // 取得所有成员变量名
    NSArray *properNames = [[self class] propertyOfSelf];
    for (NSString *propertyName in properNames)
    {
        // 创建指向get方法
        SEL getSel = NSSelectorFromString(propertyName);
        // 对每一个属性实现归档
        SuppressPerformSelectorLeakWarning(
                                           [enCoder encodeObject:[self performSelector:getSel] forKey:propertyName];
                                           );
    }
}

// 解档
- (id)initWithCoder:(NSCoder *)aDecoder
{
    // 取得所有成员变量名
    NSArray *properNames = [[self class] propertyOfSelf];
    for (NSString *propertyName in properNames)
    {
        // 创建指向属性的set方法
        // 1.获取属性名的第一个字符，变为大写字母
        NSString *firstCharater = [propertyName substringToIndex:1].uppercaseString;
        // 2.替换掉属性名的第一个字符为大写字符，并拼接出set方法的方法名
        NSString *setPropertyName = [NSString stringWithFormat:@"set%@%@:",firstCharater,[propertyName substringFromIndex:1]];
        SEL setSel = NSSelectorFromString(setPropertyName);
        SuppressPerformSelectorLeakWarning(
                                           [self performSelector:setSel withObject:[aDecoder decodeObjectForKey:propertyName]];
                                           );
    }
    return  self;
}

@end
