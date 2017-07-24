//
//  SUConfigurationManager.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/14.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SUConfigurationManager : NSObject

sharedInstanceH

@property (nonatomic, assign ,readonly) NSInteger newfeatureCount;

@property (nonatomic, assign ,readonly) NSInteger refreshCount;

@property (nonatomic, assign ,readonly) NSInteger requestTimeout;

@property (nonatomic, copy ,readonly) NSString *refreshImage;

@property (nonatomic, strong ,readonly) NSArray *tabBarItems;

@property (nonatomic, copy ,readonly) NSString *public_url;

@property (nonatomic, copy ,readonly) NSString *login_url;

@property (nonatomic, assign, readonly) BOOL isFormal;

@end
