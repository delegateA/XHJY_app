//
//  EquipmentMessageViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "EquipmentMessageViewController.h"
#import "EquipmentMessageTableViewCell.h"
#import "ChangeEquipmentViewController.h"

@interface EquipmentMessageViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,copy) UIButton *bottomBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,copy)NSArray *array;


@end

@implementation EquipmentMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.topTittle.text = @"设备详情";
    self.backBtn.hidden = NO;
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"EquipmentMessageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EquipmentMessageTableViewCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.bottomBtn.hidden = NO;
}

- (UIButton *)bottomBtn
{
    if (!_bottomBtn) {
        
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60);
        [_bottomBtn setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
        [_bottomBtn setTitle:@"更换设备" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_bottomBtn addTarget:self action:@selector(changeEquiment:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomBtn];
    }
    return _bottomBtn;
}

- (NSArray *)array
{
    if (!_array) {
        
        _array = [[NSArray alloc]initWithObjects:@"版本号",@"功能说明",@"操作指南",@"觉得不错再买一个", nil];
    }
    return _array;
}

- (void)changeEquiment:(UIButton *)sender
{
    ChangeEquipmentViewController *vc = [[ChangeEquipmentViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"EquipmentMessageTableViewCell";
    EquipmentMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[EquipmentMessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.MessageLabel.text = self.array[indexPath.row];
    if (indexPath.row == 0) {
        cell.MessageLabel.text = @"";
        
        UILabel *topLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 20, 20)];
        topLabel.text = self.array[indexPath.row];
        topLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:topLabel];
        
        UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 100, 15)];
        leftLabel.textAlignment = NSTextAlignmentLeft;
        leftLabel.textColor = [UIColor grayColor];
        leftLabel.text = @"1231234";
        leftLabel.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:leftLabel];
        
        UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 120, 50, 100, 15)];
        rightLabel.textColor = [UIColor grayColor];
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.text = @"点击升级";
        rightLabel.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:rightLabel];
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 95;
    }
    else
    {
        return 75;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
