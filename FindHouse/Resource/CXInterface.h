//
//  CXInterface.h
//  Bolema
//
//  Created by chengxikeji on 16/6/17.
//  Copyright © 2016年 cx. All rights reserved.
//

#ifndef CXInterface_h
#define CXInterface_h

/**
 *  格式
 *  
 *  CX_接口标示_Url @"接口地址"
 *
 */

/**Code*/

#define CX_RequestCode_200 200

#define CX_RequestCode_400 400

/**接口前缀*/
#define CX_Base_Url @"http://blm.ichengxi.cn/V1/"

/**上传图片*/
#define CX_UploadImage_Url @"Upload/index"

/**登录*/
#define CX_Login_Url @"User/login"

/**注册*/
#define CX_Register_Url @"User/register"

/**获取手机验证码*/
#define CX_PhoneVerifyCode_Url @"User/getCheckCode"

/**重置密码*/
#define CX_ResetPassword_Url @"user/editPass"

/**意见反馈*/
#define CX_FeedBack_Url @"user/feedback"

/**成为艺人*/
#define CX_BecomeArtist_Url @"artist/become"

/**获得所有的艺人角色*/
#define CX_GetAllArtistRole_Url @"other/getArtistCate"

/**获取用户信息*/
#define CX_GetUserInfo_Url @"User/getUserInfo"

/**修改用户信息*/
#define CX_ModifyUserInfo_Url @"user/editUserInfo"

/**修改艺人角色*/
#define CX_ModifyArtistRole_Url @"artist/editArtistRole"

/**获得所有的福利类型*/
#define CX_GetAllWelfareTag_Url @"other/getWealCate"

/**首页初始化接口*/
#define CX_HomeInit_Url @"Index/index"

/**推荐艺人*/
#define CX_RecommendArtist_Url @"index/tjArtist"

/**推荐商演*/
#define CX_RecommendBusinessShow_Url @"index/tjBshow"

/**最新商演*/
#define CX_NewestBusinessShow_Url @"artist/businessShow_new"

/**最新艺人*/
#define CX_NewestArtist_Url @"artist/artist_new"

/**最近艺人*/
#define CX_ClosestArtist_Url @"artist/artist_location"

/**所有的商演服务类型*/
#define CX_AllBusinessShowType_Url @"other/getServiceCate"

/**艺人详情*/
#define CX_ArtistDetails_Url @"artist/detail"

/**艺人套餐*/
#define CX_ArtistSets_Url @"artist/setMealList"

/**艺人才艺秀列表*/
#define CX_ArtistTalentShowList_Url @"artist/mySkillshowList"

/**艺人评价列表*/
#define CX_ArtistCommentList_Url @"artist/evaluateList"

/**才艺秀评论列表*/
#define CX_TalentShowCommentList_Url @"artist/skillShowComment"

/**才艺秀评论*/
#define CX_TalentShowComment_Url @"artist/comment"

/**提现记录*/
#define CX_WithdrawalRecord_Url @"artist/applyMoneyRecord"

/**提现*/
#define CX_Withdrawal_Url @"artist/applyMoney"

/**绑定支付宝*/
#define CX_BindAlipay_Url @"artist/bindAlipay"

/**绑定银行卡*/
#define CX_BindBankCard_Url @"artist/bindBank"

/**我的下线*/
#define CX_MyDownLine_Url @"artist/invitee"

/**收藏的艺人*/
#define CX_CollectionArtist_Url @"user/collectArtist"

/**收藏的商演*/
#define CX_CollectionBusinessShow_Url @"user/collectShow"

/**用户全部订单列表*/
#define CX_UserAllOrderList_Url @"order/user_lists"

/**用户订单列表*/
#define CX_UserOrderList_Url @"order/user_listsByState"

/**艺人全部订单列表*/
#define CX_ArtistAllOrderList_Url @"order/artist_lists"

/**艺人订单列表*/
#define CX_ArtistOrderList_Url @"order/artist_listsByState"

/**订单详情*/
#define CX_OrderDetail_Url @"order/orderDetail"

/**消息列表*/
#define CX_MessageList_Url @"artist/msgList"

/**接受拒绝邀约*/
#define CX_ChangeInvitationState_Url @"artist/operate"

/**档期列表*/
#define CX_CalendarList_Url @"artist/orderTime"

/**我的派单*/
#define CX_MySendOrderList_Url @"order/myBShow"

/**我的派单*/
#define CX_MySendOrderApplyList_Url @"order/bshow_applylist"

/**商演报名*/
#define CX_BusinessShowApply_Url @"artist/apply_bshow"

/**商演详情*/
#define CX_BusinessShowDetail_Url @"artist/bshow_detail"

/**预约艺人*/
#define CX_OrderArtist_Url @"artist/invitation"

/**搜索商演*/
#define CX_SearchBusinessShow_Url @"artist/search_bshow"

/**搜索艺人*/
#define CX_SearchArtist_Url @"artist/search"

/**发布才艺秀*/
#define CX_PublishTalentShow_Url @"artist/show"

/**发布商演*/
#define CX_PublishBusinessShow_Url @"artist/businessShow"

#endif /* CXInterface_h */
