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
        _sharedInstance.mainColor = @"#00D9C4";
        
    });
    
    return _sharedInstance;
}
@end
