//
//  SUDataBasic.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SUDataBasic : NSObject



/// 单例
sharedInstanceH

/// 创建数据库
- (void)openDataBaseName:(NSString *)dbName;

@end
