//
//  ManagerFilesViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ManagerFilesViewController.h"
#import "HealthFileTableViewCell.h"
#import "CreatFileViewController.h"
#import "FileDetailViewController.h"

@interface ManagerFilesViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ManagerFilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.topTittle.text = @"健康档案";
    self.addBtn.hidden = NO;
    self.closeBtn.hidden = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"HealthFileTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HealthFileTableViewCell"];
    
}

- (void)rightBtnClicked:(UIButton *)sender
{
    CreatFileViewController *vc = [[CreatFileViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *cellIdentifier = @"HealthFileTableViewCell";
    HealthFileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HealthFileTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.monthLabel.text = @"04-05";
    cell.yearLabel.text = @"2016";
    cell.messageLabel.text = @"高血压";
    cell.typeLabel.text = @"确诊";
    cell.typeLabel.backgroundColor = [UIColor lightGrayColor];
    cell.hospitialLabel.text = @"华西医院";
    if (indexPath.row == 3) {
        
        for (int i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(cell.messageLabel.frame.origin.x + 40 * i, 80, 30, 30)];
            imageView.layer.cornerRadius = 15;
            imageView.clipsToBounds = YES;
            imageView.backgroundColor = [UIColor blackColor];
            [cell.contentView addSubview:imageView];
        }
        
    }
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        
        return 140;
    }
    else{
        return 90;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FileDetailViewController *vc = [[FileDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
