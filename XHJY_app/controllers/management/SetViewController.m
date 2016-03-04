//
//  SetViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "SetViewController.h"
#import "TableViewCell.h"
#import "ChangeSecrectViewController.h"

@interface SetViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)UITableView *tableView;
@property(nonatomic,copy)NSArray *array;
@property(nonatomic,copy)UIButton *bottomBtn;
@end

@implementation SetViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topTittle.text = @"设 置";
    self.closeBtn.hidden = NO;
    [self.tableView reloadData];
    self.bottomBtn.enabled = YES;
    
}

- (NSArray *)array
{
    if (!_array) {
        _array = @[@"版本更新",@"修改密码",@"清除缓存"];
    }
    return _array;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 60);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]]forCellReuseIdentifier:@"TableViewCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (UIButton *)bottomBtn
{
    if (!_bottomBtn) {
        
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60);
        [_bottomBtn setBackgroundColor:RGBACOLOR(255, 0, 94, 1)];
        [_bottomBtn setTitle:@"退 出 登 录" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [self.view addSubview:_bottomBtn];
    }
    return _bottomBtn;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *cellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.leftLabel.text = self.array[indexPath.row];
    if (indexPath.row == 0) {
        cell.rightLabel.text = @"可更新至 V2.1";
    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        ChangeSecrectViewController *vc = [[ChangeSecrectViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
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
