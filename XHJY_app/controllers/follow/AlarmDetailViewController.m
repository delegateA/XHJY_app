//
//  AlarmDetailViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AlarmDetailViewController.h"
#import "AlarmView.h"
#import "lineChart.h"

@interface AlarmDetailViewController()
@property(nonatomic,copy)UIScrollView *scrollView;
@end

@implementation AlarmDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUIinterface];
}

- (void)setUIinterface
{
    self.baseView.backgroundColor = [Tools colorWithHexString:@"#ff2e63" withAlpha:1];
    self.backBtn.hidden = NO;
    self.topTittle.text = @"房性早搏";
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 481 * 2);
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];//WithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
          [self.view addSubview:_scrollView];
        UIEdgeInsets padding = UIEdgeInsetsMake(64, 0, 0, 0);
        
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).with.offset(padding.top); //with is an optional semantic filler
            make.left.equalTo(self.view.mas_left).with.offset(padding.left);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(-padding.bottom);
            make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
        }];
        
        for (int i = 0; i < 2; i++) {
            AlarmView *view = [[AlarmView alloc]initWithFrame:CGRectMake(0, 0 + 481 * i, SCREEN_WIDTH, 481)];
            [view.btn addTarget:self action:@selector(clickToLandscape:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:view];
        }
        
    }
    
    return _scrollView;
}

- (void)clickToLandscape:(UIButton *)sender
{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
        self.view.transform = CGAffineTransformMakeRotation(M_PI/2);
        self.view.bounds = CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_WIDTH);
        
        self.scrollView.hidden = YES;
        self.baseView.frame = CGRectMake(0, 0, SCREEN_HEIGHT, 64);
        self.topTittle.frame = CGRectMake(42, 20, 120, 44);
        self.topTittle.text = @"房性早搏(已拨)";
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(42 + 130, 20, SCREEN_HEIGHT - 42 - 130, 44)];
        timeLabel.font = [UIFont systemFontOfSize:16];
        timeLabel.text = @"发生时间:2015-23-24 00:00:00    持续时间:00:00:00    心搏数:1360  ";
        timeLabel.textColor = [UIColor whiteColor];
        timeLabel.adjustsFontSizeToFitWidth = YES;
        [self.view addSubview:timeLabel];
        
        
        //    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_HEIGHT - 160, 20, 90, 44)];
        //    label.textColor = [UIColor whiteColor];
        //    label.text = @"持续时间:00:00:00";
        //    label.textAlignment = NSTextAlignmentCenter;
        //    [self.view addSubview:label];
        //    label.adjustsFontSizeToFitWidth = YES;
        //
        //
        //    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_HEIGHT - 65, 20, 60, 44)];
        //    numLabel.textColor = [UIColor whiteColor];
        //    numLabel.textAlignment = NSTextAlignmentCenter;
        //    numLabel.adjustsFontSizeToFitWidth = YES;
        //    numLabel.text = @"心搏数:1360";
        //    [self.view addSubview:numLabel];
        
        
        UIScrollView *scrollve = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_HEIGHT, SCREEN_WIDTH - 64)];
        scrollve.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:scrollve];
        
        for (int i = 0; i < 2; i++) {
            
            UIView *backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0 + 200 * i, SCREEN_HEIGHT, 20)];
            backView1.backgroundColor = [Tools  colorWithHexString:@"#E52e5C" withAlpha:1];
            [scrollve addSubview:backView1];
            
            
            
            lineChart *view = [[lineChart alloc]initWithFrame:CGRectMake(0, 20 + 200 * i + 10, SCREEN_HEIGHT, 160)];
            [scrollve addSubview:view];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0 + 200 * i, SCREEN_HEIGHT - 20, 20)];
            label.textColor = [UIColor whiteColor];
            label.text = @"开始:04:00:00";
            [scrollve addSubview:label];
            
            scrollve.contentSize = CGSizeMake(SCREEN_HEIGHT, 200 * 2);
            
        }

        
    }];
}







@end
