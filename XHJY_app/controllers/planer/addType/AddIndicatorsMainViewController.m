//
//  AddIndicatorsMainViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/11.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AddIndicatorsMainViewController.h"
#import "AddNewMachineViewController.h"

@interface AddIndicatorsMainViewController ()
@property(nonatomic,copy)UIScrollView *scrollView;
@property(nonatomic,copy)NSArray *array;
@property(nonatomic,copy)UIButton *bottomBtn;
@property(nonatomic,assign)NSInteger type;
@end

@implementation AddIndicatorsMainViewController

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
    self.closeBtn.hidden = NO;
    self.midView.hidden = NO;
    self.firstLabel.text = @"添加指标";
    self.secondLabel.text = @"请选择下列您想添加的指标";
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 80 * self.array.count);
    [self.bottomBtn setTitle:@"下 一 步" forState:UIControlStateNormal];
}



- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 209, SCREEN_WIDTH, SCREEN_HEIGHT - 209 - 60)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_scrollView];
        
        
        NSInteger count = self.array.count;
        
        for (int i = 0; i < count; i++) {
            
            UIView *line = [[UIView alloc]initWithFrame: CGRectMake(0, 79 + 80 * i, SCREEN_WIDTH, 1)];
            line.backgroundColor = [Tools  colorWithHexString:@"#f3f3f3" withAlpha:1];
            [_scrollView addSubview:line];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(85,  21 + 80 * i, SCREEN_WIDTH - 85, 15)];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.text = self.array[i];
            label.tag = 20 + i;
            [_scrollView addSubview:label];
            
            UILabel *labelSmall = [[UILabel alloc]initWithFrame:CGRectMake(85, 44  + 80 * i, SCREEN_WIDTH - 85, 12)];
            labelSmall.textColor = [Tools  colorWithHexString:@"#aeaeae" withAlpha:1];
            labelSmall.font = [UIFont systemFontOfSize:14];
            labelSmall.text = @"100000";
            labelSmall.tag = 30 + i;
            [_scrollView addSubview:labelSmall];
            
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(25, 20 + 80 * i, 42, 42);
            btn.tag = 40 + i;
            btn.layer.cornerRadius = 21;
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = [Tools  colorWithHexString:@"#f3f3f3" withAlpha:1].CGColor;
            btn.backgroundColor = [UIColor whiteColor];
            btn.clipsToBounds = YES;
            [btn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:btn];
            
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(25 + (42 - 24) / 2, 20 + (42 - 24) / 2 + 80 * i, 25, 25)];
            imageView.image = ImageNamed(@"icon_sure");
            imageView.tag = 10 + i;
            [_scrollView addSubview:imageView];
            
        }
        
        
        
    }
    return  _scrollView;
}

- (UIButton *)bottomBtn
{
    if (!_bottomBtn) {
        
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60);
        [_bottomBtn setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_bottomBtn addTarget:self action:@selector(inviteNewType:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomBtn];
    }
    return _bottomBtn;
}



- (void)selectType:(UIButton *)sender
{
    
    sender.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    
    
    UILabel *label = [_scrollView viewWithTag:sender.tag - 20];
    label.textColor = [UIColor grayColor];
    
}

- (void)inviteNewType:(UIButton *)sender
{
    AddNewMachineViewController *vc = [[AddNewMachineViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
