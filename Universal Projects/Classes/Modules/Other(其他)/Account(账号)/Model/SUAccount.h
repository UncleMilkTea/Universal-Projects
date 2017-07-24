//
//  SUAccount.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUBasicModel.h"

@interface SUAccount : SUBasicModel

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *phoneNubmer;

@property (nonatomic, copy) NSString *iconUrl;

@property (nonatomic, copy) NSString *token;

+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
