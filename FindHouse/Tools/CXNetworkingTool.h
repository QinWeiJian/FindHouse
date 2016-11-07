//
//  CXNetworkingTool.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^Success)(id JSON,NSURLSessionDataTask *operation);
typedef void (^Failure)(NSError *error,NSURLSessionDataTask *operation);

@interface CXNetworkingTool : NSObject

/**
 *  网络请求 方式=Get
 *
 *  @param baseString    接口前缀
 *  @param pathString    接口地址
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)get_netWorkingToolPostWithBaseUrl:(NSString *)baseString Path:(NSString *)pathString Param:(NSDictionary *)params success:(Success)success failure:(Failure)failure;

/**
 *  网络请求 方式=Post
 *
 *  @param baseString    接口前缀
 *  @param pathString    接口地址
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)post_netWorkingToolPostWithBaseUrl:(NSString *)baseString Path:(NSString *)pathString Param:(NSDictionary *)params success:(Success)success failure:(Failure)failure;

/**
 *  上传图片
 *
 *  @param baseString    接口前缀
 *  @param pathString    接口地址
 *  @param params        post 参数
 *  @param imageData     图片流
 *  @param fileName      图片post参数名
 *  @param filePath      图片名
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)netWorkingToolUploadPictureWithBaseUrl:(NSString *)baseString Path:(NSString *)pathString Param:(NSDictionary *)params ImageData:(NSData *)imageData FileName:(NSString *)fileName FilePath:(NSString *)filePath success:(Success)success failure:(Failure)failure;

@end
