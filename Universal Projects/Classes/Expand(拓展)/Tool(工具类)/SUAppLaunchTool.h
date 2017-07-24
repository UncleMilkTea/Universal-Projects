//
//  SUAppLaunchTool.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SUAppLaunchTool : NSObject
/// 启动设置
+ (void)appLaunchSetting;

/// 注册 APNs 推送
- (void)registerForRemoteNotificationsWithOptions:launchOptions;
/// 推送提示的移除
+ (void)isRemoteNotificationsLaunchingWithOptions:(NSDictionary *)launchOptions;

/// 清楚用户本地的数据缓存(非图片)
+ (void)cleanLocalData;
//! 点击通知
+ (void)clickNotificationUserInfo:(NSDictionary *)userInfo;

/// 注册微信支付的
//+ (void)registerWechatPay;

/// 请求闪屏倒计时广告数据
+ (void)requestActivityAdvert;

/// 显示闪屏广告
+ (void)showActivityAdvert;

@end
