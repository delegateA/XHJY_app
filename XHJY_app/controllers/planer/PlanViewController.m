//
//  PlanViewController.m
//  XHJY_app
//
//  Created by admin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "PlanViewController.h"
#import "PlanCell.h"
#import "AddPlanViewController.h"
#import "PlanData.h"
#import "DetailsViewController.h"
#import "DetailDrugViewController.h"

@interface PlanViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *listTableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UIView *defaultNoDataView;//空的View

@end

@implementation PlanViewController


-(void)viewWillAppear:(BOOL)animated{
    self.dataArr=(NSMutableArray *)[PlanData MR_findAll];
    [self.listTableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    __weak typeof(self) weakSelf=self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        weakSelf.dataArr=[NSMutableArray arrayWithArray:[PlanData MR_findAll]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.listTableView reloadData];
            
        });
    });
    //UI布局
    [self initSubViews];
    NSLog(@"-----------------------%@",self.dataArr);
    
}
-(void)initSubViews{
    UIImageView *bgImageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImageView.image=[UIImage imageNamed:@"default_bg.png"];
    [self.view addSubview:bgImageView];
    
    self.listTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.listTableView.dataSource=self;
    self.listTableView.delegate=self;
    self.listTableView.rowHeight=120;
    [self.listTableView registerNib:[UINib nibWithNibName:@"PlanCell" bundle:nil]forCellReuseIdentifier:@"PlanCell"];
    self.listTableView.separatorColor=[[UIColor whiteColor]colorWithAlphaComponent:0.5];
    self.listTableView.backgroundColor=[UIColor clearColor];
    [self.listTableView setSeparatorColor:[UIColor colorWithRed:190/255.f green:190/255.f blue:190/255.f alpha:(0.7)]];
    [self.view addSubview:self.listTableView];
    [self initNaviBarView];
}
-(void)initNaviBarView{
    UIView *naviBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,64)];
    naviBarView.backgroundColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [self.view addSubview:naviBarView];
    //添加计划
    UIButton *addBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"btn_add_w_normal"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"btn_add_w_press"] forState:UIControlStateHighlighted];
    addBtn.frame=CGRectMake(SCREEN_WIDTH-40, 20, 40, 40);
    [naviBarView addSubview:addBtn];
    [addBtn addTarget:self action:@selector(addPlan:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 20, SCREEN_WIDTH-200, 44)];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.text=@"定制计划";
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:18.f];
    [self.view addSubview:titleLabel];
   
}
-(void)addPlan:(UIButton *)sender{
    AddPlanViewController *addPlan=[[AddPlanViewController alloc]init];
    __weak typeof(self) weakSelf=self;
    addPlan.block=^(){
         weakSelf.dataArr=(NSMutableArray *)[PlanData MR_findAll];
        [weakSelf.listTableView reloadData];
        NSLog(@"此处验证block是否成功");
    };
    [self.navigationController pushViewController:addPlan animated:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlanCell *cell=[tableView dequeueReusableCellWithIdentifier:@"PlanCell" forIndexPath:indexPath];
    PlanData *data=_dataArr[indexPath.row];
    NSString *str=data.iseating;
    NSLog(@"------------------------%@",str);
    if ([str isEqualToString:@"YES"]) {
        cell.DrugName.text=data.remark;
        cell.DrugPng.alpha=0;
    }else{
        cell.DrugName.text=data.medicine;
        cell.DrugPng.alpha=1;
    }
    cell.Name.text=data.name;
    cell.Time.text=data.time;
    cell.Times.text=data.times;
   // cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

   return UITableViewCellEditingStyleDelete;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
 return @"删除";

}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {   
        [self.dataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else{
        [self.dataArr addObject:@100];
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.dataArr.count - 1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PlanData *date=_dataArr[indexPath.row];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:date.remark,@"Remark",date.time,@"Time" ,date.medicine,@"Medicine",date.times,@"times",date.name,@"Name",date.iseating,@"isEating", nil];
    NSLog(@"=====%ld",(long)indexPath.row);
    if ([date.iseating isEqualToString:@"YES"]) {
    DetailsViewController *detail=[[DetailsViewController alloc]init];
    detail.dic=dic;
    [self.navigationController pushViewController:detail animated:NO];
    }else{
        DetailDrugViewController *deta=[[DetailDrugViewController alloc]init];
        deta.dic=dic;
        [self.navigationController pushViewController:deta animated:NO];
    }
    

}
@end
