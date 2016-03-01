//
//  BaseViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    topView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [self.view addSubview:topView];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(10, 20 + 11, 22, 22);
    [self.backBtn setBackgroundImage:ImageNamed(@"btn_back_normal") forState:UIControlStateNormal];
    [self.backBtn setBackgroundImage:ImageNamed(@"btn_back_press") forState:UIControlStateSelected];
    [self.backBtn addTarget:self action:@selector(backToLastPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backBtn];
    self.backBtn.hidden = YES;
    
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.frame = CGRectMake(10, 20 + 11, 22, 22);
    [self.closeBtn setBackgroundImage:ImageNamed(@"btn_close_normal") forState:UIControlStateNormal];
    [self.closeBtn setBackgroundImage:ImageNamed(@"btn_close_press") forState:UIControlStateSelected];
    [self.closeBtn addTarget:self action:@selector(backToLastPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeBtn];
    self.closeBtn.hidden = YES;
    
    
    self.topTittle = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 160) / 2, 20, 160, 44)];
    self.topTittle.font = [UIFont boldSystemFontOfSize:18];
    self.topTittle.textAlignment = NSTextAlignmentCenter;
    self.topTittle.textColor = [UIColor whiteColor];
    [self.view addSubview:self.topTittle];
    
}

- (void)backToLastPage
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
