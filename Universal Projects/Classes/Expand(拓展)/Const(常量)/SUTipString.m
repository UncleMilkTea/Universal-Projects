//
//  SUTipString.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/18.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUTipString.h"


#pragma mark - 注册相关的提示
NSString * const _kSURegistration                     =       @"正在注册";
NSString * const _kSURegistrationInfoCanNotNull       =       @"注册信息不能为空";

#pragma mark - 登录相关的提示
NSString * const _kSULogining                         =       @"正在登录";
NSString * const _kSULoginSuccess                     =       @"登录成功";
NSString * const _kSULoginFailure                     =       @"登录失败";

#pragma mark - 提交相关的提示
NSString * const _kSUSubmission                       =       @"提交中";
NSString * const _kSUSubmissionSuccess                =       @"提交成功";
NSString * const _kSUSubmissionFailure                =       @"提交失败";

#pragma mark - 网络相关的提示
NSString * const _kSUDataLoading                      =       @"数据加载中";
NSString * const _kSURequestTimeout                   =       @"请求超时";
NSString * const _kSUNetworkAnomaly                   =       @"网络异常";
NSString * const _kSUNoneNetwork                      =       @"当前网络不可用,请稍后重试~"; // @"无网络连接";
NSString * const _kSUNetworkFailure                   =       @"网络连接失败";
NSString * const _kSUNetworkFailureLaterOption        =       @"网络连接失败,请稍后重试";
NSString * const _kSUCheckNetwork                     =       @"请检查网络设置";
NSString * const _kSUNetworkChange3G4G                  =       @"已切换到3G/4G网络";
NSString * const _kSUNetworkChangeWiFi                =       @"已切换到WiFi网络";
NSString * const _kSUNoneNetworkIsNone                =       @"亲、当前无网络,请连接网络后重试";

#pragma mark - 密码相关的提示
NSString * const _kSUPasswordFormatError              =       @"密码格式错误";
NSString * const _kSUPasswordCanNotNull               =       @"密码不能为空";
NSString * const _kSUPasswordNotEqual                 =       @"两次密码不一致";
NSString * const _kSUPasswordFormatTip                =       @"请输入6-16位密码,区分大小写,不能使用空格";
NSString * const _kSUResetPassword                    =       @"重置密码请求已发送,请检查邮箱,重置密码";

#pragma mark - 修改相关的提示
NSString * const _kSUModifySuccess                    =       @"修改成功";
NSString * const _kSUModifyFailure                    =       @"修改失败";

#pragma mark - 邮箱相关的提示
//NSString * const _kSUEmailFormatError                 =       @"邮箱格式错误";
//NSString * const _kSUEmailCanNotNull                  =       @"邮箱不能为空";
NSString * const _kSUBinding                          =       @"正在绑定";
NSString * const _kSUBindingSuccess                   =       @"账号绑定成功";

#pragma mark - 邮件相关的提示
//NSString * const _kSUEmailSendSuccess                 =       @"邮件发送成功";
//NSString * const _kSUEmailSendFailure                 =       @"邮件发送失败";

#pragma mark - 采集关注提示
//NSString * const _kSUHavePraise                       =       @"已赞";
//NSString * const _kSUHaveCollected                    =       @"已采集";
//NSString * const _kSUHaveAttention                    =       @"已关注";
//NSString * const _kSUCancelAttention                  =       @"已取消关注";

#pragma mark - 消息相关的提示
//NSString * const _kSUSending                          =       @"正在发送...";
//NSString * const _kSUSendSuccees                      =       @"发送成功";
//NSString * const _kSUSendFailure                      =       @"发送失败";

#pragma mark - 文件相关的提示
//NSString * const _kSUFilesEmpty                       =       @"文件不存在";
//NSString * const _kSUFilesCreateFailure               =       @"文件创建失败";
//NSString * const _kSUFolderCreateFailure              =       @"文件夹创建失败";

#pragma mark - 删除相关的提示
NSString * const _kSUDeleteSuccess                    =       @"删除成功";
NSString * const _kSUDeleteFailure                    =       @"删除失败";
//NSString * const _kSUNoneSelectDeleteCourse           =       @"亲、您还没有选择需要删除的课程";

#pragma mark - 昵称相关的提示
//NSString * const _kSUNickNameCanNotNull               =       @"昵称不能为空";
//NSString * const _kSUNickNameFormatTip                =       @"昵称为2-18位中英文、数字以及下划线";
//
//NSString * const _kSURealNameCanNotNull               =       @"真实姓名不能为空";
//NSString * const _kSURealNameFormatTip                =       @"真实姓名为2-18位中英文、数字以及下划线";
//
//NSString * const _kSURealStuNuSUanNotNull             =       @"真实学号不能为空";

#pragma mark - 下载相关的提示
//NSString * const _kSUNoneSureDownloadVideo            =       @"没有可以下载的视频";
//NSString * const _kSUNotEnoughStorageSpace            =       @"存储空间不足,视频无法下载";

#pragma mark - 头像相关的提示
NSString * const _kSUIconModifyFailure                =       @"头像修改失败";

#pragma mark - 分享相关的提示
NSString * const _kSUSharedSuccees                    =       @"分享成功";
NSString * const _kSUSharedFailure                    =       @"分享失败";

#pragma mark - 好友相关的提示
//NSString * const _kSUApplySuccees                     =       @"申请好友成功，请等待对方同意";
//NSString * const _kSUAddFriendsSuccess                =       @"已成功添加为好友";

#pragma mark - 视频相关的提示
//NSString * const _kSUPlayerLocalVideo                 =       @"播放本地视频";

#pragma mark - 字符相关的提示
NSString * const _kSUStringLengthOverflow             =       @"字符长度超出";
NSString * const _kSUStringNotUseEmoji                =       @"暂不支持表情";
#pragma mark - 其他的提示
NSString * const _kSUContentCanNotNull                =       @"内容不能为空";
NSString * const _kSUScreenshotFailure                =       @"截图失败";
NSString * const _kSUCacheCleaning                    =       @"正在清除缓存";
NSString * const _kSUCacheSuccees                     =       @"清除成功";
NSString * const _kSUOptipnsFailure                   =       @"操作失败";
NSString * const _kSUPleaseUsingComputerOption        =       @"请用电脑登录慕课大学网站完成本节";

NSString * const _kSUNotOpenService                   =       @"抱歉,当前地址尚未开通服务,敬请期待哦~";

NSString * const _kSUNotShoppingCart                  =       @"亲，购物车空空的耶，赶紧去挑好吃的吧~";

NSString * const _kSUCouponsTypeNotUsed               =       @"您还没有优惠券哦~";
NSString * const _kSUCouponsTypeAlreadyUsed           =       @"您还没有已使用的优惠券哦~";
NSString * const _kSUCouponsTypeExpired               =       @"您还没有已过期的优惠券哦~";
NSString * const _kSUCouponsUserError                 =       @"无法使用该优惠券";
NSString * const _kSUNoneOrder                        =       @"您还没有相关的订单";

#pragma mark - 售后\退货状态相关
/** 等待审核 */
NSString * const _kSUWaitForAudit = @"等待审核";
/** 退货中 */
NSString * const _kSUReturnOfGoods = @"退货中";
/** 退货完成 */
NSString * const _kSUReturnCompletion = @"退货完成";
/** 打款中 */
NSString * const _kSUInThePlay = @"打款中";
/** 退款完成 */
NSString * const _kSURefundCompleted = @"退款完成";

/** 库存不足 */
NSString * const _kSUInventoryShortage = @"该商品库存不足了，只能买这么多了~";
/** 数量有误 */
NSString * const _kSUInventoryError = @"您输入的数量有误~";
