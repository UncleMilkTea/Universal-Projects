//
//  AppDelegate+AppService.h
//  Universal Projects
//
//  Created by zhangsh on 2017/7/25.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)
//! 初始化服务
-(void)initService;

//! 初始化 window
-(void)initWindow;

//! 初始化 UMeng
-(void)initUMeng;

//! 初始化用户系统
-(void)initUserManager;

//! 监听网络状态
- (void)monitorNetworkStatus;


//! 单例
sharedInstanceH

/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;
@end
