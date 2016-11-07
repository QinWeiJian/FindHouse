//
//  CXNetworkingTool.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXNetworkingTool.h"

@implementation CXNetworkingTool

/**
 *  网络请求 方式=Post
 *
 *  @param baseString    接口前缀
 *  @param pathString    接口地址
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)post_netWorkingToolPostWithBaseUrl:(NSString *)baseString Path:(NSString *)pathString Param:(NSDictionary *)params success:(Success)success failure:(Failure)failure
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSString *url = [[NSString stringWithFormat:@"%@%@",baseString,pathString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    return [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        NSLog(@"%@",operation.responseString);
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//        
//        success(dict,operation);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        failure(error,operation);
//    }];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager POST:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        success(dict,task);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        failure(error,task);
    }];
}

/**
 *  网络请求 方式=Get
 *
 *  @param baseString    接口前缀
 *  @param pathString    接口地址
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)get_netWorkingToolPostWithBaseUrl:(NSString *)baseString Path:(NSString *)pathString Param:(NSDictionary *)params success:(Success)success failure:(Failure)failure
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSString *url = [[NSString stringWithFormat:@"%@%@",baseString,pathString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    return [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        NSLog(@"%@",operation.responseString);
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//        
//        success(dict,operation);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        failure(error,operation);
//        
//    }];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        success(dict,task);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        failure(error,task);
    }];
}

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
+ (NSURLSessionDataTask *)netWorkingToolUploadPictureWithBaseUrl:(NSString *)baseString Path:(NSString *)pathString Param:(NSDictionary *)params ImageData:(NSData *)imageData FileName:(NSString *)fileName FilePath:(NSString *)filePath success:(Success)success failure:(Failure)failure
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSString *url = [[NSString stringWithFormat:@"%@%@",baseString,pathString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
//    manager.requestSerializer.timeoutInterval = 10;
//    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"Application/json"];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    return [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
//        [formData appendPartWithFileData:imageData name:fileName fileName:filePath mimeType:@"image/jpeg"];
//    } success:^(AFHTTPRequestOperation *operation, id responseObejct){
//        NSLog(@"%@",operation.responseString);
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObejct options:NSJSONReadingMutableLeaves error:nil];
//        
//        success(dict,operation);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        failure(error,operation);
//    }];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:imageData name:fileName fileName:filePath mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        success(dict,task);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

        failure(error,task);
    }];
}

@end
