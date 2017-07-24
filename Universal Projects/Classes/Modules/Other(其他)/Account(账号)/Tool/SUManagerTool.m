//
//  SUManagerTool.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUManagerTool.h"

@implementation SUManagerTool

sharedInstanceM

//- (NSString *)uuid {
//    return [FCUUID uuidForDevice];
//}

- (NSString *)deviceToken{
    NSString *deviceToken = [SUUserDefaults objectForKey:SUDeviceToken];
    return deviceToken ? deviceToken : @"";
}

- (BOOL)isLogined {
    NSNumber *isLogined = [SUUserDefaults valueForKey:SULoginStatus];
    BOOL isLogin = [isLogined boolValue];
    return isLogin;
}
- (BOOL)isRegisterRemoteNotification {
    NSNumber *remoteNotificationState = [SUUserDefaults valueForKey:SURemoteNotificationState];
    BOOL isRegisterRemoteNotification = [remoteNotificationState boolValue];
    return isRegisterRemoteNotification;
}
- (void)setIsRegisterRemoteNotification:(BOOL)isRegisterRemoteNotification{
    [SUUserDefaults setValue:@(isRegisterRemoteNotification) forKey:SURemoteNotificationState];
}
- (void)setDeviceToken:(NSString *)deviceToken{
    [SUUserDefaults setValue:deviceToken forKey:SUDeviceToken];
}
- (void)setUserModel:(SUAccount *)userModel {
    BOOL isLogined = userModel ? YES : NO;
    [SUUserDefaults setValue:[NSNumber numberWithBool:isLogined] forKey:SULoginStatus];
    [SUUserDefaults synchronize];
    [SUAccountTool saveAccount:userModel];
//    [[NSNotificationCenter defaultCenter] postNotificationName:SULoginStatus object:nil];
}

- (SUAccount *)userModel {
    return [SUAccountTool account];
}

@end
