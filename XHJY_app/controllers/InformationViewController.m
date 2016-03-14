//
//  InformationViewController.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/11.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "InformationViewController.h"
#import "InformationCell.h"
#import "InformationUpCell.h"
#import "NoFollowViewController.h"
#import "ZZDatePickerView.h"
#import "ZDateView.h"
#import "ZHightView.h"

@interface InformationViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_oneArr;
    
    ZDateView *_weightPikerView;
    ZHightView *_hightPockerView;

}
@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self initNaviBarView];
    [self createViews];
}
-(void)initNaviBarView{
    UIView *naviBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,64)];
    naviBarView.backgroundColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [self.view addSubview:naviBarView];
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 20, self.view.frame.size.width-200, 44)];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.text=@"添加计划";
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:18.f];
    [self.view addSubview:titleLabel];
    
}
-(void)createViews{
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-44)];
    [self.view addSubview:tableView];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.rowHeight=70;
    [tableView registerNib:[UINib nibWithNibName:@"InformationCell" bundle:nil] forCellReuseIdentifier:@"InformationCell"];
     [tableView registerNib:[UINib nibWithNibName:@"InformationUpCell" bundle:nil] forCellReuseIdentifier:@"InformationUpCell"];
    _oneArr=@[@"性别",@"年龄",@"身高",@"体重",@"血型"];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, SCREEN_HEIGHT-44, SCREEN_WIDTH, 44);
    [self.view addSubview:button];
    button.backgroundColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [button setTitle:@"上传资料" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sureBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        InformationUpCell *cell=[tableView dequeueReusableCellWithIdentifier:@"InformationUpCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        InformationCell*cell=[tableView dequeueReusableCellWithIdentifier:@"InformationCell"];
        cell.NameIF.tag=44+indexPath.row;
        cell.Name.text=_oneArr[indexPath.row-1];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==2) {
        [self setupDateView];
    }else if(indexPath.row==4){
        [self setupWeightView];
    }else if(indexPath.row==3){
        [self setupHightView];
    }else if(indexPath.row==1   ){
        [self setupSexView];
    
    }
    
}
-(void)setupDateView{
    ZZDatePickerView *pikerView = [[ZZDatePickerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withTime:[NSDate date]];
    pikerView.calendarBlock = ^(NSInteger age){
        
        /**
         *  写选择后的方法
         */
        
    };
    [self.view addSubview:pikerView];

}
-(void)setupWeightView{
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 150; i++) {
        [array addObject:[[NSString alloc]initWithFormat:@"%dKg",i]];
    }
    
    ZHightView  *pikerView = [[ZHightView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withTitle:@"设置体重" withDataSource:array];
    
    pikerView.calendarBlock = ^(NSInteger message)
    {
        NSLog(@"%ld",message);
        /**
         *  写选择后的方法
         */
    };
    [self.view addSubview:pikerView];
    [pikerView show];
    
}
-(void)setupHightView{
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 150; i++) {
        [array addObject:[[NSString alloc]initWithFormat:@"%dcm",i]];
    }
    
    ZHightView  *pikerView = [[ZHightView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withTitle:@"设置身高" withDataSource:array];
    
    pikerView.calendarBlock = ^(NSInteger message)
    {
        NSLog(@"%ld",message);
        /**
         *  写选择后的方法
         */
    };
    [self.view addSubview:pikerView];
    [pikerView show];
}

-(void)setupSexView{
    ZDateView *weightPikerView = [[ZDateView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withDataArray:@[@"选择性别",@"男",@"女",@"保密"]];
    [self.view addSubview:weightPikerView];
    weightPikerView.messageBlock = ^(NSInteger index)
    {
        /**
         *  写选择后的方法
         */
    };
    [weightPikerView show];
}

- (void)getSelectDate:(NSString *)date {
    UILabel *label=[self.view viewWithTag:46];
    label.text = date;
    
    
}
-(void)getSelectWeight:(NSString *)weight{
    UILabel *label=[self.view viewWithTag:48];
    label.text=weight;

}
-(void)getSelectHight:(NSString *)hight{
    UILabel *label=[self.view viewWithTag:47];
    label.text=hight;

}
-(void)getSelectSex:(NSString *)Sex{
    UILabel *label=[self.view viewWithTag:45];
    label.text=Sex;
}
-(void)sureBtn:(UIButton *)sender{
    NSArray *array=self.navigationController.viewControllers;
    [self.navigationController popToViewController:[array objectAtIndex:1]  animated:YES];


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
