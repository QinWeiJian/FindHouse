//
//  CXGetDataTool.m
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXGetDataTool.h"
#import "NSMutableDictionary+CXMutableDictionary.h"

//------------------------------------------------格式----------------------------------------------------------

///**
// *  登陆
// *
// *  @param account    账号
// *  @param password   密码
// *
// *  @return 请求对象
// */
//+ (NSURLSessionDataTask *)cx_loginWithAccount:(NSString *)account password:(NSString *)password success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
//{
//    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
//    [param setObject:account forKey:@"phone"];
//    [param setObject:password forKey:@"password"];
//
//    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:Base_Url Path:Login_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
//        getDataSuccess(JSON , operation);
//    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
//        getDataFail(error , operation);
//    }];
//}

@implementation CXGetDataTool

/**
 *  登陆
 *
 *  @param phone    手机号码
 *  @param password   密码（密码长度为6-16个字符，且不能有空格）
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_loginWithPhone:(NSString *)phone password:(NSString *)password success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:phone forKey:@"phone"];
    [param setObject:password forKey:@"password"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_Login_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];

}

/**
 *  注册
 *
 *  @param phone      手机号码
 *  @param password   密码（密码长度为6-16个字符，且不能有空格）
 *  @param code       验证码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_registerWithPhone:(NSString *)phone password:(NSString *)password verifyCode:(NSString *)verifyCode visiCode:(NSString *)visiCode success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:phone forKey:@"phone"];
    [param setObject:password forKey:@"password"];
    [param setObject:verifyCode forKey:@"code"];
    [param cx_setObject:visiCode forKey:@"visiCode"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_Register_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  获取手机验证码
 *
 *  @param phone      手机号码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getPhoneVerifyCodeWithPhone:(NSString *)phone success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:phone forKey:@"phone"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_PhoneVerifyCode_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  重置密码
 *
 *  @param phone      手机号码
 *  @param newpass    新密码
 *  @param code       验证码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_resetPasswordWithPhone:(NSString *)phone newPassword:(NSString *)password verifyCode:(NSString *)verifyCode success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:phone forKey:@"phone"];
    [param setObject:password forKey:@"newpass"];
    [param setObject:verifyCode forKey:@"code"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ResetPassword_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  意见反馈
 *
 *  @param uid      用户id
 *  @param content  反馈内容
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_feedBackWithUserID:(NSString *)userID content:(NSString *)content success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"uid"];
    [param setObject:content forKey:@"content"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_FeedBack_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  上传图片
 *
 *  @param sub   文件上传的子目录(上传头像:Head/ 发帖子:Posts/ )
 *  @param file  上传的文件
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_uploadImageWithImage:(UIImage *)image sub:(NSString *)sub success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    
    [[NSFileManager defaultManager] createDirectoryAtPath:[docPath stringByAppendingPathComponent:@"CXPicture"] withIntermediateDirectories:YES attributes:nil error:nil];
    
    docPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"CXPicture"];
    
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"yyyyMMddhhmmss"];
    NSString *strTime = [NSString stringWithFormat:@"%@",[myFormatter stringFromDate:[NSDate date]]];
    NSString *strName = [strTime stringByAppendingString:@".png"];
    //    NSString *strPath = [docPath stringByAppendingPathComponent:strName];
    NSData *imageDatass = UIImageJPEGRepresentation(image,0.01);
    //    [imageDatass writeToFile:strPath atomically:YES];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:sub forKey:@"sub"];
    
    return [CXNetworkingTool netWorkingToolUploadPictureWithBaseUrl:CX_Base_Url Path:CX_UploadImage_Url Param:param ImageData:imageDatass FileName:@"file" FilePath:strName success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  成为艺人
 *
 *  @param id                   用户id
 *  @param sex                  1男2女
 *  @param artist_nickname      艺人昵称
 *  @param artist_head          艺人头像
 *  @param a_province           省份
 *  @param a_city               市
 *  @param a_area               区
 *  @param a_address            地址
 *  @param u_height             身高
 *  @param u_weight             体重
 *  @param u_sanwei             三围
 *  @param role                 角色 id
 *  @param cost                 角色对应的价格 注意两个数组 长度要一致
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_becomeArtistWithUserID:(NSString *)userID sex:(NSString *)sex artist_nickname:(NSString *)artist_nickname artist_head:(NSString *)artist_head a_province:(NSString *)a_province a_city:(NSString *)a_city a_area:(NSString *)a_area a_address:(NSString *)a_address u_height:(NSString *)u_height u_weight:(NSString *)u_weight u_sanwei:(NSString *)u_sanwei role:(NSArray *)role cost:(NSArray *)cost lat:(NSString *)lat lng:(NSString *)lng success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"id"];
    [param cx_setObject:sex forKey:@"sex"];
    [param cx_setObject:artist_nickname forKey:@"artist_nickname"];
    [param cx_setObject:artist_head forKey:@"artist_head"];
    [param cx_setObject:a_province forKey:@"a_province"];
    [param cx_setObject:a_city forKey:@"a_city"];
    [param cx_setObject:a_area forKey:@"a_area"];
    [param cx_setObject:a_address forKey:@"a_address"];
    [param cx_setObject:u_height forKey:@"u_height"];
    [param cx_setObject:u_weight forKey:@"u_weight"];
    [param cx_setObject:u_sanwei forKey:@"u_sanwei"];
    [param cx_setObject:lat forKey:@"lat"];
    [param cx_setObject:lng forKey:@"lng"];
    [param setObject:role forKey:@"role"];
    [param setObject:cost forKey:@"cost"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_BecomeArtist_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  获得所有的艺人角色
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getAllArtistRoleSuccess:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_GetAllArtistRole_Url Param:nil success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  获得用户信息
 *
 *  @param id                   用户id
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getUserInfoWithUserID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"uid"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_GetUserInfo_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  修改艺人资料
 *
 *  @param id                   用户id
 *  @param sex                  1男2女
 *  @param artist_nickname      艺人昵称
 *  @param artist_head          艺人头像
 *  @param a_province           省份
 *  @param a_city               市
 *  @param a_area               区
 *  @param a_address            地址
 *  @param u_height             身高
 *  @param u_weight             体重
 *  @param u_sanwei             三围
 *  @param lat                  纬度
 *  @param lng                  经度
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_modifyArtistInfoWithUserID:(NSString *)userID sex:(NSString *)sex artist_nickname:(NSString *)artist_nickname artist_head:(NSString *)artist_head a_province:(NSString *)a_province a_city:(NSString *)a_city a_area:(NSString *)a_area a_address:(NSString *)a_address u_height:(NSString *)u_height u_weight:(NSString *)u_weight u_sanwei:(NSString *)u_sanwei lat:(NSString *)lat lng:(NSString *)lng success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"id"];
    [param cx_setObject:sex forKey:@"sex"];
    [param cx_setObject:artist_nickname forKey:@"artist_nickname"];
    [param cx_setObject:artist_head forKey:@"artist_head"];
    [param cx_setObject:a_province forKey:@"a_province"];
    [param cx_setObject:a_city forKey:@"a_city"];
    [param cx_setObject:a_area forKey:@"a_area"];
    [param cx_setObject:a_address forKey:@"a_address"];
    [param cx_setObject:u_height forKey:@"u_height"];
    [param cx_setObject:u_weight forKey:@"u_weight"];
    [param cx_setObject:u_sanwei forKey:@"u_sanwei"];
    [param cx_setObject:lat forKey:@"lat"];
    [param cx_setObject:lng forKey:@"lng"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ModifyUserInfo_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  修改艺人角色
 *
 *  @param aid                   艺人id
 *  @param role                  角色数组
 *  @param cost                  价格数组 与角色数组一一对应
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_modifyArtistRoleWithUserID:(NSString *)userID role:(NSArray *)role cost:(NSArray *)cost success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"aid"];
    [param setObject:role forKey:@"role"];
    [param setObject:cost forKey:@"cost"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ModifyArtistRole_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  修改用户资料
 *
 *  @param id                   用户id
 *  @param u_head               用户头像
 *  @param nickname             用户昵称
 *  @param u_address            用户地址
 *  @param u_province           省
 *  @param u_city               市
 *  @param u_area               区
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_modifyUserInfoWithUserID:(NSString *)userID u_head:(NSString *)u_head nickname:(NSString *)nickname u_address:(NSString *)u_address u_province:(NSString *)u_province u_city:(NSString *)u_city u_area:(NSString *)u_area success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"id"];
    [param cx_setObject:u_head forKey:@"u_head"];
    [param cx_setObject:nickname forKey:@"nickname"];
    [param cx_setObject:u_address forKey:@"u_address"];
    [param cx_setObject:u_province forKey:@"u_province"];
    [param cx_setObject:u_city forKey:@"u_city"];
    [param cx_setObject:u_area forKey:@"u_area"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ModifyUserInfo_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  获得所有的福利类型
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getAllWelfareTagSuccess:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_GetAllWelfareTag_Url Param:nil success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  首页初始化
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_homePageInitSuccess:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_HomeInit_Url Param:nil success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  推荐艺人
 *
 *  @param page               页码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getRecommendArtistListWithPage:(NSString *)page Success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_RecommendArtist_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  推荐商演
 *
 *  @param page               页码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getRecommendBusinessShowListWithPage:(NSString *)page Success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_RecommendBusinessShow_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  最新商演
 *
 *  @param page               页码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getNewestBusinessShowListWithPage:(NSString *)page success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_NewestBusinessShow_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  最新艺人
 *
 *  @param page               页码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getNewestArtistListWithPage:(NSString *)page Success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_NewestArtist_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  最近艺人
 *
 *  @param page               页码
 *  @param lat                纬度
 *  @param lng                经度
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getClosestArtistListWithPage:(NSString *)page lat:(NSString *)lat lng:(NSString *)lng success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:page forKey:@"page"];
    [param setObject:lat forKey:@"lat"];
    [param setObject:lng forKey:@"lng"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ClosestArtist_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  获得所有的商演服务类型
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getAllBusinessShowTypeSuccess:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_AllBusinessShowType_Url Param:nil success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  艺人详情
 *
 *  @param id               艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistDetailsWithArtistID:(NSString *)artistID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:artistID forKey:@"id"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ArtistDetails_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  艺人套餐列表
 *
 *  @param page               页码
 *  @param uid                艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistSetsListWithPage:(NSString *)page artistID:(NSString *)artistID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:artistID forKey:@"uid"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ArtistSets_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  艺人才艺秀列表
 *
 *  @param page               页码
 *  @param uid                艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistTalentShowListWithPage:(NSString *)page artistID:(NSString *)artistID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:artistID forKey:@"uid"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ArtistTalentShowList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  艺人评论列表
 *
 *  @param page               页码
 *  @param to_uid             艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistCommentListWithPage:(NSString *)page artistID:(NSString *)artistID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:artistID forKey:@"to_uid"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ArtistCommentList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  才艺秀评论列表
 *
 *  @param page               页码
 *  @param sid                才艺秀id
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getTalentShowCommentListWithPage:(NSString *)page sid:(NSString *)sid success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:sid forKey:@"sid"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_TalentShowCommentList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  才艺秀评论
 *
 *  @param s_id               才艺秀ID
 *  @param u_id               用户ID
 *  @param to_commentid       A评论B，此时是B评论的id
 *  @param content            评论内容
 *  @param to_content         b评论的内容
 *  @param to_time            b评论的时间
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_talentShowCommentWithShowID:(NSString *)showID UserID:(NSString *)userID commentContent:(NSString *)commentContent toCommentUserID:(NSString *)toCommentUserID toCommentContent:(NSString *)toCommentContent toCommentTime:(NSString *)toCommentTime success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:showID forKey:@"s_id"];
    [param cx_setObject:userID forKey:@"u_id"];
    [param cx_setObject:commentContent forKey:@"content"];
    [param cx_setObject:toCommentUserID forKey:@"to_commentid"];
    [param cx_setObject:toCommentContent forKey:@"to_content"];
    [param cx_setObject:toCommentTime forKey:@"to_time"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_TalentShowComment_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  提现记录列表
 *
 *  @param page               页码
 *  @param uid                艺人id
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getWithdrawalRecordListWithPage:(NSString *)page uid:(NSString *)uid success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:uid forKey:@"uid"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool get_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_WithdrawalRecord_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  提现
 *
 *  @param apply_money        提现金额
 *  @param uid                艺人id
 *  @param pay_type           1银行卡 2支付宝
 *  @param password           提现密码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_withdrawalWithUid:(NSString *)uid apply_money:(NSString *)apply_money password:(NSString *)password pay_type:(NSString *)pay_type success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:uid forKey:@"uid"];
    [param cx_setObject:apply_money forKey:@"apply_money"];
    [param cx_setObject:password forKey:@"password"];
    [param cx_setObject:pay_type forKey:@"pay_type"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_Withdrawal_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  绑定支付宝
 *
 *  @param alipay_account     支付宝账号
 *  @param id                 用户id
 *  @param alipay_nickname    支付宝昵称
 *  @param alipay_password    支付宝密码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_bindAlipayWithUserID:(NSString *)userID alipay_account:(NSString *)alipay_account alipay_nickname:(NSString *)alipay_nickname alipay_password:(NSString *)alipay_password success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:userID forKey:@"id"];
    [param cx_setObject:alipay_account forKey:@"alipay_account"];
    [param cx_setObject:alipay_nickname forKey:@"alipay_nickname"];
    [param cx_setObject:alipay_password forKey:@"alipay_password"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_BindAlipay_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  绑定银行卡
 *
 *  @param bank_account       银行卡账号
 *  @param id                 用户id
 *  @param bank_cardnum       银行卡卡号
 *  @param bank_kaihuhang     开户行
 *  @param bank_password      银行密码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_bindBankCardWithUserID:(NSString *)userID bank_account:(NSString *)bank_account bank_cardnum:(NSString *)bank_cardnum bank_kaihuhang:(NSString *)bank_kaihuhang bank_password:(NSString *)bank_password success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:userID forKey:@"id"];
    [param cx_setObject:bank_account forKey:@"bank_account"];
    [param cx_setObject:bank_cardnum forKey:@"bank_cardnum"];
    [param cx_setObject:bank_kaihuhang forKey:@"bank_kaihuhang"];
    [param cx_setObject:bank_password forKey:@"bank_password"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_BindBankCard_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  我的下线
 *
 *  @param page               页码
 *  @param id                 用户ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMyDownLineListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"id"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_MyDownLine_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  收藏的艺人
 *
 *  @param page               页码
 *  @param uid                用户ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMyCollectionArtistListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"uid"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_CollectionArtist_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  收藏的商演
 *
 *  @param page               页码
 *  @param my_userid          用户ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMyCollectionBusinessShowListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"my_userid"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_CollectionBusinessShow_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  用户全部订单列表
 *
 *  @param page               页码
 *  @param u_id               用户ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getUserAllOrderListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"u_id"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_UserAllOrderList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  用户订单列表
 *
 *  @param page               页码
 *  @param u_id               用户ID
 *  @param state              5未付定金 10已付定金 15服务中 20已完成 25已取消
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getUserOrderListWithPage:(NSString *)page userID:(NSString *)userID state:(NSString *)state success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"u_id"];
    [param setObject:page forKey:@"page"];
    [param setObject:state forKey:@"state"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_UserOrderList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  艺人全部订单列表
 *
 *  @param page               页码
 *  @param u_id               艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistAllOrderListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"u_id"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ArtistAllOrderList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  艺人订单列表
 *
 *  @param page               页码
 *  @param u_id               艺人ID
 *  @param state              5未付定金 10已付定金 15服务中 20已完成 25已取消 30爽约申请 35爽约申请通过 40爽约申请不通过
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistOrderListWithPage:(NSString *)page userID:(NSString *)userID state:(NSString *)state success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:userID forKey:@"u_id"];
    [param setObject:page forKey:@"page"];
    [param setObject:state forKey:@"state"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ArtistOrderList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  订单详情
 *
 *  @param id               订单ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getOrderDetailWithOrderID:(NSString *)orderID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:orderID forKey:@"id"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_OrderDetail_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  消息列表
 *
 *  @param page               页码
 *  @param artist_id          艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMessageListWithPage:(NSString *)page artist_id:(NSString *)artist_id success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:artist_id forKey:@"artist_id"];
    [param setObject:page forKey:@"page"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_MessageList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  档期列表
 *
 *  @param uid          艺人ID
 *  @param year         年
 *  @param month        月
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getCalendarListWithArtistID:(NSString *)artistID year:(NSString *)year month:(NSString *)month success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:artistID forKey:@"uid"];
    [param setObject:year forKey:@"year"];
    [param setObject:month forKey:@"month"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_CalendarList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  拒绝或接受邀约
 *
 *  @param id          消息ID
 *  @param type        1接受 2拒绝
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_changeInvitationStateWithMessageID:(NSString *)messageID type:(NSString *)type success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:messageID forKey:@"id"];
    [param setObject:type forKey:@"type"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_ChangeInvitationState_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  我的派单列表
 *
 *  @param page               页码
 *  @param uid                用户ID
 *  @param type               1待处理 2已过期 3全部
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMySendOrderListWithPage:(NSString *)page uid:(NSString *)uid type:(NSString *)type success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:page forKey:@"page"];
    [param setObject:uid forKey:@"uid"];
    [param setObject:type forKey:@"type"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_MySendOrderList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  我的派单报名列表
 *
 *  @param page               页码
 *  @param bshow_id           商演id
 *  @param state              0待处理 1接受 2拒绝 3全部
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMySendOrderApplyListWithPage:(NSString *)page bshow_id:(NSString *)bshow_id state:(NSString *)state success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:page forKey:@"page"];
    [param setObject:bshow_id forKey:@"bshow_id"];
    [param setObject:state forKey:@"state"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_MySendOrderApplyList_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  商演报名
 *
 *  @param artist_id          艺人ID
 *  @param bshow_id           商演id
 *  @param price              期待薪资
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_businessShowApplyWithArtistID:(NSString *)artist_id bshow_id:(NSString *)bshow_id price:(NSString *)price success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:artist_id forKey:@"artist_id"];
    [param setObject:bshow_id forKey:@"bshow_id"];
    [param setObject:price forKey:@"price"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_BusinessShowApply_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  商演详情
 *
 *  @param artist_id          艺人ID
 *  @param id                 商演ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_businessShowDetailWithArtistID:(NSString *)artist_id showID:(NSString *)showID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:artist_id forKey:@"artist_id"];
    [param setObject:showID forKey:@"id"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_BusinessShowDetail_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  预约艺人
 *
 *  @param type               1档期预约 2套餐预约
 *  @param role_name          角色名
 *  @param price              角色对应价格
 *  @param work_date          工作日期
 *  @param work_area          工作时间区域 1,2,3
 *  @param customer_name      客户名
 *  @param contact_phone      联系电话
 *  @param service_address    服务地址
 *  @param remarks            备注
 *  @param setmeal_id         套餐id
 *  @param artist_id          艺人id
 *  @param u_id               用户ID
 *  @param u_head             用户头像
 *  @param u_nickname         用户昵称
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_orderArtistWithType:(NSString *)type role_name:(NSString *)role_name price:(NSString *)price work_date:(NSString *)work_date work_area:(NSString *)work_area customer_name:(NSString *)customer_name contact_phone:(NSString *)contact_phone service_address:(NSString *)service_address remarks:(NSString *)remarks setmeal_id:(NSString *)setmeal_id artist_id:(NSString *)artist_id u_id:(NSString *)u_id u_head:(NSString *)u_head u_nickname:(NSString *)u_nickname success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:type forKey:@"type"];
    [param cx_setObject:role_name forKey:@"role_name"];
    [param cx_setObject:price forKey:@"price"];
    [param cx_setObject:work_date forKey:@"work_date"];
    [param cx_setObject:work_area forKey:@"work_area"];
    [param cx_setObject:customer_name forKey:@"customer_name"];
    [param cx_setObject:contact_phone forKey:@"contact_phone"];
    [param cx_setObject:service_address forKey:@"service_address"];
    [param cx_setObject:remarks forKey:@"remarks"];
    [param cx_setObject:setmeal_id forKey:@"setmeal_id"];
    [param cx_setObject:artist_id forKey:@"artist_id"];
    [param cx_setObject:u_id forKey:@"u_id"];
    [param cx_setObject:u_head forKey:@"u_head"];
    [param cx_setObject:u_nickname forKey:@"u_nickname"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_OrderArtist_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  搜索商演
 *
 *  @param page               页码
 *  @param province           艺人所在省
 *  @param city               艺人所在市
 *  @param area               艺人所在区
 *  @param bc_id              类型id
 *  @param sType              1最新 2最热
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_searchBusinessShowWithPage:(NSString *)page province:(NSString *)province city:(NSString *)city area:(NSString *)area bc_id:(NSString *)bc_id sType:(NSString *)sType success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:page forKey:@"page"];
    [param cx_setObject:province forKey:@"province"];
    [param cx_setObject:city forKey:@"city"];
    [param cx_setObject:area forKey:@"area"];
    [param cx_setObject:bc_id forKey:@"bc_id"];
    [param cx_setObject:sType forKey:@"sType"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_SearchBusinessShow_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  搜索艺人
 *
 *  @param page               页码
 *  @param a_province         艺人所在省
 *  @param a_city             艺人所在市
 *  @param a_area             艺人所在区
 *  @param cid                角色id
 *  @param sType              1最新 2最热
 *  @param sex                1男 2女 不限则不传
 *  @param s_height           最小值
 *  @param e_height           最大值
 *  @param s_weight           最小值
 *  @param e_weight           最大值
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_searchArtistWithPage:(NSString *)page a_province:(NSString *)a_province a_city:(NSString *)a_city a_area:(NSString *)a_area cid:(NSString *)cid sType:(NSString *)sType sex:(NSString *)sex s_height:(NSString *)s_height e_height:(NSString *)e_height s_weight:(NSString *)s_weight e_weight:(NSString *)e_weight success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:page forKey:@"page"];
    [param cx_setObject:a_province forKey:@"a_province"];
    [param cx_setObject:a_city forKey:@"a_city"];
    [param cx_setObject:a_area forKey:@"a_area"];
    [param cx_setObject:cid forKey:@"cid"];
    [param cx_setObject:sType forKey:@"sType"];
    [param cx_setObject:sex forKey:@"sex"];
    [param cx_setObject:s_height forKey:@"s_height"];
    [param cx_setObject:e_height forKey:@"e_height"];
    [param cx_setObject:s_weight forKey:@"s_weight"];
    [param cx_setObject:e_weight forKey:@"e_weight"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_SearchArtist_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  发布才艺秀
 *
 *  @param uid               用户id
 *  @param content           内容
 *  @param imgs              图片，多个地址 , 分割
 *  @param show_tag          标签名字 , 分割
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_publishTalentShowWithUserID:(NSString *)userID content:(NSString *)content imgs:(NSString *)imgs show_tag:(NSString *)show_tag success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:userID forKey:@"uid"];
    [param cx_setObject:content forKey:@"content"];
    [param cx_setObject:imgs forKey:@"imgs"];
    [param cx_setObject:show_tag forKey:@"show_tag"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_PublishTalentShow_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

/**
 *  发布商演
 *
 *  @param uid               用户id
 *  @param subject           商演主题
 *  @param end_date          截止日期 格式 2016-11-11 12:15:15
 *  @param work_date         2016-03-10~2016-03-20
 *  @param work_timearea     1,2,3
 *  @param contact_name      联系人
 *  @param contact_phone     联系方式
 *  @param sex_limit         1男 2女 3不限
 *  @param service_type      服务类型的 id 数组
 *  @param cost              薪资报酬
 *  @param weal              福利 xxx,xxx,xxx
 *  @param shortinfo         商演简介
 *  @param imgs              地址 , 分割
 *  @param work_address      地址
 *  @param province          省
 *  @param city              市
 *  @param area              区
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_publishBusinessShowWithUserID:(NSString *)userID subject:(NSString *)subject end_date:(NSString *)end_date work_date:(NSString *)work_date work_timearea:(NSString *)work_timearea contact_name:(NSString *)contact_name contact_phone:(NSString *)contact_phone sex_limit:(NSString *)sex_limit service_type:(NSArray *)service_type cost:(NSString *)cost weal:(NSString *)weal shortinfo:(NSString *)shortinfo imgs:(NSString *)imgs work_address:(NSString *)work_address province:(NSString *)province city:(NSString *)city area:(NSString *)area success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param cx_setObject:userID forKey:@"uid"];
    [param cx_setObject:subject forKey:@"subject"];
    [param cx_setObject:end_date forKey:@"end_date"];
    [param cx_setObject:work_date forKey:@"work_date"];
    [param cx_setObject:work_timearea forKey:@"work_timearea"];
    [param cx_setObject:contact_name forKey:@"contact_name"];
    [param cx_setObject:contact_phone forKey:@"contact_phone"];
    [param cx_setObject:sex_limit forKey:@"sex_limit"];
    [param cx_setObject:service_type forKey:@"service_type"];
    [param cx_setObject:cost forKey:@"cost"];
    [param cx_setObject:weal forKey:@"weal"];
    [param cx_setObject:shortinfo forKey:@"shortinfo"];
    [param cx_setObject:imgs forKey:@"imgs"];
    [param cx_setObject:work_address forKey:work_address];
    [param cx_setObject:province forKey:@"province"];
    [param cx_setObject:city forKey:@"city"];
    [param cx_setObject:area forKey:@"area"];
    
    return [CXNetworkingTool post_netWorkingToolPostWithBaseUrl:CX_Base_Url Path:CX_PublishBusinessShow_Url Param:param success:^(id JSON, NSURLSessionDataTask *operation) {
        getDataSuccess(JSON , operation);
    } failure:^(NSError *error, NSURLSessionDataTask *operation) {
        getDataFail(error , operation);
    }];
}

@end
