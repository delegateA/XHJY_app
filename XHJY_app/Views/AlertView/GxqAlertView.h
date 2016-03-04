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

/**
 *  自定义弹出框
 *
 *  @param image        大图片
 *  @param noticeTitle  标题
 *  @param message      内容
 *  @param num          按钮数目
 *  @param buttonTitles 按钮图片
 *  @param colors       按钮颜色
 *  @param leftBlock    左边按钮毁掉
 *  @param rightBlock   右边按钮毁掉
 */
+ (void)showWithIMage:(NSString *)image noticeTitle:(NSString *)noticeTitle noticelMessage:(NSString *)message buttonNum:(NSInteger)num buttonTitles:(NSArray *)buttonTitles buttonColors:(NSArray *)colors LeftBlock:(GxqLeftBlock)leftBlock RightBlock:(GxqRightBlock)rightBlock;

@end
