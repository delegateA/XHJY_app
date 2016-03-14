//
//  HZQDatePickerView.h
//  HZQDatePickerView
//
//  Created by 1 on 15/10/26.
//  Copyright © 2015年 HZQ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZZDatePickerView : UIView
/**
 *  返回的年龄
 */
@property (nonatomic, copy) void(^calendarBlock)(NSInteger age);

- (id)initWithFrame:(CGRect)frame withTime:(NSDate *)date;
- (void)show;
- (void)hidden;


@end
