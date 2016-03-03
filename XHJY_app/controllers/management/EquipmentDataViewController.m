//
//  EquipmentDataViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "EquipmentDataViewController.h"
#import "EquipmentDataTableViewCell.h"

@interface EquipmentDataViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EquipmentDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.topTittle.text = @"数据助手";
    self.backBtn.hidden = NO;
    [self setUIInterface];
}

- (void)setUIInterface
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"EquipmentDataTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EquipmentDataTableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cellidentifier = @"EquipmentDataTableViewCell";
    EquipmentDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    if (!cell) {
        cell = [[EquipmentDataTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellidentifier];
    }
    cell.topLabel.text = @"数据1";
    cell.bottomLabel.text = @"2009-08-07 14:22:22";
    
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
