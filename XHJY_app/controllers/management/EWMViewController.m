//
//  EWMViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/4.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "EWMViewController.h"

@interface EWMViewController ()

@end

@implementation EWMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backBtn.hidden = NO;
    self.topTittle.text  = @"我的二维码";
    [self setUIinterface];
}

- (void)setUIinterface
{
    UIImageView *logIMageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 64 + 30, 50, 50)];
    logIMageView.layer.cornerRadius = 25;
    logIMageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:logIMageView];
    
    
    
    UILabel *nickName = [[UILabel alloc]initWithFrame:CGRectMake(30 + 50 + 10 , 64 + 30, SCREEN_WIDTH - 30 - 50 - 20, 50)];
    nickName.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:nickName];
    
    
    UIImageView *ewmImageVIew = [[UIImageView alloc]init];
    ewmImageVIew.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
    ewmImageVIew.bounds = CGRectMake(0, 0, 100, 100) ;
    ewmImageVIew.backgroundColor = [UIColor blackColor];
    [self.view addSubview:ewmImageVIew];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.bounds = CGRectMake(0, 0, SCREEN_WIDTH - 20, 20);
    label.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 50 + 20);
    label.text = @"扫一扫上面的二维码,关注我";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    
    
    
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
