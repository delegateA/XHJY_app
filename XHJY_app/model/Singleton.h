//
//  Singleton.h
//  试客-Eptonic
//
//  Created by 邑动 on 15/1/6.
//  Copyright (c) 2015年 Eptonic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (nonatomic,assign) BOOL isLogin;

/**
 *  用户id
 */
@property(nonatomic,copy) NSString *userId;
//主色调
@property (nonatomic,copy) NSString *mainColor;
/**
 *  线条颜色
 */
@property (nonatomic,copy) NSString *lineColor;
/**
 *  app name
 */
@property (nonatomic,copy) NSString *appName;
/**
 *  base url
 */
@property (nonatomic,copy) NSString *baseUrl;
/**
 *  获取验证码
 *
 */
@property (nonatomic,copy) NSString *verificationCodeUrl;
/**
 *  注册
 *
 */
@property(nonatomic,copy) NSString *creat;
/**
 *  登录
 *

 */
@property(nonatomic,copy) NSString *login;
/**
 *  忘记密码
 */
@property(nonatomic,copy) NSString *forgotPassword;
/**
 *  上传头像
 */
@property(nonatomic,copy)NSString *upLoadImage;

+ (Singleton *)sharedInstance;

@end
