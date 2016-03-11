//
//  InvitePersonViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/11.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "InvitePersonViewController.h"
#import "InvitePersonCell.h"

@interface InvitePersonViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)UITableView *tableVIew;
@property(nonatomic,copy)UIButton *leftBottomBtn;
@property(nonatomic,copy)UIButton *rightBottomBtn;
@end

@implementation InvitePersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backBtn.hidden = NO;
    [self.tableVIew reloadData];
    self.midView.hidden = NO;
    self.firstLabel.text = @"添加成功";
    self.secondLabel.text = @"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk";
    
    [self.tableVIew reloadData];
    [self.leftBottomBtn setTitle:@"关闭窗口" forState:UIControlStateNormal];
    [self.rightBottomBtn setTitle:@"确认邀请" forState:UIControlStateNormal];
}


- (UITableView *)tableVIew
{
    if (!_tableVIew) {
        _tableVIew = [[UITableView alloc]initWithFrame:CGRectMake(0, 125, SCREEN_WIDTH, SCREEN_HEIGHT - 125 - 60)];
        _tableVIew.delegate = self;
        _tableVIew.dataSource = self;
        _tableVIew.rowHeight = 80;
        _tableVIew.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableVIew registerClass:[InvitePersonCell class] forCellReuseIdentifier:@"InvitePersonCell"];
        [self.view addSubview:_tableVIew];
        
    }
    return _tableVIew;
}


- (UIButton *)leftBottomBtn
{
    if (!_leftBottomBtn) {
        
        _leftBottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _leftBottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH / 2, 60);
        [_leftBottomBtn setBackgroundColor:[Tools colorWithHexString:@"#bebebf" withAlpha:1]];
        [_leftBottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_leftBottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_leftBottomBtn addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
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
        [_rightBottomBtn addTarget:self action:@selector(invitePerson:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_rightBottomBtn];
    }
    return _rightBottomBtn;
}


- (void)closeView:(UIButton *)sender
{
    
}

- (void)invitePerson:(UIButton *)sender
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"InvitePersonCell";
    InvitePersonCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[InvitePersonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.label.text = @"AAAA";
    cell.labelSmall.text = @"BBBBBBBBBB";
    cell.logoIMageVIew.backgroundColor = [UIColor redColor];
    if (indexPath.row == 2) {
        
        cell.btn.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    }
    
    return cell;
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
