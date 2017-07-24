//
//  HomePageRequest.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "HomePageRequest.h"

@implementation HomePageRequest


+ (void)getCategoryLevelOneListWithResultBlock:(RequestResponse)resultBlock {

    NSString *url = [NSString stringWithFormat:@"%@%@/%@",public_url_prefix, getCategoryLevelOneList, storeID];

    [CSNetworking GET:nil isCache:NO networkBlock:^(CSCommonResult *result, id responseObject) {
        [CSResponseTool analyzeDataWithResult:result response:responseObject modelClass:nil analyzedBlock:^(CSAnalyzedResult *result, id data) {
//            [SUBasicRequest checkAnalyzedResult:result];
            if (resultBlock) { resultBlock(result, data); }
        }];
    }];
}

@end
