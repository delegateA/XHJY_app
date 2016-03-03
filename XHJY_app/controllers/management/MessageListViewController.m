//
//  MessageListViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "MessageListViewController.h"
#import "MessageListTableViewCell.h"
#import "MessageListModel.h"
#import "MessageDetailViewController.h"

@interface MessageListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *array;
@end

@implementation MessageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topTittle.text = @"系统消息";
    self.closeBtn.hidden = NO;
    [self.tableView reloadData];
    
}

- (NSMutableArray *)array
{
    if (!_array) {
        
        
        MessageListModel *user = [[MessageListModel alloc] init];
        [user setType:@"系统"];
        [user setTm:@"AA"];
        [user setTime:@"09:33"];
        [user setDetailText:@"2016-03-02 15:33:28.446 XHJY_app[1850:67655] Unknown class HomeViewController in Interface Builder file."];
        
        MessageListModel *user2 = [[MessageListModel alloc] init];
        [user2 setType:@"邀请"];
        [user2 setTm:@"AA"];
        [user2 setTime:@"09:33"];
        [user2 setDetailText:@"2016-03-02 15:33:28.446 "];
        
        _array = [[NSMutableArray alloc]init];
        [_array addObject:user];
        [_array addObject:user2];
        
    }
    return _array;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 65, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //指定cellIdentifier为自定义的cell
    static NSString *CellIdentifier = @"MessageListTableViewCell";
    //自定义cell类
    MessageListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[MessageListTableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
        
    }
    
    MessageListModel *model = self.array[indexPath.row];
    if ([model.type isEqualToString: @"系统"]) {
        cell.pointView.backgroundColor = RGBCOLOR(163, 164, 165);
    }
    cell.nameLabel.text = model.type;
    cell.timeLabel.text = model.time;
    cell.tmLabel.text = model.tm;
    [cell setIntroductionText:model.detailText];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageListTableViewCell *cell = (MessageListTableViewCell *)[self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MessageDetailViewController *vc = [[MessageDetailViewController alloc]init];
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
