//
//  YYAreaDataModel.m
//  TSYY-Client
//
//  Created by chengxikeji on 16/7/9.
//  Copyright © 2016年 TORRES9. All rights reserved.
//

#import "YYAreaDataModel.h"
#import "JSONKit.h"

@implementation YYAreaDataModel

+ (NSArray *)getAreaArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Area" ofType:@"txt"];
    
    NSString *areaString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *areaArray = [areaString objectFromJSONString];
    
    NSMutableArray *provinceArray = [NSMutableArray array];
    
    for (NSDictionary *provinceDict in areaArray)
    {
        YYAreaDataModel *provinceModel = [[YYAreaDataModel alloc] init];
        
        [provinceModel  setValuesForKeysWithDictionary:provinceDict];
        
        NSArray *provinceChildrenArray = [provinceDict objectForKey:@"children"];
        NSMutableArray *cityArray = [NSMutableArray array];
        
        for (NSDictionary *cityDict in provinceChildrenArray)
        {
            YYAreaDataModel *cityModel = [[YYAreaDataModel alloc] init];
            
            [cityModel  setValuesForKeysWithDictionary:cityDict];
            
            NSArray *cityChildrenArray = [cityDict objectForKey:@"children"];
            NSMutableArray *districtArray = [NSMutableArray array];
            
            for (NSDictionary *districtDict in cityChildrenArray)
            {
                YYAreaDataModel *districtModel = [[YYAreaDataModel alloc] init];
                
                [districtModel  setValuesForKeysWithDictionary:districtDict];
                
                [districtArray addObject:districtModel];
            }
            
            cityModel.childrenArray = districtArray;
            
            [cityArray addObject:cityModel];
        }
        
        provinceModel.childrenArray = cityArray;
        
        [provinceArray addObject:provinceModel];
    }
    
    return provinceArray;
}

@end
