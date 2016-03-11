//
//  AddNewMachineViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/11.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AddNewMachineViewController.h"
#import "ChangeEquipmentTableViewCell.h"
#import "GxqAlertView.h"
#import "InvitePersonViewController.h"

@interface AddNewMachineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (copy, nonatomic) UIButton *bottomBtn;
@property (copy, nonatomic) UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *array;

@end

@implementation AddNewMachineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backBtn.hidden = NO;
    self.midView.hidden = NO;
    self.firstLabel.text = @"心电健康";
    self.secondLabel.text = @"添加心电健康需要以下设备";
    [self setUIInterface];
}

- (void)setUIInterface
{
    
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headerView.backgroundColor = RGBCOLOR(248, 248, 248);
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 40, 7, 15, 15)];
    imageView.layer.cornerRadius = 15 / 2;
    imageView.clipsToBounds = YES;
    imageView.image = ImageNamed(@"icon_refresh@2x");
    [headerView addSubview:imageView];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 40 + 15 + 10, 0, 100,30)];
    label.text = @"重新扫描";
    label.textColor = RGBCOLOR(147, 147, 147);
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:label];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 29, SCREEN_WIDTH, 1)];
    line.backgroundColor = RGBCOLOR(245, 245, 245);
    [headerView addSubview:line];
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actiondo:)];
    
    [headerView addGestureRecognizer:tapGesture];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 209, SCREEN_WIDTH, SCREEN_HEIGHT - 209)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = headerView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerNib:[UINib nibWithNibName:@"ChangeEquipmentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ChangeEquipmentTableViewCell"];
    [self.view addSubview:_tableView];
    
    
    _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _bottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60);
    [_bottomBtn setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
    [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_bottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_bottomBtn setTitle:@"确认添加" forState:UIControlStateNormal];
    _bottomBtn.backgroundColor = [Tools colorWithHexString:@"#bebebf" withAlpha:1];;
    [_bottomBtn addTarget:self action:@selector(changeEquiment:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bottomBtn];
    
    
    
}

/**
 *  点击刷新
 *
 *  @param sender
 */
- (void)actiondo:(UITapGestureRecognizer *)sender
{
    
}
/**
 *  更换设备
 *
 *  @param sender
 */
- (void)changeEquiment:(UIButton *)sender {
    
    NSArray *array = @[@"关闭窗口",@"分配新指标"];
    
    UIColor *color1 = [Tools colorWithHexString:@"#bebebf" withAlpha:1];
    UIColor *color2 = [Tools colorWithHexString:@"#56d2c2" withAlpha:1];
    
    [GxqAlertView showWithIMage:@"icon_success" noticeTitle:@"添加成功" noticelMessage:@"您可以检测 心电健康 " buttonNum:2 buttonTitles:array buttonColors:@[color1,color2] LeftBlock:^{
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    } RightBlock:^{
        
        InvitePersonViewController *vc = [[InvitePersonViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ChangeEquipmentTableViewCell";
    ChangeEquipmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[ChangeEquipmentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.messageLabel.text = @"老鼠爱大米";
    if ([self.array containsObject:[NSNumber numberWithInteger:indexPath.row]]) {
        
        cell.selectImage.image = ImageNamed(@"icon_square_s.png");
    }
    else
    {
        cell.selectImage.image = ImageNamed(@"icon_square_uns.png");
    }
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.array containsObject:[NSNumber numberWithInteger:indexPath.row]]) {
        
        [self.array removeObject:[NSNumber numberWithInteger:indexPath.row]];
    }
    else
    {
        [self.array addObject:[NSNumber numberWithInteger:indexPath.row]];
    }
    [self.tableView reloadData];
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
