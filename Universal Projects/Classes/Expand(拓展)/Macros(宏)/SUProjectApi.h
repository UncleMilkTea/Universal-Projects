//
//  SUProjectApi.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

   
/// 公用的
#define public_url_prefix  [SUConfigurationManager sharedInstance].public_url
/// 需要登录的
#define login_url_prefix [SUConfigurationManager sharedInstance].login_url
/// 需要登录&&需要安全码的
#define login_url_security_prefix (security_url ? security_url : @"http://api.91dgj.com/api/v1/")


//================================================================
//              1 == 线上环境  0 == 测试环境
#if [SUConfigurationManager sharedInstance].SUEnvironmentConfiguration

#define baseURLString @"" // 线上
#define systemConfig @"http://api.91dgj.com/v1/app/systemConfig/getSystemConfig"
#define systemConfig_test @"http://test.api.91dgj.com/v1/app/systemConfig/getSystemConfig"

#else

#define baseURLString @"" // 测试
#define systemConfig @"http://test.api.91dgj.com/v1/app/systemConfig/getSystemConfig"
#define systemConfig_test @"http://api.91dgj.com/v1/app/systemConfig/getSystemConfig"

#endif
//================================================================
