//
//  HZQDatePickerView.m
//  HZQDatePickerView
//
//  Created by 1 on 15/10/26.
//  Copyright © 2015年 HZQ. All rights reserved.
//

#import "ZZDatePickerView.h"
#import "UIColor+HexString.h"

@interface ZZDatePickerView ()

@property (nonatomic, strong) NSString *selectDate;

@property (weak, nonatomic) IBOutlet UIButton *cannelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIView *backgVIew;

@end

@implementation ZZDatePickerView

+ (ZZDatePickerView *)instanceDatePickerView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ZZDatePickerView" owner:nil options:nil];
    
    return [nibView objectAtIndex:0];
}

- (void)awakeFromNib
{
    
    
//    let :NSDate = NSDate(timeIntervalSinceNow: daubleTime)
//    let nowdate:NSDate = NSDate(timeIntervalSinceNow: Double(-24 * (4 * 365 + 1 * 366) * 3600))
//    datePicker.minimumDate = tempDate
//    datePicker.maximumDate = nowdate
    self.backgVIew.layer.cornerRadius = 5;
    self.backgVIew.layer.borderWidth = 1;
    self.backgVIew.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.backgVIew.layer.masksToBounds = YES;
    
    /** 确定 */
    self.sureBtn.layer.cornerRadius = 3;
    self.sureBtn.layer.borderWidth = 1;
    self.sureBtn.layer.borderColor = [[UIColor colorwithHexString:@"00D9C4"] CGColor];
    self.sureBtn.layer.masksToBounds = YES;
    
    /** 取消按钮 */
    self.cannelBtn.layer.cornerRadius = 3;
    self.cannelBtn.layer.borderWidth = 1;
    self.cannelBtn.layer.borderColor = [[UIColor colorwithHexString:@"BAB9B9"] CGColor];
    self.cannelBtn.layer.masksToBounds = YES;
}

- (NSString *)timeFormat
{
    double   date1 = -24 * (49 * 365 + 16 * 366) * 3600;
    NSDate *date2=[NSDate dateWithTimeIntervalSinceNow:date1];
   
    self.datePickerView.minimumDate=date2;
    self.datePickerView.maximumDate=[NSDate new];
    NSDate *selected = self.datePickerView.date;
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *currentOlderOneDateStr = [dateFormatter stringFromDate:selected];
    
    NSInteger age=[self ageWithDateOfBirth:selected];
    NSString *str=[NSString stringWithFormat:@"%ld",age];
    return str;
   // return currentOlderOneDateStr;
}

- (void)animationbegin:(UIView *)view {
    /* 放大缩小 */
    
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 动画选项设定
    animation.duration = 0.1; // 动画持续时间
    animation.repeatCount = -1; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:0.9]; // 结束时的倍率
    
    // 添加动画
    [view.layer addAnimation:animation forKey:@"scale-layer"];

}

- (IBAction)removeBtnClick:(id)sender {
    // 开始动画
    [self animationbegin:sender];

    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)sureBtnClick:(id)sender {
    // 开始动画
    [self animationbegin:sender];
    
    self.selectDate =[self timeFormat];
    //delegate
    [self.delegate getSelectDate:self.selectDate ];
    
    
    [self removeBtnClick:nil];
}

- (NSInteger)ageWithDateOfBirth:(NSDate *)date;
{
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    
    return iAge;
}
@end
