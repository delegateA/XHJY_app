//
//  MessageListModel.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageListModel : NSObject
//名字
@property (nonatomic,copy) NSString *type;
//时间
@property (nonatomic,copy) NSString *time;
//详情
@property(nonatomic,copy) NSString *detailText;
@end
