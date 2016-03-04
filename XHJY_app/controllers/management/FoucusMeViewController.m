//
//  FoucusMeViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "FoucusMeViewController.h"
#import "GxqAlertView.h"
#import "InviteNewTypeViewController.h"

@interface FoucusMeViewController ()
@property(nonatomic,copy)UILabel *label;
@property(nonatomic,copy)UIScrollView *scrollView;
@property(nonatomic,copy)NSArray *array;
@property(nonatomic,copy)UIButton *bottomBtn;
@property(nonatomic,copy)UIButton *leftBottomBtn;
@property(nonatomic,copy)UIButton *rightBottomBtn;
@end

@implementation FoucusMeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [[NSArray alloc]initWithObjects:@"心电健康",@"血糖健康", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUIinterfece];
    if (self.btnType == 0) {
        
        self.label.text = @"我关注Ta的:";
        [self.bottomBtn setTitle:@"解除关注关系" forState:UIControlStateNormal];
    }
    else{
        
        self.label.text = @"TA关注我的:";
        [self.leftBottomBtn setTitle:@"解除关注关系" forState:UIControlStateNormal];
        [self.rightBottomBtn setTitle:@"邀请关注新指标" forState:UIControlStateNormal];
    }
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 65 * self.array.count);
}

- (void)setUIinterfece
{
    self.midView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 262 - 64);
    self.logoImageView.backgroundColor = [UIColor redColor];
    self.nickNameLabel.text = @"ASjhjs";
    self.backBtn.hidden = NO;
    
}


- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(25, 262, 100, 48)];
        _label.textColor = [Tools colorWithHexString:@"#b1b1b1" withAlpha:1];
        _label.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:_label];
        
    }
    return _label;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 310, SCREEN_WIDTH, SCREEN_HEIGHT - 310 - 60)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_scrollView];
        
        UIView *line = [[UIView alloc]initWithFrame: CGRectMake(0, 1, SCREEN_WIDTH, 1)];
        line.backgroundColor = [Tools  colorWithHexString:@"#f3f3f3" withAlpha:1];
        [_scrollView addSubview:line];
        
        NSInteger count = self.array.count;
        
        for (int i = 0; i < count; i++) {
            
            UIView *line = [[UIView alloc]initWithFrame: CGRectMake(0, 64 + 65 * i, SCREEN_WIDTH, 1)];
            line.backgroundColor = [Tools  colorWithHexString:@"#f3f3f3" withAlpha:1];
            [_scrollView addSubview:line];
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 21 + 65 * i, 22, 22)];
            imageView.image = ImageNamed(@"icon_target_blue.png");
            [_scrollView addSubview:imageView];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(55, 65 * i, SCREEN_WIDTH - 25, 65)];
            label.textColor = [UIColor blackColor];
            label.text = self.array[i];
            [_scrollView addSubview:label];
            
            if (self.btnType == 1) {
                
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.tag = 20 + i;
                btn.frame = CGRectMake(SCREEN_WIDTH - 25 - 22, 22 + i * 65, 22, 22);
                [btn setBackgroundImage:ImageNamed(@"btn_delete_red_normal.png") forState:UIControlStateNormal];
                [btn setBackgroundImage:ImageNamed(@"btn_delete_red_press.png") forState:UIControlStateSelected];
                [btn addTarget:self action:@selector(deleteType:) forControlEvents:UIControlEventTouchUpInside];
                [_scrollView addSubview:btn];
            }
        }
        
        
        
    }
    return  _scrollView;
}

- (UIButton *)bottomBtn
{
    if (!_bottomBtn) {
        
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60);
        [_bottomBtn setBackgroundColor:[Tools colorWithHexString:@"#ff3566" withAlpha:1]];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_bottomBtn addTarget:self action:@selector(deleteRelationShip:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomBtn];
    }
    return _bottomBtn;
}

- (UIButton *)leftBottomBtn
{
    if (!_leftBottomBtn) {
        
        _leftBottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _leftBottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH / 2, 60);
        [_leftBottomBtn setBackgroundColor:[Tools colorWithHexString:@"#ff3566" withAlpha:1]];
        [_leftBottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_leftBottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_leftBottomBtn addTarget:self action:@selector(deleteRelationShip:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_leftBottomBtn];
    }
    return _leftBottomBtn;
}


- (UIButton *)rightBottomBtn
{
    if (!_rightBottomBtn) {
        
        _rightBottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _rightBottomBtn.backgroundColor = [UIColor blackColor];
        _rightBottomBtn.frame = CGRectMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 60, SCREEN_WIDTH / 2, 60);
        [_rightBottomBtn setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
        [_rightBottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightBottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_rightBottomBtn addTarget:self action:@selector(addNewType:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_rightBottomBtn];
    }
    return _rightBottomBtn;
}


/**
 *  解除关注
 *
 *  @param sender
 */
- (void)deleteRelationShip:(id)sender
{
    
    NSArray *array = @[@"btn_close_normal.png",@"icon_sure.png"];
    
    UIColor *color1 = [Tools colorWithHexString:@"#ff3566" withAlpha:1];
    UIColor *color2 = [Tools colorWithHexString:@"bebebf" withAlpha:1];
    
    [GxqAlertView showWithIMage:@"icon_fail" noticeTitle:@"" noticelMessage:@"确认解除与ASS的关注管关系吗？" buttonNum:2 buttonTitles:array buttonColors:@[color1,color2] LeftBlock:^{
        
    } RightBlock:^{
        
    }];
    
}

/**
 *  邀请关注新指标
 *
 *  @param sender 
 */
- (void)addNewType:(UIButton *)sender
{
    InviteNewTypeViewController *vc = [[InviteNewTypeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}





/**
 *  删除项目
 *
 *  @param sender
 */
- (void)deleteType:(UIButton *)sender
{
    
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
