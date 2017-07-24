//
//  SUViewController.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/15.
//  Copyright © 2017年 Suger. All rights reserved.
//  基类

#import <UIKit/UIKit.h>
#import "MJRefresh.h"





@interface SUViewController : UIViewController

@property (nonatomic, assign) CGFloat tabBarHeight;

@property (nonatomic, assign) CGFloat navigationHeight;

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UIView *leftView;

@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UIView *centerView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, copy) NSString *centerTitle;

@property (nonatomic, strong) NSString *statisticTitle;

//================================ 刷新控件 ================================

@property (strong, nonatomic) MJRefreshHeader *mj_header;

@property (strong, nonatomic) MJRefreshFooter *mj_footer;

- (void)headerWithScrollView:(UIScrollView *)scrollView refreshingTarget:(id)target refreshingAction:(SEL)action;

- (void)footerWithScrollView:(UIScrollView *)scrollView refreshingTarget:(id)target refreshingAction:(SEL)action;


@end
