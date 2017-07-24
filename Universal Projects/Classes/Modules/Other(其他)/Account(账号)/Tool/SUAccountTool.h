//
//  SUAccountTool.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUAccount.h"
@interface SUAccountTool : NSObject

+ (void)saveAccount:(SUAccount *)account;

+ (SUAccount *)account;

+ (void)quit;

@end
