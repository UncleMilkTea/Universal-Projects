//
//  SUNavigationController.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/14.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUNavigationController.h"

@interface SUNavigationController ()

@end

@implementation SUNavigationController


+ (void)initialize {
    //    NSLog(@"%s",__func__);
    // 设置导航条的内容
    // 获取当前应用下所有的导航条     [UINavigationBar appearance]

    // 获取哪个类下面的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];

    [bar setBackgroundImage:[UIImage imageNamed:@"navigation_bar"] forBarMetrics:UIBarMetricsDefault];

    // 通过setTintColor设置导航条文字的颜色
    // [bar setTintColor:[UIColor whiteColor]];
    // bar.barTintColor = [UIColor whiteColor];
    // bar.tintColor = [UIColor whiteColor];

    // 设置导航条标题颜色
    //    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    //    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //    titleAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    //    [bar setTitleTextAttributes:titleAttr];


    // 可以跳转返回按钮文字的偏移量
    //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 防止手势冲突
    //    self.interactivePopGestureRecognizer.enabled = NO;

    // 取出系统手势的target对象，

    //  取出某个对象里面属性 1.KVC 前提条件：必须知道属性名 2.运行时

    // 遍历某个类里面所有属性 Ivar:表示成员属性
    // copyIvarList只能获取哪个类下面的属性，并不会越界（不会把它的父类的属性给遍历出来）
    // Class 获取哪个类的成员属性
    // count:告诉你当前类里面成员属性的总数
    //    unsigned int count = 0;
    //    // 返回成员属性的数组
    //    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &count);
    //
    //    for (int i = 0; i < count; i++) {
    //        // 取出成员变量
    //        Ivar ivar = ivars[i];
    //
    //        // 获取属性名
    //        NSString *ivarName = @(ivar_getName(ivar));
    //
    //        NSLog(@"%@",ivarName);
    //
    //
    //    }

    // _targets:属性名 value
    //    NSArray *targets = [self.interactivePopGestureRecognizer valueForKeyPath:@"_targets"];
    //
    //    id objc = [targets firstObject];
    //
    //    id target = [objc valueForKeyPath:@"_target"];
    //
    //
    //
    //    //    NSLog(@"%@",self.interactivePopGestureRecognizer.delegate);
    //
    //    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    //
    //    pan.delegate = self;
    //
    //    [self.view addGestureRecognizer:pan];

    // 系统也有滑动手势，系统也是使用Target实现了滑动功能（action），
    //    self.interactivePopGestureRecognizer 滑动的手势
}

// 是否开始触发手势
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    // 判断下当前控制器是否是跟控制器
//    // 系统滑动手势类型：UIScreenEdgePanGestureRecognizer
//    // target：_UINavigationInteractiveTransition
//    // action：handleNavigationTransition:
//    return (self.topViewController != [self.viewControllers firstObject]);
//}

// self -> 导航控制器


//- (void)back {
//    [self popViewControllerAnimated:YES];
//}



-(BOOL)shouldAutorotate {
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
