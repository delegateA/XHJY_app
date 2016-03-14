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
{
    UIView *mainView;
    UIDatePicker *datePicker;
}

@end

@implementation ZZDatePickerView

- (id)initWithFrame:(CGRect)frame withTime:(NSDate *)date
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UIView *backGroundView = [[UIView alloc]initWithFrame:self.frame];
        backGroundView.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
        [self addSubview:backGroundView];
        
        mainView = [[UIView alloc]init];
        mainView.backgroundColor = [UIColor whiteColor];
        [backGroundView addSubview:mainView];
        
        datePicker = [[UIDatePicker alloc]init];
        datePicker.frame = CGRectMake(0, 30, SCREEN_WIDTH, datePicker.bounds.size.height);
        datePicker.datePickerMode = UIDatePickerModeDate;
        [datePicker setDate:date animated:YES];
        
        double daubleTime = -24 * (49 * 365 + 16 * 366) * 3600;
        NSDate *temp = [NSDate dateWithTimeIntervalSinceNow:daubleTime];
        NSDate *now = [NSDate date];
        
        datePicker.minimumDate = temp;
        datePicker.maximumDate = now;
        mainView.bounds = CGRectMake(0, 0, datePicker.bounds.size.width, datePicker.bounds.size.height + 30);
        mainView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT + mainView.bounds.size.height);
        [mainView addSubview:datePicker];
        
        UIButton *bacekBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        bacekBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH / 4, 30);
        [bacekBtn setTitle:@"取消" forState:UIControlStateNormal];
        [bacekBtn setTitleColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1] forState:UIControlStateNormal];
        [bacekBtn addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:bacekBtn];
        
        
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        sureBtn.frame = CGRectMake(SCREEN_WIDTH / 4 * 3, 0, SCREEN_WIDTH / 4, 30);
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(selectTime:) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setTitleColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1] forState:UIControlStateNormal];
        [mainView addSubview:sureBtn];
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 4, 0, SCREEN_WIDTH / 2, 30)];
        titleLabel.text = @"设置出生年月";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [mainView addSubview:titleLabel];
        
    }
    
    return self;
}


- (void)closeView:(UIButton *)sender
{
    [self hidden];
}

- (void)selectTime:(UIButton *)sender
{
    [self hidden];
    if (self.calendarBlock) {
        self.calendarBlock([self ageWithDateOfBirth:datePicker.date]);
    }
    
}

- (void)show
{
    [UIView animateWithDuration:0.5 animations:^{
        
        mainView.center = mainView.center =  CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT - mainView.bounds.size.height / 2);
        
    }];
}

- (void)hidden
{
    [UIView animateWithDuration:0.5 animations:^{
        
        mainView.center = mainView.center =  CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT + mainView.bounds.size.height * 2);
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            
        }
    }];
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
