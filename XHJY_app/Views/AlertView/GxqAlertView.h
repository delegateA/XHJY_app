//
//  GxqBackgroundView.h
//  自定义弹出框
//
//  Created by 高盛通 on 16/2/16.
//  Copyright © 2016年 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GxqAlertView : UIView
typedef void (^GxqLeftBlock)();
typedef void (^GxqRightBlock)();
@property (nonatomic,copy)GxqLeftBlock leftBlock;
@property (nonatomic,copy)GxqRightBlock rightBlock;

+ (void)showWithIMage:(NSString *)image noticeTitle:(NSString *)noticeTitle noticelMessage:(NSString *)message buttonNum:(NSInteger)num buttonTitles:(NSArray *)buttonTitles buttonColors:(NSArray *)colors LeftBlock:(GxqLeftBlock)leftBlock RightBlock:(GxqRightBlock)rightBlock;

@end
