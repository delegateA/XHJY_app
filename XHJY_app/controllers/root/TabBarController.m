//
//  TabBarController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "TabBarController.h"
#import "tabBarButton.h"
#import "LoginViewController.h"
@interface TabBarController ()
{
     UIView *_bottomView;
    UIView *_lineView;
    tabBarButton *_pastBtn;
}
@end
@implementation TabBarController
//登录注册页面
-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *dic=[defaults objectForKey:@"Message"];
    
    if (dic!=nil) {
        LoginViewController *login=[[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:NO];
    }
}- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationController.navigationBarHidden = YES;
    //tabBar工具栏
    if (self.tabBar) {
        [self.tabBar removeFromSuperview];
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
        _bottomView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [self.view addSubview:_bottomView];
    }

    
    NSMutableArray *buttonTitles = [NSMutableArray arrayWithObjects:@"计划",@"关注",@"管理",nil];
    NSMutableArray *buttonImgs = [NSMutableArray arrayWithObjects:@"icon_plan",@"icon_follow",@"icon_administration", nil];
    
    NSInteger count = 3;//几个button

    
    
    for (int i = 0; i < count; i++) {
        
        tabBarButton *button = [tabBarButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0 + SCREEN_WIDTH/count * i, 0, SCREEN_WIDTH/count, 49);
        button.tag = 10 + i;
        button.buttonName.text = buttonTitles[i];
        button.buttonImg.image = [UIImage imageNamed:buttonImgs[i]];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
         [_bottomView addSubview:button];
        
        if (i == 1) {
            [self buttonPressed:button];
        }
        
        }
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / count, 46, SCREEN_WIDTH / count, 3)];
    _lineView.backgroundColor = [UIColor purpleColor];
    _lineView.layer.cornerRadius = 1;
    [_bottomView addSubview:_lineView];
}

- (void)buttonPressed:(tabBarButton *)sender
{
    if (!_pastBtn) {
        _pastBtn = sender;
        [UIView animateWithDuration:0.3 animations:^{
            _lineView.center = CGPointMake(sender.center.x, _lineView.center.y);
        } completion:^(BOOL finished) {
            if (finished) {
                self.selectedIndex = sender.tag - 10;
            }
        }];

    }
    else{
        
        if (_pastBtn == sender) {
            
        }
        else{
            
            [UIView animateWithDuration:0.5 animations:^{
                _lineView.center = CGPointMake(sender.center.x, _lineView.center.y);
            } completion:^(BOOL finished) {
                if (finished) {
                    self.selectedIndex = sender.tag - 10;
                }
            }];
            _pastBtn = sender;
        }
    }
    
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
