//
//  SUNewfeatureController.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/14.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUNewfeatureController.h"
#import "SUTabBarController.h"

@interface SUNewfeatureController () <UIScrollViewDelegate>

{
    UIButton *_startBtn;
}
//! 分页控制器
@property (nonatomic, weak) UIPageControl *pageControl;
//! 滚动视图
@property (nonatomic, weak) UIScrollView *scrollView;
//! 数量
@property (nonatomic, assign) NSInteger NewfeatureCount;

@end

@implementation SUNewfeatureController

#pragma mark - Life Cycle

- (void)dealloc {
    SULog(@"NewfeatureViewController-dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.NewfeatureCount = [SUConfigurationManager sharedInstance].newfeatureCount;
    // 1.创建一个scrollView：显示所有的新特性图片
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;

    // 2.添加图片到scrollView中
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i < self.NewfeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        // 显示图片
        NSString *name = nil;
        if (iPhone4s) {
            name = [NSString stringWithFormat:@"new_feature4s_%d", i + 0];
        }else {
            name = [NSString stringWithFormat:@"new_feature_%d", i + 0];
        }
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];

        // 如果是最后一个imageView，就往里面添加其他内容
        if (i == self.NewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }

    // 3.设置scrollView的其他属性
    // 如果想要某个方向上不能滚动，那么这个方向对应的尺寸数值传0即可
    scrollView.contentSize = CGSizeMake(self.NewfeatureCount * scrollW, 0);
    scrollView.bounces = NO; // 去除弹簧效果
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;

    // 4.添加pageControl：分页，展示目前看的是第几页
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = self.NewfeatureCount;
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = UIColorFromRGB(255, 255, 255);
    pageControl.pageIndicatorTintColor = UIColorFromRGBA(0,0,0,0.2);
    pageControl.centerX = scrollW * 0.5;
    pageControl.centerY = scrollH - 30;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}



#pragma mark - init View
/**
 *  初始化最后一个imageView
 *
 *  @param imageView 最后一个imageView
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互功能
    imageView.userInteractionEnabled = YES;

    // 1.分享给大家（checkbox）
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = SUAUTOFONT(14);
    shareBtn.width = 200;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.65;
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    shareBtn.hidden = YES;

    // top left bottom right

    // EdgeInsets: 自切
    // contentEdgeInsets:会影响按钮内部的所有内容（里面的imageView和titleLabel）
    //    shareBtn.contentEdgeInsets = UIEdgeInsetsMake(10, 100, 0, 0);

    // titleEdgeInsets:只影响按钮内部的titleLabel
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

    // imageEdgeInsets:只影响按钮内部的imageView
    //    shareBtn.imageEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 50

    // 2.立即进入
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setTitle:@"   立即体验   " forState:UIControlStateNormal];
    startBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    startBtn.borderWidth = 1;
    startBtn.cornerRadius = 4;
    startBtn.borderColor = [UIColor whiteColor];
    [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [startBtn setBackgroundImage:[UIImage imageNamed:@"icon_next"] forState:UIControlStateNormal];
    //    [startBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    //    startBtn.size = startBtn.currentBackgroundImage.size;
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [startBtn sizeToFit];
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.height * 0.88;
    [imageView addSubview:startBtn];
    _startBtn = startBtn;
}

#pragma mark - Network Request

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _startBtn.alpha = 0;
    double page = scrollView.contentOffset.x / scrollView.width;
    self.pageControl.currentPage = (int)(page + 0.5);
    if (self.pageControl.currentPage == self.NewfeatureCount-1) {
        [UIView animateWithDuration:0.5 animations:^{
            _startBtn.alpha = 1;
        }];
    }
}
#pragma mark - CustomDelegate
#pragma mark - Event Response
- (void)shareClick:(UIButton *)shareBtn
{
    // 状态取反
    shareBtn.selected = !shareBtn.isSelected;
}

- (void)startClick
{
    // 切换到HWTabBarController
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[SUTabBarController alloc] init];
}

@end
