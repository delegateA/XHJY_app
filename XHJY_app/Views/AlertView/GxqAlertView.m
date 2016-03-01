//
//  GxqBackgroundView.m
//  自定义弹出框
//
//  Created by 高盛通 on 16/2/16.
//  Copyright © 2016年 Big Nerd Ranch. All rights reserved.
//

#import "GxqAlertView.h"
#define screenH  [UIScreen mainScreen].bounds.size.height
#define screenW  [UIScreen mainScreen].bounds.size.width
@implementation GxqAlertView

+ (void)showWithIMage:(NSString *)image noticeTitle:(NSString *)noticeTitle noticelMessage:(NSString *)message buttonNum:(NSInteger)num buttonTitles:(NSArray *)buttonTitles buttonColors:(NSArray *)colors LeftBlock:(GxqLeftBlock)leftBlock RightBlock:(GxqRightBlock)rightBlock
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    GxqAlertView *selfView = [[self alloc]initWithFrame:[UIScreen mainScreen].bounds];
    selfView.backgroundColor = [UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1];
    //selfView.alpha = 0.2;
    [keyWindow addSubview:selfView];
    
    [selfView contentViewWithImageName:image withBigNoticeString:noticeTitle withSmallNoticeString:message withNumofBtn:num withBtnString:buttonTitles withBtnColor:colors leftBlock:leftBlock RightBlock:rightBlock];
}

+ (void)dismiss
{
    
}

- (void)contentViewWithImageName:(NSString *)name withBigNoticeString:(NSString *)noticeLabel withSmallNoticeString:(NSString *)smallNoticel withNumofBtn:(NSInteger)num withBtnString:(NSArray *)btnStrings withBtnColor:(NSArray *)colors leftBlock:(GxqLeftBlock)leftBlock RightBlock:(GxqRightBlock)rightBlock
{
    self.leftBlock = leftBlock;
    self.rightBlock = rightBlock;
    
    CGFloat alertViewW = screenW * 0.81;
    CGFloat percent = screenW / 375;
    CGFloat alertViewH = 330 * percent;
    UIView *alertView = [UIView new];
    
    alertView.alpha = 0;
    alertView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.25f animations:^{
        alertView.alpha = 1.0;
        alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    
    alertView.frame = CGRectMake((screenW - alertViewW) * 0.5, (screenH - alertViewH) * 0.5, alertViewW, alertViewH);
    alertView.backgroundColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1];
    
    if (noticeLabel.length > 0) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((alertViewW- 100 * percent) / 2, 40 * percent, 100 * percent, 100 * percent)];
        imageView.layer.cornerRadius = 50 * percent;
        imageView.image = [UIImage imageNamed:name];
        [alertView addSubview:imageView];
        
        [alertView addSubview:alertView];
        
        UILabel *bigLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 170 * percent, screenW, 25 * percent)];
        bigLabel.text = noticeLabel;
        bigLabel.font = [UIFont systemFontOfSize:20];
        bigLabel.textColor = [UIColor blackColor];
        [alertView addSubview:bigLabel];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 215  * percent, alertViewW, 10 * percent)];
        label.text = smallNoticel;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor lightGrayColor];
        [alertView addSubview:label];
    }
    else
    {
    
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((alertViewW- 100 * percent) / 2, 80 * percent, 100 * percent, 100 * percent)];
        imageView.layer.cornerRadius = 50 * percent;
        imageView.image = [UIImage imageNamed:name];
        [alertView addSubview:imageView];
    
        [alertView addSubview:alertView];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 180  * percent, alertViewW, 90 * percent)];
        label.text = smallNoticel;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor lightGrayColor];
        [alertView addSubview:label];
        
    }
    
    if (num == 1) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(0, (alertViewH - 60)*percent, alertViewW, 60 * percent);
        [btn setTitle:btnStrings[0] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:20 * percent]];
        [btn setBackgroundColor:colors[0]];
        [btn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:btn];
        
    }
    if (num == 2) {
        
        UIButton *sureBtn = [UIButton new];
        sureBtn.frame = CGRectMake(alertView.frame.size.width/2 ,  (alertViewH - 60)*percent,alertView.frame.size.width / 2, 60 * percent);
        [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setBackgroundImage:[UIImage imageNamed:@"icon_sure"] forState:UIControlStateNormal];
        [sureBtn setTitleColor:[UIColor colorWithRed:0.19 green:0.62 blue:0.78 alpha:1] forState:UIControlStateNormal];
        sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [sureBtn setBackgroundColor:colors[1]];
        [alertView addSubview:sureBtn];
        
        
        UIButton *cancelBtn = [UIButton new];
        cancelBtn.frame = CGRectMake(0, (alertViewH - 60)*percent, alertView.frame.size.width * 0.5, 60 * percent);
        [sureBtn setBackgroundImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setBackgroundColor:colors[0]];
        [alertView addSubview:cancelBtn];

    }
    
    
    
}


- (void)sureBtnClick:(UIButton *)btn
{

    self.rightBlock();
    [self closeView];
}

- (void)cancelBtnClick:(UIButton *)btn
{
    self.leftBlock();
    [self closeView];
}


-(void)closeView
{
    [UIView animateWithDuration:0.3f animations:^{
        [self.subviews objectAtIndex:0].alpha = 0;
        [self.subviews objectAtIndex:0].transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
