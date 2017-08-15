//
//  SUAppManager.m
//  Universal Projects
//
//  Created by zhangsh on 2017/8/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUAppManager.h"
#import "YYFPSLabel.h"
#import "AdPageView.h"
#import "SUNavigationController.h"
#import "SUWebViewController.h"

@implementation SUAppManager

+ (void)appLaunchAd
{
    //加载广告
    AdPageView *adView = [[AdPageView alloc] initWithFrame:APP_SCREEN_BOUNDS withTapBlock:^{
        SUNavigationController *loginNavi =[[SUNavigationController alloc] initWithRootViewController:[[SUWebViewController alloc] initWithUrl:@"http://www.hao123.com"]];
        [kRootViewController presentViewController:loginNavi animated:YES completion:nil];
    }];
    [adView show];

}


+ (void)showFPS{
    YYFPSLabel *_fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = APP_SCREEN_HEIGHT - 55;
    _fpsLabel.right = APP_SCREEN_WIDTH - 10;
    //    _fpsLabel.alpha = 0;
    [kAppWindow addSubview:_fpsLabel];
}

@end
