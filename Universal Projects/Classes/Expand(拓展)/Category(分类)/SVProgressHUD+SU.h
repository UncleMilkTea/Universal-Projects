//
//  SVProgressHUD+SU.h
//  Universal Projects
//
//  Created by zhangsh on 2017/8/3.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
/**
 MBProgressHUD 的二次封装
 */
@interface SVProgressHUD (SU)

//顶部弹出提示
+ (void)showTopTipStatus:(NSString *)status;
+ (void)showTopTipStatus:(NSString *)status isWindow:(BOOL) isWindow;
+ (void)showTipStatus:(NSString *)status;

@end
