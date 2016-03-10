//
//  AlarmViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AlarmViewController.h"
#import "AlarmViewTableViewCell.h"
#import "AlarmDetailViewController.h"

@interface AlarmViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)UITableView *tableView;
@end

@implementation AlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUIinterface];
}

- (void)setUIinterface
{
    self.baseView.backgroundColor = [Tools colorWithHexString:@"#ff2e63" withAlpha:1];
    self.closeBtn.hidden = NO;
    self.topTittle.text = @"告警统计";
    [self.tableView reloadData];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 45;
        [_tableView registerClass:[AlarmViewTableViewCell class] forCellReuseIdentifier:@"AlarmViewTableViewCell"];
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellidentifier = @"AlarmViewTableViewCell";
    AlarmViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (!cell) {
        cell = [[AlarmViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    
    cell.leftLabel.text = @"房形早博";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"3 次"];
    [str addAttribute:NSForegroundColorAttributeName value:[Tools colorWithHexString:@"#afafb0" withAlpha:1] range:NSMakeRange(2,1)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(2, 1)];
    cell.rightLabel.attributedText = str;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = [Tools heightForString:@"您的身体出现--------------------------的问题" andWidth:SCREEN_WIDTH - (35 +20 + 25)];
    
    return 110 - 30 + height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110)];
    view.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *typeView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 33, 10, 10)];
    
    //#ff3266       //#ffbf15        //#fff000
    typeView.backgroundColor = [Tools colorWithHexString:@"#ff3266" withAlpha:1];
    typeView.layer.cornerRadius = 5;
    [view addSubview:typeView];
    
    
    UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(35 + 20, 30, 100, 17)];
    leftLabel.text = @"红色警告";
    leftLabel.font = [UIFont systemFontOfSize:18];
    [view addSubview:leftLabel];
    
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 225, 30, 200, 17)];
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
    timeLabel.text = @"2016 - 08 - 24 14:00:00";
    [view addSubview:timeLabel];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(35 + 20, 30 + 17 + 12, SCREEN_WIDTH - (35 +20 + 25), 30)];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
    label.text = @"您的身体出现--------------------------的问题";
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGFloat height = [Tools heightForString:@"您的身体出现--------------------------的问题" andWidth:SCREEN_WIDTH - (35 +20 + 25)];
    label.frame = CGRectMake(35 + 20, 30 + 17 + 12, SCREEN_WIDTH - (35 +20 + 25), height);
    
    [view addSubview:label];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    AlarmDetailViewController *vc = [[AlarmDetailViewController alloc]init];
    [self.navigationController pushViewController:vc  animated:YES];
    
    
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
