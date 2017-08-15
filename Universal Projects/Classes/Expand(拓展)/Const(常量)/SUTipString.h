//
//  SUTipString.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/18.
//  Copyright © 2017年 Suger. All rights reserved.
//



#pragma mark - 注册相关的提示
/// 正在注册
extern NSString * const _kSURegistration;
/// 注册信息不能为空
extern NSString * const _kSURegistrationInfoCanNotNull;

#pragma mark - 登录相关的提示
/// 正在登录
extern NSString * const _kSULogining;
/// 登录成功
extern NSString * const _kSULoginSuccess;
/// 登录失败
extern NSString * const _kSULoginFailure;

#pragma mark - 提交相关的提示
/// 提交中
extern NSString * const _kSUSubmission;
/// 提交成功
extern NSString * const _kSUSubmissionSuccess;
/// 提交失败
extern NSString * const _kSUSubmissionFailure;

#pragma mark - 网络相关的提示
/// 数据加载中...
extern NSString * const _kSUDataLoading;
/// 请求超时
extern NSString * const _kSURequestTimeout;
/// 网络异常
extern NSString * const _kSUNetworkAnomaly;
/// 无网络连接
extern NSString * const _kSUNoneNetwork;
/// 网络连接失败
extern NSString * const _kSUNetworkFailure;
/// 请检查网络设置
extern NSString * const _kSUCheckNetwork;
/// 网络连接失败,请稍后重试
extern NSString * const _kSUNetworkFailureLaterOption;
/// 已切换到3G/4G网络
extern NSString * const _kSUNetworkChange3G4G;
/// 已切换到WiFi网络
extern NSString * const _kSUNetworkChangeWiFi;
/// 亲、当前无网络,请连接网络后重试
extern NSString * const _kSUNoneNetworkIsNone;

#pragma mark - 密码相关的提示
/// 密码格式错误
extern NSString * const _kSUPasswordFormatError;
/// 密码不能为空
extern NSString * const _kSUPasswordCanNotNull;
/// 两次密码不一致
extern NSString * const _kSUPasswordNotEqual;
/// 请输入6-16位密码,区分大小写,不能使用空格
extern NSString * const _kSUPasswordFormatTip;
/// 重置密码请求已发送,请检查邮箱,重置密码
extern NSString * const _kSUResetPassword;

#pragma mark - 修改相关的提示
/// 修改成功
extern NSString * const _kSUModifySuccess;
/// 修改失败
extern NSString * const _kSUModifyFailure;

#pragma mark - 邮箱相关的提示
/// 邮箱格式错误
extern NSString * const _kSUEmailFormatError;
/// 邮箱不能为空
extern NSString * const _kSUEmailCanNotNull;
/// 正在绑定
extern NSString * const _kSUBinding;
/// 账号绑定成功
extern NSString * const _kSUBindingSuccess;

#pragma mark - 邮件相关的提示
/// 邮件发送成功
extern NSString * const _kSUEmailSendSuccess;
/// 邮件发送失败
extern NSString * const _kSUEmailSendFailure;

#pragma mark - 采集关注提示
/// 已赞
extern NSString * const _kSUHavePraise;
/// 已采集
extern NSString * const _kSUHaveCollected;
/// 已关注
extern NSString * const _kSUHaveAttention;
/// 已取消关注
extern NSString * const _kSUCancelAttention;

#pragma mark - 消息相关的提示
/// 正在发送...
extern NSString * const _kSUSending;
/// 发送成功
extern NSString * const _kSUSendSuccees;
/// 发送失败
extern NSString * const _kSUSendFailure;

#pragma mark - 文件相关的提示
/// 文件不存在
extern NSString * const _kSUFilesEmpty;
/// 文件创建失败
extern NSString * const _kSUFilesCreateFailure;
/// 文件夹创建失败
extern NSString * const _kSUFolderCreateFailure;

#pragma mark - 删除相关的提示
/// 删除成功
extern NSString * const _kSUDeleteSuccess;
/// 删除失败
extern NSString * const _kSUDeleteFailure;
/// 亲、您还没有选择需要删除的课程
extern NSString * const _kSUNoneSelectDeleteCourse;

#pragma mark - 昵称相关的提示
/// 昵称不能为空
extern NSString * const _kSUNickNameCanNotNull;
/// 昵称为2-18位中英文、数字以及下划线
extern NSString * const _kSUNickNameFormatTip;

/// 真实姓名不能为空
extern NSString * const _kSURealNameCanNotNull;
/// 真实姓名为2-18位中英文、数字以及下划线
extern NSString * const _kSURealNameFormatTip;

/// 真实学号不能为空
extern NSString * const _kSURealStuNuSUanNotNull;

#pragma mark - 下载相关的提示
/// 没有可以下载的视频
extern NSString * const _kSUNoneSureDownloadVideo;
/// 存储空间不足,视频无法下载
extern NSString * const _kSUNotEnoughStorageSpace;

#pragma mark - 头像相关的提示
/// 头像修改失败
extern NSString * const _kSUIconModifyFailure;

#pragma mark - 分享相关的提示
/// 分享成功
extern NSString * const _kSUSharedSuccees;
/// 分享失败
extern NSString * const _kSUSharedFailure;

#pragma mark - 好友相关的提示
/// 申请好友成功，请等待对方同意
extern NSString * const _kSUApplySuccees;
/// 已成功添加为好友
extern NSString * const _kSUAddFriendsSuccess;

#pragma mark - 视频相关的提示
/// 播放本地视频
extern NSString * const _kSUPlayerLocalVideo;
#pragma mark - 字符相关的提示
/// 字符长度超出
extern NSString * const _kSUStringLengthOverflow;
/// 暂不支持Emoji表情
extern NSString * const _kSUStringNotUseEmoji;


#pragma mark - 其他的提示
/// 内容不能为空
extern NSString * const _kSUContentCanNotNull;
/// 截图失败
extern NSString * const _kSUScreenshotFailure;
/// 正在清除缓存
extern NSString * const _kSUCacheCleaning;
/// 清除成功
extern NSString * const _kSUCacheSuccees;
/// 操作失败
extern NSString * const _kSUOptipnsFailure;
/// 请用电脑登录慕课大学网站完成本节
extern NSString * const _kSUPleaseUsingComputerOption;
/// 未开通服务
extern NSString * const _kSUNotOpenService;
/// 购物车无数据
extern NSString * const _kSUNotShoppingCart;
/// 无优惠券
extern NSString * const _kSUCouponsTypeNotUsed;
/// 无已使用优惠券
extern NSString * const _kSUCouponsTypeAlreadyUsed;
/// 无已过期优惠券
extern NSString * const _kSUCouponsTypeExpired;
/// 无法使用优惠券
extern NSString * const _kSUCouponsUserError;
/// 您还没有相关的订单
extern NSString * const _kSUNoneOrder;

/** 库存不足 */
extern NSString * const _kSUInventoryShortage;
/** 数量有误 */
extern NSString * const _kSUInventoryError;
#pragma mark - 售后\退货状态相关
/** 等待审核 */
extern NSString * const _kSUWaitForAudit;
/** 退货中 */
extern NSString * const _kSUReturnOfGoods;
/** 退货完成 */
extern NSString * const _kSUReturnCompletion;
/** 打款中 */
extern NSString * const _kSUInThePlay;
/** 退款完成 */
extern NSString * const _kSURefundCompleted;
