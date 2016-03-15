//
//  Sha1Manager.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/15.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sha1Manager : NSObject
+ (NSString *)sha1StringFrom:(NSString *)input;
+ (NSString *)sha1StringFromData:(NSData *)data;
@end
