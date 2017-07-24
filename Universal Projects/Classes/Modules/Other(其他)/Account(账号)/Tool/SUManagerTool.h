//
//  SUManagerTool.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUAccountTool.h"

@interface SUManagerTool : NSObject

sharedInstanceH
/// 当前的登录状态
@property (nonatomic, assign, readonly) BOOL isLogined;
/// 当前设备的 UUID
//@property (nonatomic, copy, readonly) NSString *uuid;
/// 用户的账号模型
@property (nonatomic, strong) SUAccount *userModel;

/// 当前用户的 设备 deviceToken
@property (nonatomic, copy) NSString *deviceToken;

/// 当前远程推送状态
@property (nonatomic, assign) BOOL isRegisterRemoteNotification;

// 闪屏广告模型
//@property (nonatomic, strong) CSAdvertModel *activityAdvertModel;


@end
