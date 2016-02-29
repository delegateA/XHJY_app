//
//  Singleton.h
//  试客-Eptonic
//
//  Created by 邑动 on 15/1/6.
//  Copyright (c) 2015年 Eptonic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
@property (nonatomic,copy) NSString *mainColor;

+ (Singleton *)sharedInstance;

@end
