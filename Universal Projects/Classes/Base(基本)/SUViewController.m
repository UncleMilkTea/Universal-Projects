//
//  SUViewController.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUViewController.h"
#import "MJRefreshGifHeader.h"

#define navigationViewWidth (CGRectGetWidth(self.navigationView.frame))
#define navigationViewHeight (CGRectGetHeight(self.navigationView.frame))
#define leftViewWidth (CGRectGetWidth(_leftView.frame))
#define leftViewHeight (CGRectGetHeight(_leftView.frame))
#define centerViewWidth (CGRectGetWidth(_centerView.frame))
#define rightViewWidth (CGRectGetWidth(_rightView.frame))
#define navHeight 64

@interface SUViewController ()


@end

@implementation SUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // iOS 7 的时候 当控制器中有 navigationbar,statusBar,tabBar,时
    // 系统会自动调整 UIScrollview 的 contentInset,
    // 设置为 NO 不让系统自动调整, 需要自己调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 隐藏系统的导航条
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = UIColorFromSameRGBA(246, 1);
    // 设置状态栏 高亮白色样式
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.tabBarHeight = 49;
    self.navigationHeight = navHeight;

    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    //    self.extendedLayoutIncludesOpaqueBars = NO;
    //    self.modalPresentationCapturesStatusBarAppearance = NO;


}


#pragma mark - Getters and Setters

- (void)setCenterTitle:(NSString *)centerTitle {
    NSAssert(centerTitle != nil, @"centerTitle不能为nil");
    _centerTitle = [centerTitle copy];
    // 标题
    UILabel *centerTitlelabel = [[UILabel alloc]init];
    centerTitlelabel.text = centerTitle;
    centerTitlelabel.backgroundColor = [UIColor clearColor];
    centerTitlelabel.textColor = [UIColor whiteColor];
    centerTitlelabel.font = SUAUTOFONT(18);
    [centerTitlelabel sizeToFit];
    self.centerView = centerTitlelabel;
}

- (void)setLeftView:(UIView *)leftView
{
    _leftView = leftView;
    [self.navigationView addSubview:_leftView];
    _leftView.frame = CGRectMake(0, 20, leftViewWidth, MIN(leftViewHeight, navigationViewHeight-20));
}

- (void)setRightView:(UIView *)rightView
{
    _rightView = rightView;
    [self.navigationView addSubview:_rightView];
    _rightView.frame = CGRectMake(navigationViewWidth - MAX(rightViewWidth, 50), 20, MAX(rightViewWidth, 50), 44);
}

- (void)setCenterView:(UIView *)centerView
{
    [_centerView removeFromSuperview];
    _centerView = centerView;
    [self.navigationView addSubview:_centerView];
    _centerView.frame = CGRectMake(MAX((navigationViewWidth - centerViewWidth)/2, 50), 20, MIN(centerViewWidth, navigationViewWidth-100) ,44 );
}

- (UIView *)navigationView
{
    if (_navigationView == nil) {
        _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH,navHeight)];
        _navigationView.backgroundColor = UIColorFromRGB(164,0,8);
        // _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, navigationViewHeight - 0.5, APP_SCREEN_WIDTH, 0.5)];
        // _lineView.backgroundColor = [UIColor grayColor];
        // _lineView.alpha = 0.5;
        // [_navigationView addSubview:_lineView];
        [self.view addSubview:_navigationView];

    }
    return _navigationView;
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    if (self.navigationController.viewControllers.count == 1)//关闭主界面的右滑返回
//    {
//        return NO;
//    }
//    else
//    {
//        return YES;
//    }
//}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


#pragma mark - 刷新控件
//================================ 刷新控件 ================================
- (void)headerWithScrollView:(UIScrollView *)scrollView refreshingTarget:(id)target refreshingAction:(SEL)action {
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:target refreshingAction:action];
    NSString *imageName = [SUConfigurationManager sharedInstance].refreshImage;
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 0; i<[SUConfigurationManager sharedInstance].refreshCount; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%zd",imageName, i]];
        [idleImages addObject:image];
    }

    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 0; i<[SUConfigurationManager sharedInstance].refreshCount; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%zd",imageName, i]];
        [refreshingImages addObject:image];
    }
    [header setImages:refreshingImages forState:MJRefreshStatePulling];

    // 设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];

    [header setImages:idleImages forState:MJRefreshStateIdle];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    scrollView.mj_header = header;
    self.mj_header = header;

    idleImages = nil;
    refreshingImages = nil;
}
//
- (void)footerWithScrollView:(UIScrollView *)scrollView refreshingTarget:(id)target refreshingAction:(SEL)action {
    MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:target refreshingAction:action];
    scrollView.mj_footer = footer;
    self.mj_footer = footer;
}


#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.view bringSubviewToFront:_navigationView];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    SULog(@">>>打开当前类：%@",[NSString stringWithUTF8String:object_getClassName(self)]);

//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        if (self.statisticTitle&&![self.statisticTitle isEqualToString:@""]) {
//            //            [[MCStatistical sharedInstance] pageviewStartWithName:self.MC_Title];
//
//        }
//    });
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    SULog(@">>>退出当前类：%@",[NSString stringWithUTF8String:object_getClassName(self)]);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        if (self.statisticTitle&&![self.statisticTitle isEqualToString:@""]) {
//            //            [[MCStatistical sharedInstance] pageviewEndWithName:self.MC_Title];
//        }
//    });
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [SVProgressHUD dismiss];
    //    });
}

- (void)backButtonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)closeButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    //     [[NSNotificationCenter defaultCenter] removeObserver:self name:MCNetworkingReachabilityDidChangeNotification object:nil];
    SULog(@">>>>>> 控制器释放 <<<<<<");
}


//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}


@end
