//
//  ManagePersonViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ManagePersonViewController.h"
#import "GxqAlertView.h"
#import "HorizontalMenu.h"
#import "FamilyListTableViewCell.h"

@interface ManagePersonViewController ()<HorizontalMenuDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)UIView *topView;
@property(nonatomic,copy)UITableView *tableView;
@property(nonatomic,copy)UIButton *bottomBtn;
@property(nonatomic,assign)NSInteger index;
@end

@implementation ManagePersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topTittle.text = @"家人";
    self.closeBtn.hidden = NO;
    self.topView.hidden = NO;
    self.bottomBtn.hidden = NO;
    self.index = 0;
    [self.tableView reloadData];
}

- (UIView *)topView
{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 61)];
        _topView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [self.view addSubview:_topView];
        
        HorizontalMenu *menu = [[HorizontalMenu alloc]initWithFrame:CGRectMake(0, 17, SCREEN_WIDTH, 44) withTitles:@[@"我关注的",@"关注我的"]];
        menu.delegate = self;
        [_topView addSubview:menu];
        
    }
    return _topView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 125, SCREEN_WIDTH, SCREEN_HEIGHT - 125 - 60)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"FamilyListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"FamilyListTableViewCell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (UIButton *)bottomBtn
{
    if (!_bottomBtn) {
        
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60);
        [_bottomBtn setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
        [_bottomBtn setTitle:@"邀 请 关 注" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [self.view addSubview:_bottomBtn];
    }
    return _bottomBtn;
}


#pragma mark ---------------HorizontalMenuDelegate

- (void)clieckButton:(UIButton *)button;
{
    self.index = button.tag;
    [self.tableView reloadData];
}


#pragma mark ------------------UITableViewDelegate/DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"FamilyListTableViewCell";
    FamilyListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[FamilyListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.headIMage.backgroundColor = [UIColor redColor];
    cell.nameLabel.text = @"八戒";
    if (self.index == 0) {
        
        cell.bigLabel.hidden = YES;
        cell.smallLabel.hidden = NO;
        cell.typeIMage.hidden = NO;
        cell.typeIMage.image = LOADIMAGE(@"icon_target_gr.png", @"");
        cell.smallLabel.text = @"心电健康";
    }
    else
    {
        cell.bigLabel.hidden = NO;
        cell.smallLabel.hidden = YES;
        cell.typeIMage.hidden = YES;
        cell.bigLabel.text = @"血糖健康";
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 99;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
