//
//  CXGetDataTool.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

//------------------------------------------------格式----------------------------------------------------------

///**
// *  登陆
// *
// *  @param account    账号
// *  @param password   密码
// *
// *  @return 请求对象
// */
//+ (NSURLSessionDataTask *)cx_loginWithAccount:(NSString *)account password:(NSString *)password success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

#import <Foundation/Foundation.h>
#import "CXNetworkingTool.h"

typedef void (^GetDataSuccess)(id JSON , NSURLSessionDataTask *operation);
typedef void (^GetDataFailure)(NSError *error , NSURLSessionDataTask *operation);

@interface CXGetDataTool : NSObject

/**
 *  登陆
 *
 *  @param phone      手机号码
 *  @param password   密码（密码长度为6-16个字符，且不能有空格）
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_loginWithPhone:(NSString *)phone password:(NSString *)password success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  注册
 *
 *  @param phone      手机号码
 *  @param password   密码（密码长度为6-16个字符，且不能有空格）
 *  @param code       验证码
 *  @param visiCode   邀请码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_registerWithPhone:(NSString *)phone password:(NSString *)password verifyCode:(NSString *)verifyCode visiCode:(NSString *)visiCode success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  获取手机验证码
 *
 *  @param phone      手机号码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getPhoneVerifyCodeWithPhone:(NSString *)phone success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  重置密码
 *
 *  @param phone      手机号码
 *  @param newpass    新密码
 *  @param code       验证码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_resetPasswordWithPhone:(NSString *)phone newPassword:(NSString *)password verifyCode:(NSString *)verifyCode success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  意见反馈
 *
 *  @param uid      用户id
 *  @param content  反馈内容
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_feedBackWithUserID:(NSString *)userID content:(NSString *)content success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  上传图片
 *
 *  @param sub   文件上传的子目录(上传头像:Head/ 发帖子:Posts/ )
 *  @param file  上传的文件
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_uploadImageWithImage:(UIImage *)image sub:(NSString *)sub success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_becomeArtistWithUserID:(NSString *)userID sex:(NSString *)sex artist_nickname:(NSString *)artist_nickname artist_head:(NSString *)artist_head a_province:(NSString *)a_province a_city:(NSString *)a_city a_area:(NSString *)a_area a_address:(NSString *)a_address u_height:(NSString *)u_height u_weight:(NSString *)u_weight u_sanwei:(NSString *)u_sanwei role:(NSArray *)role cost:(NSArray *)cost lat:(NSString *)lat lng:(NSString *)lng success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  获得所有的艺人角色
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getAllArtistRoleSuccess:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  获得用户信息
 *
 *  @param uid                   用户id
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getUserInfoWithUserID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_modifyArtistInfoWithUserID:(NSString *)userID sex:(NSString *)sex artist_nickname:(NSString *)artist_nickname artist_head:(NSString *)artist_head a_province:(NSString *)a_province a_city:(NSString *)a_city a_area:(NSString *)a_area a_address:(NSString *)a_address u_height:(NSString *)u_height u_weight:(NSString *)u_weight u_sanwei:(NSString *)u_sanwei lat:(NSString *)lat lng:(NSString *)lng success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  修改艺人角色
 *
 *  @param aid                   艺人id
 *  @param role                  角色数组
 *  @param cost                  价格数组 与角色数组一一对应
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_modifyArtistRoleWithUserID:(NSString *)userID role:(NSArray *)role cost:(NSArray *)cost success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_modifyUserInfoWithUserID:(NSString *)userID u_head:(NSString *)u_head nickname:(NSString *)nickname u_address:(NSString *)u_address u_province:(NSString *)u_province u_city:(NSString *)u_city u_area:(NSString *)u_area success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  获得所有的福利类型
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getAllWelfareTagSuccess:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  首页初始化
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_homePageInitSuccess:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  推荐艺人
 *
 *  @param page               页码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getRecommendArtistListWithPage:(NSString *)page Success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  推荐商演
 *
 *  @param page               页码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getRecommendBusinessShowListWithPage:(NSString *)page Success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  最新商演
 *
 *  @param page               页码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getNewestBusinessShowListWithPage:(NSString *)page success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  最新艺人
 *
 *  @param page               页码
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getNewestArtistListWithPage:(NSString *)page Success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  最近艺人
 *
 *  @param page               页码
 *  @param lat                纬度
 *  @param lng                经度
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getClosestArtistListWithPage:(NSString *)page lat:(NSString *)lat lng:(NSString *)lng success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  获得所有的商演服务类型
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getAllBusinessShowTypeSuccess:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  艺人详情
 *
 *  @param id               艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistDetailsWithArtistID:(NSString *)artistID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  艺人套餐列表
 *
 *  @param page               页码
 *  @param uid                艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistSetsListWithPage:(NSString *)page artistID:(NSString *)artistID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  艺人才艺秀列表
 *
 *  @param page               页码
 *  @param uid                艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistTalentShowListWithPage:(NSString *)page artistID:(NSString *)artistID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  艺人评论列表
 *
 *  @param page               页码
 *  @param to_uid             艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistCommentListWithPage:(NSString *)page artistID:(NSString *)artistID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  才艺秀评论列表
 *
 *  @param page               页码
 *  @param sid                才艺秀id
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getTalentShowCommentListWithPage:(NSString *)page sid:(NSString *)sid success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_talentShowCommentWithShowID:(NSString *)showID UserID:(NSString *)userID commentContent:(NSString *)commentContent toCommentUserID:(NSString *)toCommentUserID toCommentContent:(NSString *)toCommentContent toCommentTime:(NSString *)toCommentTime success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  提现记录列表
 *
 *  @param page               页码
 *  @param uid                艺人id
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getWithdrawalRecordListWithPage:(NSString *)page uid:(NSString *)uid success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_withdrawalWithUid:(NSString *)uid apply_money:(NSString *)apply_money password:(NSString *)password pay_type:(NSString *)pay_type success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_bindAlipayWithUserID:(NSString *)userID alipay_account:(NSString *)alipay_account alipay_nickname:(NSString *)alipay_nickname alipay_password:(NSString *)alipay_password success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_bindBankCardWithUserID:(NSString *)userID bank_account:(NSString *)bank_account bank_cardnum:(NSString *)bank_cardnum bank_kaihuhang:(NSString *)bank_kaihuhang bank_password:(NSString *)bank_password success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  我的下线
 *
 *  @param page               页码
 *  @param id                 用户ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMyDownLineListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  收藏的艺人
 *
 *  @param page               页码
 *  @param uid                用户ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMyCollectionArtistListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  收藏的商演
 *
 *  @param page               页码
 *  @param my_userid          用户ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMyCollectionBusinessShowListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  用户全部订单列表
 *
 *  @param page               页码
 *  @param u_id               用户ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getUserAllOrderListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  用户订单列表
 *
 *  @param page               页码
 *  @param u_id               用户ID
 *  @param state              5未付定金 10已付定金 15服务中 20已完成 25已取消
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getUserOrderListWithPage:(NSString *)page userID:(NSString *)userID state:(NSString *)state success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  艺人全部订单列表
 *
 *  @param page               页码
 *  @param u_id               艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistAllOrderListWithPage:(NSString *)page userID:(NSString *)userID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  艺人订单列表
 *
 *  @param page               页码
 *  @param u_id               艺人ID
 *  @param state              5未付定金 10已付定金 15服务中 20已完成 25已取消 30爽约申请 35爽约申请通过 40爽约申请不通过
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getArtistOrderListWithPage:(NSString *)page userID:(NSString *)userID state:(NSString *)state success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  订单详情
 *
 *  @param id               订单ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getOrderDetailWithOrderID:(NSString *)orderID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  消息列表
 *
 *  @param page               页码
 *  @param artist_id          艺人ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMessageListWithPage:(NSString *)page artist_id:(NSString *)artist_id success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  档期列表
 *
 *  @param uid          艺人ID
 *  @param year         年
 *  @param month        月
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getCalendarListWithArtistID:(NSString *)artistID year:(NSString *)year month:(NSString *)month success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  拒绝或接受邀约
 *
 *  @param id          消息ID
 *  @param type        1接受 2拒绝
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_changeInvitationStateWithMessageID:(NSString *)messageID type:(NSString *)type success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  我的派单列表
 *
 *  @param page               页码
 *  @param uid                用户ID
 *  @param type               1待处理 2已过期 3全部
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMySendOrderListWithPage:(NSString *)page uid:(NSString *)uid type:(NSString *)type success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  我的派单报名列表
 *
 *  @param page               页码
 *  @param bshow_id           商演id
 *  @param state              0待处理 1接受 2拒绝 3全部
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_getMySendOrderApplyListWithPage:(NSString *)page bshow_id:(NSString *)bshow_id state:(NSString *)state success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  商演报名
 *
 *  @param artist_id          艺人ID
 *  @param bshow_id           商演id
 *  @param price              期待薪资
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_businessShowApplyWithArtistID:(NSString *)artist_id bshow_id:(NSString *)bshow_id price:(NSString *)price success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

/**
 *  商演详情
 *
 *  @param artist_id          艺人ID
 *  @param id                 商演ID
 *
 *  @return 请求对象
 */
+ (NSURLSessionDataTask *)cx_businessShowDetailWithArtistID:(NSString *)artist_id showID:(NSString *)showID success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_orderArtistWithType:(NSString *)type role_name:(NSString *)role_name price:(NSString *)price work_date:(NSString *)work_date work_area:(NSString *)work_area customer_name:(NSString *)customer_name contact_phone:(NSString *)contact_phone service_address:(NSString *)service_address remarks:(NSString *)remarks setmeal_id:(NSString *)setmeal_id artist_id:(NSString *)artist_id u_id:(NSString *)u_id u_head:(NSString *)u_head u_nickname:(NSString *)u_nickname success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_searchBusinessShowWithPage:(NSString *)page province:(NSString *)province city:(NSString *)city area:(NSString *)area bc_id:(NSString *)bc_id sType:(NSString *)sType success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_searchArtistWithPage:(NSString *)page a_province:(NSString *)a_province a_city:(NSString *)a_city a_area:(NSString *)a_area cid:(NSString *)cid sType:(NSString *)sType sex:(NSString *)sex s_height:(NSString *)s_height e_height:(NSString *)e_height s_weight:(NSString *)s_weight e_weight:(NSString *)e_weight success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_publishTalentShowWithUserID:(NSString *)userID content:(NSString *)content imgs:(NSString *)imgs show_tag:(NSString *)show_tag success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

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
+ (NSURLSessionDataTask *)cx_publishBusinessShowWithUserID:(NSString *)userID subject:(NSString *)subject end_date:(NSString *)end_date work_date:(NSString *)work_date work_timearea:(NSString *)work_timearea contact_name:(NSString *)contact_name contact_phone:(NSString *)contact_phone sex_limit:(NSString *)sex_limit service_type:(NSArray *)service_type cost:(NSString *)cost weal:(NSString *)weal shortinfo:(NSString *)shortinfo imgs:(NSString *)imgs work_address:(NSString *)work_address province:(NSString *)province city:(NSString *)city area:(NSString *)area success:(GetDataSuccess)getDataSuccess failure:(GetDataFailure)getDataFail;

@end
