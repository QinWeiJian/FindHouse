//
//  NSMutableDictionary+CXMutableDictionary.m
//  Bolema
//
//  Created by chengxikeji on 16/8/16.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "NSMutableDictionary+CXMutableDictionary.h"

@implementation NSMutableDictionary (CXMutableDictionary)

- (void)cx_setObject:(id)object forKey:(NSString *)key
{
    if ([object isKindOfClass:[NSString class]])
    {
        NSString *stringObject = object;
        
        if (stringObject)
        {
            if (stringObject.length > 0)
            {
                [self setObject:stringObject forKey:key];
            }
        }
    }else
    {
        [self setObject:object forKey:key];
    }
}


@end
