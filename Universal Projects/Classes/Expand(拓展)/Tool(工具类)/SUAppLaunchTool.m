//
//  SUAppLaunchTool.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUAppLaunchTool.h"

@implementation SUAppLaunchTool

#pragma mark - 获取配置

+ (void)appLaunchSetting {

    //闪屏广告
//    [SUAppLaunchTool requestActivityAdvert];

    [[CSNetworkMonitoring sharedInstance] startMonitoring];

    [[CSNetworking sharedInstance] setTimeoutInterval:[SUConfigurationManager sharedInstance].requestTimeout];

    SUAccount *userModel = [SUManagerTool sharedInstance].userModel;

    [[CSNetworking sharedInstance] setHeaderValue:userModel.token forKey:SUUserToken];
    

//    [[FMDBManager sharedInstance] openDataBaseName:@"database.sqlite"];
}


/// 注册微信支付的
//+ (void)registerWechatPay {
//    BOOL iSsuccess = [WXApi registerApp:Wechat_AppID];
//    if (iSsuccess == NO) {
//        SULog(@"注册微信支付失败...");
//    }else {
//        SULog(@"注册微信支付成功");
//    }
//}

#pragma mark 请求闪屏广告
+ (void)requestActivityAdvert {
}
+ (void)showActivityAdvert {

    BOOL first = [SUUserDefaults boolForKey:@"firstInstall"];
    if (first == NO) { //  == NO 是第一次安装
        [SUUserDefaults setBool:YES forKey:@"firstInstall"];
        [SUUserDefaults synchronize];
    }else {
//        UIWindow *window = [UIApplication sharedApplication].keyWindow;
//        CSAdvertView *view = [[CSAdvertView alloc] init];
//        [window addSubview:view];
//        [window bringSubviewToFront:view];
//        //        Narrow,
//        //        Amplification,
//        //        Crosscutting,
//        //        Gradient,
//        view.disappearType = Amplification;
//        [view loadAdvert];
    }
}
#pragma mark - 友盟推送
- (void)registerForRemoteNotificationsWithOptions:launchOptions {

//    //设置 AppKey 及 LaunchOptions
//    [UMessage startWithAppkey:UMeng_AppKey launchOptions:launchOptions];
//    //注册通知
//    [UMessage registerForRemoteNotifications];
//    //iOS10必须加下面这段代码。
//    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//    center.delegate = self;
//    UNAuthorizationOptions types10=UNAuthorizationOptionBadge|UNAuthorizationOptionAlert|UNAuthorizationOptionSound;
//    [center requestAuthorizationWithOptions:types10 completionHandler:^(BOOL granted, NSError * _Nullable error) {
//        if (granted) {
//            //点击允许
//
//        } else {
//            //点击不允许
//
//        }
//    }];
//
//    [UMessage setLogEnabled:YES];
}

+ (void)isRemoteNotificationsLaunchingWithOptions:(NSDictionary *)launchOptions {

//    NSDictionary* userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
//    if(userInfo && !iOS10){//推送信息
//        SULog(@"程序未启动时的远程推送----------------------%@",userInfo);
//        [[SUAppLaunchTool sharedInstance] jumpToUserInfo:userInfo];
//    }

}
//iOS10新增：处理后台点击通知的代理方法
//-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
//    NSDictionary * userInfo = response.notification.request.content.userInfo;
//    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        //应用处于后台时的远程推送接受
//        SULog(@"iOS10后台时的远程推----------------------%@",userInfo);
//        [[SUAppLaunchTool sharedInstance] jumpToUserInfo:userInfo];
//    }else{
//        //应用处于后台时的本地推送接受
//    }
//}

//iOS10新增：处理前台收到通知的代理方法
//-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
//    NSDictionary * userInfo = notification.request.content.userInfo;
//    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        //应用处于前台时的远程推送接受
//        SULog(@"iOS10前台时的远程推送----------------------%@",userInfo);
//        //关闭友盟自带的弹出框
//        [UMessage setAutoAlert:NO];
//        //必须加这句代码
//        [UMessage didReceiveRemoteNotification:userInfo];
//
//    }else{
//        //应用处于前台时的本地推送接受
//    }
//    //当应用处于前台时提示设置，需要哪个可以设置哪一个
//    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
//}

+ (void)clickNotificationUserInfo:(NSDictionary *)userInfo{

    SULog(@"程序启动时的远程推送----------------------%@",userInfo);

//    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive){
//
//        [[CSAppLaunchTools sharedInstance] alertVcUserInfo:userInfo];
//    }else{
//
//        [[CSAppLaunchTools sharedInstance] jumpToUserInfo:userInfo];
//    }
}

- (void)alertVcUserInfo:(NSDictionary *)userInfo{

//    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:userInfo[@"aps"][@"alert"] preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"残忍拒绝" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        SULog(@"点击了取消按钮");
//    }];
//    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"去看看" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        [[SUAppLaunchTool sharedInstance] jumpToUserInfo:userInfo];
//    }];
//    [alertVc addAction:cancle];
//    [alertVc addAction:confirm];
//    PresentViewController(alertVc)
}


- (void)jumpToUserInfo:(NSDictionary *)userInfo{

//    [UMessage setAutoAlert:NO];
//    [UMessage didReceiveRemoteNotification:userInfo];

}
#pragma mark - 友盟分享
+ (void)setupUMeng {
    // 打开调试日志
//
//#ifdef DEBUG
//    [[UMSocialManager defaultManager] openLog:YES];
//#endif
//
//    // 设置友盟 appkey
//    [[UMSocialManager defaultManager] setUmSocialAppkey:UMeng_AppKey];
//
//    // 获取友盟social版本号
//    SULog(@"UMeng social version:%@", [UMSocialGlobal umSocialSDKVersion]);
//
//    // 设置微信的 appKey 和 appSecret
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:Wechat_AppID appSecret:Wechat_App_Secret redirectURL:@"http://mobile.umeng.com/social"];
//
//    // 设置分享到QQ互联的appId和appKey
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:Tencent_AppID  appSecret:Tencent_AppKey redirectURL:@"http://mobile.umeng.com/social"];
//
//    // 设置新浪的 appId 和 appKey
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:Sina_AppKey appSecret:Sina_App_Secret redirectURL:@"http://sns.whalecloud.com/sina2/callback"];
//
//    // 如果不想显示平台下的某些类型，可用以下接口设置
//    //    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
}

#pragma mark - 清空数据
+ (void)cleanLocalData {

    //清理图片缓存
//    [[SDWebImageManager sharedManager].imageCache clearDisk];
    //清理用户信息
    [SUManagerTool sharedInstance].userModel = nil;

}


@end
