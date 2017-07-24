//
//  SUAccount.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUAccount.h"

@implementation SUAccount


+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    SUAccount *account = [[self alloc] init];
    account.name = dict[@"loginName"];
    account.iconUrl = dict[@"photoUrl"];
    account.nickName = dict[@"nickName"];
    account.uid = dict[@"customerId"];
    account.phoneNubmer = dict[@"phone"];
    account.token = dict[@"token"];
    return account;
}

/**
 *  当一个对象要归档进沙盒中时，就会调用这个方法
 *  目的：在这个方法中说明这个对象的哪些属性要存进沙盒
 */
//- (void)encodeWithCoder:(NSCoder *)encoder
//{
//    [encoder encodeObject:self.access_token forKey:@"access_token"];
//    [encoder encodeObject:self.expires_in forKey:@"expires_in"];
//    [encoder encodeObject:self.uid forKey:@"uid"];
//    [encoder encodeObject:self.created_time forKey:@"created_time"];
//    [encoder encodeObject:self.name forKey:@"name"];
//}

/**
 *  当从沙盒中解档一个对象时（从沙盒中加载一个对象时），就会调用这个方法
 *  目的：在这个方法中说明沙盒中的属性该怎么解析（需要取出哪些属性）
 */
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super init]) {
//        self.access_token = [decoder decodeObjectForKey:@"access_token"];
//        self.expires_in = [decoder decodeObjectForKey:@"expires_in"];
//        self.uid = [decoder decodeObjectForKey:@"uid"];
//        self.created_time = [decoder decodeObjectForKey:@"created_time"];
//        self.name = [decoder decodeObjectForKey:@"name"];
//    }
//    return self;
//}

@end
