//
//  SUDefine.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/14.
//  Copyright © 2017年 Suger. All rights reserved.
//

#ifndef SUDefine_h
#define SUDefine_h

#pragma mark - 打印参数
// DEBUG 模式下输出 Log 信息 RELEASE 模式不输出 等价于 NSLog(...)
/*****************************************************
 ***************      日志输出宏定义     ****************
*****************************************************/
#ifdef DEBUG
//#define LSLog(...) NSLog(__VA_ARGS__)
#define SULog(fmt,...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__);
#else
#define SULog(...)
#endif

#pragma mark - 硬件参数
// 系统版本
#define iOS7  ([[[[UIDevice currentDevice]systemVersion]substringToIndex:1] doubleValue]>=7)
#define iOS8  ([[[[UIDevice currentDevice]systemVersion]substringToIndex:1] doubleValue]>=8)
#define iOS9  ([[[[UIDevice currentDevice]systemVersion]substringToIndex:1] doubleValue]>=9)
#define iOS10 (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max)?(YES):(NO)

// 设备型号
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(640,960),[[UIScreen mainScreen] currentMode].size):NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(640,1136),[[UIScreen mainScreen] currentMode].size):NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(750,1334),[[UIScreen mainScreen] currentMode].size):NO)

#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

#define SUSCALEHEIGHT(H) (iPhone6Plus ? (H*1.12) : (iPhone6 ? (H*1.05) : (H*0.90)))


// 屏幕尺寸
#define APP_STATUS_FRAME    [UIApplication sharedApplication].statusBarFrame
#define APP_SCREEN_BOUNDS   [UIScreen mainScreen].bounds
#define APP_SCREEN_WIDTH    (APP_SCREEN_BOUNDS.size.width)
#define APP_SCREEN_HEIGHT   (APP_SCREEN_BOUNDS.size.height)

//****************************** 屏幕尺寸比例适配 ******************************\\
/** 加粗字体适配字号 */
#define SUAUTOBOLDFONT(S/*字号*/) \
[UIFont boldSystemFontOfSize:S]
// [UIFont boldSystemFontOfSize:S/375.0*[UIScreen mainScreen].bounds.size.width]
/** 普通字号适配 */
#define SUAUTOFONT(S/*字号*/) \
[UIFont systemFontOfSize:S]
//[UIFont systemFontOfSize:S/375.0*[UIScreen mainScreen].bounds.size.width]

/** 宽度适配 */
#define SUAUTOWIDTH(W/*宽度*/) (W/375.0*APP_SCREEN_WIDTH)
/** 高度适配 */
#define SUAUTOHEIGHT(H/*长度*/) (H/667.0*APP_SCREEN_HEIGHT)

#pragma mark - 颜色参数
/**
 *  RGB 三个参数数值不相同
 *
 *  @param r 红色值
 *  @param g 绿色值
 *  @param b 蓝色值
 *
 *  @return 返回一个 UIColor 对象
 */
#define UIColorFromRGB(r,g,b) \
[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
/**
 *  RGB 三个参数数值不相同 加 透明度
 *
 *  @param r 红色值
 *  @param g 绿色值
 *  @param b 蓝色值
 *  @param a 透明度
 *
 *  @return 返回一个可控制透明度的 UIColor 对象
 */
#define UIColorFromRGBA(r,g,b,a) \
[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/**
 *  RGB 三个参数数值相同
 *
 *  @param r RGB 数值
 *
 *  @return 返回一个 RGB 相同 UIColor 对象
 */
#define UIColorFromSameRGB(r) \
[UIColor colorWithRed:(r)/255.0f green:(r)/255.0f blue:(r)/255.0f alpha:1]
/**
 *  RGB 三个参数数值相同 加 透明度
 *
 *  @param r RGB 数值
 *  @param a 透明度
 *
 *  @return 返回一个 RGB 相同并且可控制透明度的 UIColor 对象
 */
#define UIColorFromSameRGBA(r,a) \
[UIColor colorWithRed:(r)/255.0f green:(r)/255.0f blue:(r)/255.0f alpha:(a)]
/**
 *  16进制色值
 *
 *  @param hexValue 16进制值
 *
 *  @return 返回一个进制转换后的 UIColor 对象
 */
#define UIColorFromHEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

/**
 *  16进制带透明度色值
 *
 *  @param hexValue 16进制
 *  @param alp      透明度
 *
 *  @return 返回一个进制转换后的 UIColor 对象
 */
#define UIColorFromHEXandAlpha(hexValue, alp) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alp]

#pragma mark - 单例模式
//!单例
#define sharedInstanceH + (instancetype)sharedInstance;

// .m文件
#if __has_feature(objc_arc)

#define sharedInstanceM \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
}

#else

#define sharedInstanceM \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
} \
\
- (oneway void)release { } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return 1;} \
- (id)autorelease { return self;}

#endif

#define SUUserDefaults [NSUserDefaults standardUserDefaults]

/** weakSelf */
#define WEAKSELF  __weak __typeof (self) weakSelf = self;

/**
 *  内部跳转其他页面 pushViewController
 *
 *  @param vc 跳转的目标控制器
 *
 *  @return return value description
 */
#define PushViewController(vc) UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;\
vc.hidesBottomBarWhenPushed = YES;\
[(UINavigationController *)tabBarController.selectedViewController pushViewController:vc animated:YES];\

/**
 *  返回上一级控制器 popViewControllerAnimated
 *  @param animation 是否需要动画
 */
#define PopViewControllerAnimated(animation) \
dispatch_async(dispatch_get_main_queue(), ^{ \
UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController; \
UINavigationController *nav = tabBarController.selectedViewController; \
[nav popViewControllerAnimated:animation]; \
}); \

/**
 *  返回指定的控制器 popViewController
 *
 *  @param 要返回的控制器的类
 *
 *  @return return value description
 */
#define PopViewControllerClass(destinationVC) \
for (UIViewController *controller in self.navigationController.viewControllers) {\
if ([controller isKindOfClass:destinationVC]) {\
[self.navigationController popToViewController:controller animated:YES];\
}\
}

/**
 *  返回根控制器 popRootViewController
 *
 *  @param 要返回的控制器的类
 *
 *  @return return value description
 */
#define PopToRootViewControllerClass \
UITabBarController *tabBar = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;\
[(UINavigationController *)tabBar.selectedViewController popToRootViewControllerAnimated:NO];\

/**
 *  弹出控制器页面 presentViewController
 *
 *  @param vc 弹出的目标控制器
 *
 *  @return return value description
 */
#define PresentViewController(vc) UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;\
vc.hidesBottomBarWhenPushed = YES;\
[(UINavigationController *)tabBarController.selectedViewController  presentViewController:vc animated:YES completion:nil];\

//简单的以AlertView显示提示信息
#define SUAlertView(title, msg, buttonTitle) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil \
cancelButtonTitle:buttonTitle \
otherButtonTitles:nil]; \
[alert show];

#endif /* SUDefine_h */
