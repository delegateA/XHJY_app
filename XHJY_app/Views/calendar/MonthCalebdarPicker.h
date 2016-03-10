//
//  MonthCalebdarPicker.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/8.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthCalebdarPicker : UIView
@property (nonatomic, copy) void(^calendarBlock)(NSInteger month, NSInteger year);
@end
