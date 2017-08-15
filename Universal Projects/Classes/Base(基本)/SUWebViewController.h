//
//  SUWebViewController.h
//  Universal Projects
//
//  Created by zhangsh on 2017/8/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUViewController.h"

@interface SUWebViewController : SUViewController
- (instancetype)initWithUrl:(NSString *)url;
@property (nonatomic, copy) NSString *url;
@end
