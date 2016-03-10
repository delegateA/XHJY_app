//
//  SelectViewController.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "SelectViewController.h"
#import "SelectTableViewCell.h"

@interface SelectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)NSMutableArray *arrayED;
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNaviBarView];
    [self createView];
}
-(void)initNaviBarView{
    UIView *naviBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,64)];
    naviBarView.backgroundColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [self.view addSubview:naviBarView];
    //添加计划
    UIButton *addBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"btn_back_normal"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"btn_back_press"] forState:UIControlStateHighlighted];
    addBtn.frame=CGRectMake(0, 20, 40, 40);
    [naviBarView addSubview:addBtn];
    [addBtn addTarget:self action:@selector(delePlan:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 20, self.view.frame.size.width-200, 44)];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.text=@"重复";
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:18.f];
    [self.view addSubview:titleLabel];
    
}
-(void)delePlan:(UIButton *)sender{
    NSString *labrl=[NSString new];
    NSMutableArray *ARR=[NSMutableArray new];
        NSMutableArray *ARR1=[NSMutableArray new];
        for (NSString *str in self.arrayED) {
            if ([str isEqualToString:@"周六"]) {
                [ARR addObject:str];
            }else if ([str isEqualToString:@"周日"]){
                [ARR addObject:str];
            }else{
                [ARR1 addObject:str];
            }
        }
    
        if (ARR.count==2 && self.arrayED.count==2) {
            labrl=@"周末";
        }else if(ARR1.count==5 && self.arrayED.count==5){
         labrl=@"工作日";
        }else if (ARR.count && self.arrayED.count==7){
         labrl=@"每天";
        }
        else{
            NSMutableString *str=[NSMutableString new];
            for (NSString *str1 in self.arrayED) {
                [str appendString:[NSString stringWithFormat:@"%@,",str1]];
            }
            labrl=str;
        }
    if (self.block) {
        self.block(labrl);
    }
    
    NSLog(@"选择完成");
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)createView{
    _arr=@[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    
    self.arrayED=[NSMutableArray new];
    self.table=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    [self.view addSubview:self.table];
    self.table.delegate=self;
    self.table.dataSource=self;
    self.table.rowHeight=60;
    [self.table registerNib:[UINib nibWithNibName:@"SelectTableViewCell" bundle:nil] forCellReuseIdentifier:@"SelectTableViewCell"];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SelectTableViewCell"];
    cell.dataLabel.text=_arr[indexPath.row];
    cell.tag=100+indexPath.row;
    cell.selectLabel.text=@"";
    cell.isSelect=NO;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectTableViewCell *cell=[self.view viewWithTag:100+indexPath.row];
    if (cell.isSelect==YES) {
        cell.isSelect=NO;
    }else{
        cell.isSelect=YES;
    }
    if (cell.isSelect==YES) {
        cell.selectLabel.text=@"√";
        cell.selectLabel.textColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [self.arrayED addObject:cell.dataLabel.text];
    }else{
     cell.selectLabel.text=@"--";
        [self.arrayED removeObject:cell.dataLabel.text];
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
