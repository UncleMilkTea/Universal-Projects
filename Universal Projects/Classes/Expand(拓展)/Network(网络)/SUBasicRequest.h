//
//  SUBasicRequest.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "CSNetworking.h"

/** 请求结果的回调 */
typedef void (^RequestResponse)(CSAnalyzedResult *result, id object);

@interface SUBasicRequest : CSNetworking

+ (void)checkAnalyzedResult:(CSAnalyzedResult *)result;

@end
