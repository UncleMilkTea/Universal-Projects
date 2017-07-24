//
//  AppDelegate.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/14.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "AppDelegate.h"
#import "SUNewfeatureController.h"
#import "SUTabBarController.h"
#import "SUAppLaunchTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [SUAppLaunchTool appLaunchSetting];

    // 1.创建并显示窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = APP_SCREEN_BOUNDS;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    // 2.设置根控制器
    [self switchRootViewController];
    return YES;
}

- (void)switchRootViewController
{


    // 上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:VersionString];
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[VersionString];

    if ([currentVersion isEqualToString:lastVersion]) {
        // 版本号相同：这次打开和上次打开的是同一个版本
        self.window.rootViewController = [[SUTabBarController alloc] init];
//        if ([CSManager sharedInstance].activityAdvertModel) {
//            // 如果有闪屏广告，则展示闪屏广告
////            [CSAppLaunchTools showActivityAdvert];
//        }
    } else {
        // 这次打开的版本和上一次不一样，显示新特性
        self.window.rootViewController = [[SUNewfeatureController alloc] init];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 将当前的版本号存进沙盒
            [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:VersionString];
            [[NSUserDefaults standardUserDefaults] synchronize];
        });
    }

    NSString *biuldLastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:BiuldKey];
    NSString *biuldCurrentVersion = [NSBundle mainBundle].infoDictionary[BiuldKey];
    if (![biuldCurrentVersion isEqualToString:biuldLastVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:biuldCurrentVersion forKey:BiuldKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }


}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
