//
//  SUWebViewController.m
//  Universal Projects
//
//  Created by zhangsh on 2017/8/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUWebViewController.h"
#import <WebKit/WebKit.h>
@interface SUWebViewController ()<WKNavigationDelegate,WKUIDelegate>
{
    WKUserContentController * _userContentController;
}
@property(nonatomic, strong) WKWebView *wkwebView;
@property (strong, nonatomic) UIProgressView *progressView;//这个是加载页面的进度条

@end

@implementation SUWebViewController

-(instancetype)initWithUrl:(NSString *)url{
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.progressView removeFromSuperview];
}

#pragma mark 初始化webview
-(void)initWKWebView
{
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];//先实例化配置类 以前UIWebView的属性有的放到了这里
    //注册供js调用的方法
    _userContentController =[[WKUserContentController alloc]init];
    //    //弹出登录
    //    [userContentController addScriptMessageHandler:self  name:@"loginVC"];
    //
    //    //加载首页
    //    [userContentController addScriptMessageHandler:self name:@"gotoFirstVC"];
    //
    //    //进入详情页
    //    [userContentController addScriptMessageHandler:self  name:@"gotodetailVC"];
    
    configuration.userContentController = _userContentController;
    configuration.preferences.javaScriptEnabled = YES;//打开js交互
    _wkwebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT) configuration:configuration];
    [self.view addSubview:_wkwebView];
    _wkwebView.backgroundColor = [UIColor clearColor];
    _wkwebView.allowsBackForwardNavigationGestures =YES;//打开网页间的 滑动返回
    _wkwebView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    if (kiOS9Later) {
        _wkwebView.allowsLinkPreview = YES;//允许预览链接
    }
    _wkwebView.UIDelegate = self;
    _wkwebView.navigationDelegate = self;
    [_wkwebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];//注册observer 拿到加载进度
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [_wkwebView loadRequest:request];
    
    
}


@end
