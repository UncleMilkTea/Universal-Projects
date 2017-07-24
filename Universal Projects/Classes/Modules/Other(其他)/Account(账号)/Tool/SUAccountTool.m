//
//  SUAccountTool.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUAccountTool.h"
#define UserAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@implementation SUAccountTool


+ (void)saveAccount:(SUAccount *)account
{
    BOOL isSave = [NSKeyedArchiver archiveRootObject:account toFile:UserAccountPath];
    if (isSave) SULog(@"帐号归档成功");
}

+ (SUAccount *)account
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:UserAccountPath];
}

+ (void)quit {
//    [CSLoginRequest logoutWithResultBlock:^(CSAnalyzedResult *result, id object) {
//        [CSUserAccountTool cleanAccount];
//    }];
}

+ (void)cleanAccount {

    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager isDeletableFileAtPath:UserAccountPath]) {
        [defaultManager removeItemAtPath:UserAccountPath error:nil];
    }

}



@end
