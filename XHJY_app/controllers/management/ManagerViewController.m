//
//  ManagerViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ManagerViewController.h"

@interface ManagerViewController ()


@end

@implementation ManagerViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.percent = SCREEN_WIDTH  /  375;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (UIButton *)setBtn
{
    
    if (!_setBtn) {
        
        CGFloat width = 22 * self.percent;
        _setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_setBtn setBackgroundColor:[UIColor blackColor]];
        [_setBtn setImage:ImageNamed(@"btn_set_normal") forState:UIControlStateNormal];
        [_setBtn setImage:ImageNamed(@"btn_set_press") forState:UIControlStateSelected];
        _setBtn.frame = CGRectMake(20 + 10 * self.percent, SCREEN_WIDTH - 10 - width, width, width);
        [self.view addSubview:_setBtn];
    }
    return _setBtn;
}

- (UIButton *)setImageBtn
{
    if (!_setImageBtn) {
        
        CGFloat width = 100 * self.percent;
        _setImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _setImageBtn.backgroundColor = [UIColor blackColor];
        _setImageBtn.bounds = CGRectMake(0, 0, width, width);
        _setImageBtn.center = CGPointMake(SCREEN_WIDTH / 2, (75 + 50) * self.percent);
        [self.view addSubview:_setImageBtn];
    }
    return _setImageBtn;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.bounds = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    }
    return _nameLabel
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
