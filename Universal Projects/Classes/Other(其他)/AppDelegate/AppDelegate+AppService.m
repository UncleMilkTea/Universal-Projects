//
//  AppDelegate+AppService.m
//  Universal Projects
//
//  Created by zhangsh on 2017/7/25.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import "SUTabBarController.h"
#import "SUNewfeatureController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "SUNavigationController.h"


@implementation AppDelegate (AppService)

sharedInstanceM

- (void)initWindow
{
    // 1.创建并显示窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = APP_SCREEN_BOUNDS;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[UIButton appearance] setExclusiveTouch:YES];
    //    [[UIButton appearance] setShowsTouchWhenHighlighted:YES];
    
    // 2.设置根控制器
    [self switchRootViewController];
}
- (void)switchRootViewController
{
    if ([self compareVersion]) {
        self.mainTabBar = [[SUTabBarController alloc] init];
        self.window.rootViewController = self.mainTabBar;
    } else {
        self.window.rootViewController = [[SUNewfeatureController alloc] init];
    }
    
}

/**
 *  版本号比较
 */
- (BOOL)compareVersion
{
    // 用户可见的版本号
    NSString *lastVersion = kUserDefaultGet(VersionString);
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[VersionString];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        // 版本号相同：这次打开和上次打开的是同一个版本
        return YES;
    } else {
        // 将当前的版本号存进沙盒
        kUserDefaultSave(currentVersion, VersionString);
        return NO;
    }
   
}

-(void)initService{
    //注册登录状态监听
    kObserverNotification(self, loginStateChange:, SUNotificationLoginStateChange);
    
//    网络状态监听
    [GLobalRealReachability startNotifier];
    kObserverNotification(self, netWorkStateChange:, kRealReachabilityChangedNotification);
}
- (void)loginStateChange:(NSNotification *)notification
{
    BOOL loginSuccess = [notification.object boolValue];
    
    if (loginSuccess) {//登陆成功加载主窗口控制器
    
        //为避免自动登录成功刷新tabbar
        if (!self.mainTabBar || ![self.window.rootViewController isKindOfClass:[SUTabBarController class]]) {
            self.mainTabBar = [SUTabBarController new];
            
            CATransition *anima = [CATransition animation];
            anima.type = @"cube";//设置动画的类型
            anima.subtype = kCATransitionFromRight; //设置动画的方向
            anima.duration = 0.3f;
            
            self.window.rootViewController = self.mainTabBar;
            
            [kAppWindow.layer addAnimation:anima forKey:@"revealAnimation"];
            
        }
        
    }else {//登陆失败加载登陆页面控制器
//
        self.mainTabBar = nil;
        SUNavigationController *loginNavi =[[SUNavigationController alloc] initWithRootViewController:[UIViewController new]];
        
        CATransition *anima = [CATransition animation];
        anima.type = @"fade";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 0.3f;
        
        self.window.rootViewController = loginNavi;
        
        [kAppWindow.layer addAnimation:anima forKey:@"revealAnimation"];
        
    }

}
#pragma mark ————— 网络状态变化 —————
- (void)netWorkStateChange:(NSNotification *)notification
{
    
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    
    if (status == RealStatusNotReachable) {
        [SVProgressHUD showTopTipStatus:_kSUNetworkFailure isWindow:YES];
    }
    if (status == RealStatusViaWiFi) {
        [SVProgressHUD showTipStatus:_kSUNetworkChangeWiFi];
    }
    if (status == RealStatusViaWWAN) {
         [SVProgressHUD showTipStatus:_kSUNetworkChange3G4G];
       
    }
    
   //有网络
        if (1) {//有用户数据 并且 未登录成功 重新来一次自动登录
//            [userManager autoLoginToServer:^(BOOL success, NSString *des) {
                if (/* DISABLES CODE */ (1)) {
                    SULog(@"网络改变后，自动登录成功");
                    [SVProgressHUD showSuccessWithStatus :_kSULoginSuccess];
                    kPostNotification(SUNotificationAutoLoginSuccess, nil);
                }else{
                    [SVProgressHUD showInfoWithStatus:_kSULoginFailure];
                }
//            }];
        
    
    }else {//登陆失败加载登陆页面控制器
    }
}

/**
 * 友盟初始化
 */
-(void)initUMeng{
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMeng_AppKey];
    
    [self configUSharePlatforms];
}
-(void)configUSharePlatforms{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:Wechat_AppID appSecret:Wechat_App_Secret redirectURL:nil];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:Tencent_AppID/*设置QQ平台的appID*/  appSecret:Tencent_AppKey redirectURL:nil];
}
// 回调 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


-(UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}


@end
