//
//  AnalysisViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AnalysisViewController.h"


@interface AnalysisViewController ()

@end

@implementation AnalysisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUIinterface];
}

- (void)setUIinterface
{
    self.topView.backgroundColor = [UIColor whiteColor];
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
