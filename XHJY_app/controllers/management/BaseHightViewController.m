//
//  BaseHightViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "BaseHightViewController.h"

@interface BaseHightViewController ()

@end

@implementation BaseHightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIView *)midView
{
    if (!_midView) {
        
        _midView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 209 - 64)];
        _midView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [self.view addSubview:_midView];
    }
    return _midView;
}

- (UILabel *)firstLabel
{
    if (!_firstLabel) {
        
        _firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, 20)];
        _firstLabel.font = [UIFont boldSystemFontOfSize:20];
        _firstLabel.textColor = [UIColor whiteColor];
        _firstLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_firstLabel];
    }
    return _firstLabel;
}

- (UILabel *)secondLabel
{
    if (!_secondLabel) {
        
        _secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 144, SCREEN_WIDTH, 14)];
        _secondLabel.font = [UIFont boldSystemFontOfSize:14];
        _secondLabel.textColor = [UIColor whiteColor];
        _secondLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_secondLabel];
    }
    return _secondLabel;
}

- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        //262
        _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 110) / 2, 75, 110, 110)];
        _logoImageView.layer.cornerRadius = 55;
        _logoImageView.layer.borderWidth = 5;
        _logoImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _logoImageView.clipsToBounds = YES;
        [self.view addSubview:_logoImageView];
    }
    return _logoImageView;
}

- (UILabel *)nickNameLabel
{
    if (!_nickNameLabel) {
        
        _nickNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 75 + 110 + 25, SCREEN_WIDTH, 25)];
        _nickNameLabel.font = [UIFont boldSystemFontOfSize:20];
        _nickNameLabel.textColor = [UIColor whiteColor];
        _nickNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_nickNameLabel];
    }
    return _nickNameLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
