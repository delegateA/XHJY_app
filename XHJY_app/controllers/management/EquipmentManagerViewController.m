//
//  EquipmentManagerViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "EquipmentManagerViewController.h"
#import "EquipmentTableViewCell.h"
#import "EquipmentMessageViewController.h"
#import "EquipmentDataViewController.h"

@interface EquipmentManagerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EquipmentManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.topTittle.text = @"设备管理";
    self.closeBtn.hidden = NO;
    self.addBtn.hidden = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"EquipmentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EquipmentTableViewCell"];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  跳转到设备详情
 *
 *  @param sender
 */
- (void)pushToDetail:(UIButton *)sender
{
    EquipmentMessageViewController *vc = [[EquipmentMessageViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  跳转到数据信息
 *
 *  @param senser
 */

- (void)pushTomessage:(UIButton *)senser
{
    EquipmentDataViewController *vc = [[EquipmentDataViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"EquipmentTableViewCell";
    EquipmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[EquipmentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.nameLabel.text = @"心电设备";
    cell.messageBtn.tag = 100 + 10 * indexPath.section + indexPath.row;
    cell.detailBtn.tag = 200 + 10 * indexPath.section + indexPath.row;
    [cell.messageBtn addTarget:self action:@selector(pushTomessage:) forControlEvents:UIControlEventTouchUpInside];
    [cell.detailBtn addTarget:self action:@selector(pushToDetail:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 100, 70)];
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [Tools colorWithHexString:@"#222222" withAlpha:1];
    label.text = @"心电设备";
    [view addSubview:label];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.center = CGPointMake(SCREEN_WIDTH - 25 - 12.5, 35);
    btn.bounds = CGRectMake(0, 0, 25, 25);
    btn.layer.cornerRadius = 12.5;
    [btn setBackgroundImage:ImageNamed(@"btn_delete_red_normal") forState:UIControlStateNormal];
    [btn setBackgroundImage:ImageNamed(@"btn_delete_red_press") forState:UIControlStateHighlighted];
    btn.clipsToBounds = YES;
    btn.tag = section;
    [view addSubview:btn];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 25)];
    view.backgroundColor = [UIColor whiteColor];
    
    return view;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70;
}
/**
 *  删除设备
 *
 *  @return
 */

- (void)deleteEquipment:(UIButton *)sender
{
    
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
