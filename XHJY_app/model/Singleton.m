//
//  Singleton.m
//  试客-Eptonic
//
//  Created by 邑动 on 15/1/6.
//  Copyright (c) 2015年 Eptonic. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
+ (instancetype)sharedInstance
{
    static Singleton *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[Singleton alloc] init];
        _sharedInstance.isLogin = NO;
        _sharedInstance.userId = [[NSString alloc]init];
        _sharedInstance.mainColor = @"#00D9C4";
        _sharedInstance.lineColor = @"#F5F5F5";
        _sharedInstance.appName = @"HEALTH";
        _sharedInstance.baseUrl = @"http://192.168.2.50:9000/health_app_v2/";
        _sharedInstance.verificationCodeUrl = @"platform/app/user/sendSms";
        _sharedInstance.creat = @"platform/app/user/create";
        _sharedInstance.login = @"platform/app/user/login/v2";
        _sharedInstance.forgotPassword = @"platform/app/user/getPwdBySms";
        _sharedInstance.upLoadImage = @"platform/app/user/update/avatar";
        
    });
    
    return _sharedInstance;
}
@end
