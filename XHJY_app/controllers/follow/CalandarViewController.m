//
//  CalandarViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/8.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "CalandarViewController.h"
#import "SZCalendarPicker.h"
#import "MonthCalebdarPicker.h"
#import "HorizontalMenu.h"

@interface CalandarViewController()<HorizontalMenuDelegate>
@property(nonatomic,copy)SZCalendarPicker *calendarPicker;
@property(nonatomic,copy)MonthCalebdarPicker *yearView;
@property(nonatomic,copy)UIView *headerView;
@property(nonatomic,assign)NSInteger selectIndex;
@end

@implementation CalandarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.baseView.backgroundColor = [UIColor whiteColor];
    self.closeBtn.hidden = NO;
    [self.closeBtn setBackgroundImage:ImageNamed(@"btn_close_g_normal") forState:UIControlStateNormal];
    [self.closeBtn setBackgroundImage:ImageNamed(@"btn_close_g_press") forState:UIControlStateHighlighted];
    self.topTittle.text = @"周期选择";
    self.topTittle.textColor = [UIColor blackColor];
    self.selectIndex = 1;
    self.headerView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    self.calendarPicker.hidden = NO;
    self.yearView.hidden = YES;
    
}

- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 61)];
        _headerView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [self.view addSubview:_headerView];
        
        HorizontalMenu *menu = [[HorizontalMenu alloc]initWithFrame:CGRectMake(0, 17, SCREEN_WIDTH, 44) withTitles:@[@"月",@"年"]];
        menu.delegate = self;
        menu.selectLine.backgroundColor = [Tools colorWithHexString:@"#5f66a3" withAlpha:1];
        [_headerView addSubview:menu];
        
    }
    return _headerView;
}

- (SZCalendarPicker *)calendarPicker
{
    if (!_calendarPicker) {
     
        
        _calendarPicker = [SZCalendarPicker showOnView:self.view];
        _calendarPicker.today = [NSDate date];
        _calendarPicker.date = _calendarPicker.today;
        _calendarPicker.frame = CGRectMake(0, 125, self.view.frame.size.width, SCREEN_WIDTH + 44);
        _calendarPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
            
            NSLog(@"%li-%li-%li", year,(long)month,(long)day);
            
            NSString *str = [[NSString alloc]initWithFormat:@"%li-%li-%li",year,(long)month,(long)day];
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
            [dic setObject:@"day" forKey:@"type"];
            [dic setObject:str forKey:@"time"];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"selectDay" object:nil userInfo:dic];
        };
        
    }
    
    return _calendarPicker;
}

- (MonthCalebdarPicker *)yearView
{
    if (!_yearView) {
        _yearView = [[MonthCalebdarPicker alloc]initWithFrame:CGRectMake(0, 125, SCREEN_WIDTH, SCREEN_WIDTH + 64)];
        _yearView.calendarBlock = ^(NSInteger month, NSInteger year){
            
            NSLog(@"%li-%li", (long)year,(long)month);
       
            
            NSString *str = [[NSString alloc]initWithFormat:@"%li-%li",year,(long)month];
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
            [dic setObject:@"day" forKey:@"type"];
            [dic setObject:str forKey:@"time"];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"selectMonth" object:nil userInfo:dic];
        };
        _yearView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_yearView];
    }
    return _yearView;
}


#pragma mark------------HorizontalMenuDelegate
- (void)clieckButton:(UIButton *)button
{
    self.selectIndex = button.tag;
    if (self.selectIndex == 0) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.calendarPicker.hidden = NO;
            self.yearView.hidden = YES;
        }];
    }
    
    if (self.selectIndex == 1) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.calendarPicker.hidden = YES;
            self.yearView.hidden = NO;
        }];
        
    }
    self.selectIndex = button.tag;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
@end
