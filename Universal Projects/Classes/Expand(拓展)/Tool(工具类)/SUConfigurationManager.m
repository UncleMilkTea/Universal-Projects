//
//  SUConfigurationManager.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/14.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUConfigurationManager.h"


@interface SUConfigurationManager ()

@property (nonatomic, strong) NSDictionary *configurDic;

@end


@implementation SUConfigurationManager
sharedInstanceM

- (NSInteger)newfeatureCount{
    return [[self.configurDic objectForKey:NewFeatureCount] integerValue];
}

-(NSArray *)tabBarItems{

    return [self.configurDic objectForKey:TabBarItems];
}

- (NSInteger)refreshCount{
    return [[self.configurDic objectForKey:RefreshCount] integerValue];

}

- (NSInteger)requestTimeout{
    return [[self.configurDic objectForKey:RequestTimeout] integerValue];

}

- (NSString *)refreshImage{
    return [self.configurDic objectForKey:RefreshImage];
}

- (NSString *)public_url{
    return [[self.configurDic objectForKey:SUProjectApi] objectForKey:SUPublic_url];
}

- (NSString *)login_url{
    return [[self.configurDic objectForKey:SUProjectApi] objectForKey:SULogin_url];
}

- (BOOL)isFormal{
    return [self.configurDic objectForKey:SUEnvironmentConfiguration];
}

- (NSDictionary *)configurDic{
    if (!_configurDic) {
        NSString *path = [[NSBundle mainBundle] pathForResource:SUConfiguration ofType:nil];
        _configurDic = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return _configurDic;
}
@end
