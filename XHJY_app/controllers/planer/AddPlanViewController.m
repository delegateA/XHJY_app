//
//  AddPlanViewController.m
//  XHJY_app
//
//  Created by admin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AddPlanViewController.h"
#import "ACPScrollMenu.h"
#import "TimeTableViewCell.h"
#import "ClassHeaderTableViewCell.h"
#import "ClassTableViewCell.h"
#import "TimesTableViewCell.h"
#import "RemarkTableViewCell.h"
#import "PlanData.h"

//#import "UIView+SDAutoLayout.h"
//#import "TableViewCell.h"
#import "SelectViewController.h"
#import "HZQDatePickerView.h"
#import "ZZHDateView.h"

#define REMARK_TAG 50
#define TIMES_YES_TAG 600
#define TIME_TAG 100
#define LIST_TABLE_TAG 123
@interface AddPlanViewController ()<ACPScrollDelegate,UITableViewDataSource,UITableViewDelegate,HZQDatePickerViewDelegate,ZZHDatePickerViewDelegate>
{
    BOOL isEatting;
    NSMutableArray *_array;
    NSArray *Arr;
    NSString *_TimeStr;
    NSString *_RemarkStr;
    NSString *_timesStr;
    NSMutableString *_DrugStr;
    NSString *_name;
    
    HZQDatePickerView *_pikerView;
    ZZHDateView *_DrugPikerView;
}
@property(nonatomic,strong)ACPScrollMenu *acpItem;
@property(nonatomic,strong)UITableView *listTableView;

@end

@implementation AddPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
    // Do any additional setup after loading the view.
    [self initNaviBarView];
    [self initSubViews];
    
    //创造数据
    _name=[NSString new];
    _array=[[NSMutableArray alloc]init];
    Arr=[NSArray array];
    Arr=@[@"1",@"2",@"3"];
    for (int i=0; i<3; i++) {
        NSString *str=@"占位用的";
        [_array addObject:str];
    }
    isEatting=NO;
  
}
-(void)initNaviBarView{
    UIView *naviBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,64)];
    naviBarView.backgroundColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [self.view addSubview:naviBarView];
    //添加计划
    UIButton *addBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"btn_close_press"] forState:UIControlStateHighlighted];
    addBtn.frame=CGRectMake(0, 20, 40, 40);
    [naviBarView addSubview:addBtn];
    [addBtn addTarget:self action:@selector(delePlan:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 20, self.view.frame.size.width-200, 44)];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.text=@"添加计划";
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:18.f];
    [self.view addSubview:titleLabel];
    
}
-(void)initSubViews{
    self.acpItem=[[ACPScrollMenu alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 64)];
    self.acpItem.backgroundColor=[UIColor colorWithRed:(248/255.f) green:248/255.f blue:249/255.f alpha:1];
    [self.view addSubview:self.acpItem];
   NSArray *arrName=@[@"用餐",@"用药",@"胰岛素",@"运动"];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 1; i < 5; i++) {
            //Set the items
        ACPItem *item=[[ACPItem alloc]initACPItem:[UIColor colorWithRed:(248/255.f) green:248/255.f blue:248/255.f alpha:1] andLabel:[arrName objectAtIndex:i-1]];
        
        [item setHighlightedBackground:[UIImage imageNamed:@"bg.png"] textColorHighlighted:[UIColor whiteColor]];
        item.layer.borderWidth=1;
        item.layer.borderColor=[UIColor colorWithRed:182/255.f green:182/255.f blue:182/255.f alpha:0.7].CGColor;
            
            [array addObject:item];
        }
    
        
        [self.acpItem setUpACPScrollMenu:array];
        
        //We choose an animation when the user touch the item (you can create your own animation)
        [self.acpItem setAnimationType:ACPZoomOut];
        
         self.acpItem.delegate = self;
    self.listTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 128, SCREEN_WIDTH, SCREEN_HEIGHT-168)];
    [self.view addSubview:self.listTableView];
    self.listTableView.delegate=self;
    self.listTableView.dataSource=self;
    self.listTableView.tag=LIST_TABLE_TAG;
    [self.listTableView registerNib:[UINib nibWithNibName:@"TimeTableViewCell" bundle:nil] forCellReuseIdentifier:@"TimeTableViewCell"];
    [self.listTableView registerNib:[UINib nibWithNibName:@"ClassHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"ClassHeaderTableViewCell"];
    [self.listTableView registerNib:[UINib nibWithNibName:@"TimesTableViewCell" bundle:nil] forCellReuseIdentifier:@"TimesTableViewCell"];
    [self.listTableView registerNib:[UINib nibWithNibName:@"ClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"ClassTableViewCell"];
    [self.listTableView registerNib:[UINib nibWithNibName:@"RemarkTableViewCell" bundle:nil] forCellReuseIdentifier:@"RemarkTableViewCell"];
    
    //底部创建计划
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, SCREEN_HEIGHT-TABBAR_HEIGHT, SCREEN_WIDTH, TABBAR_HEIGHT);
    [button setTitle:@"创建计划" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(BuildingPlan:) forControlEvents:UIControlEventTouchUpInside];
    
    
  
}
-(void)delePlan:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)scrollMenu:(ACPScrollMenu *)menu didSelectIndex:(NSInteger)selectedIndex{
    NSLog(@"%ld",(long)selectedIndex);
    if ((long)selectedIndex==0 ||(long)selectedIndex==3) {
        isEatting=YES;
        
       
    }else{
        isEatting=NO;
    }
    if ((long)selectedIndex==0) {
        _name=@"用餐";
    }else if((long)selectedIndex==1){
      _name=@"用药";
    }else if((long)selectedIndex==2){
      _name=@"胰岛素";
    }else{
      _name=@"运动";
    }
    [self.listTableView reloadData];
    
}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 3;

//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   
    if (isEatting==NO) {
        return _array.count;
    }else{
        return Arr.count;
    }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    if (tableView.tag!=123) {
//        static NSString *ce = @"cell";
//        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ce];
//        if (cell == nil) {
//            cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ce];
//        }
//        cell.lab.text = TimeArray[indexPath.row];
//        if ([chooseArray containsObject:cell.lab.text]) {
//            cell.selectBt.image = [UIImage imageNamed:@"evaluation_selected"];
//        }else {
//            cell.selectBt.image = [UIImage imageNamed:@"evaluation_unselected"];
//        }
//        return cell;
//    }else{
    
    if(isEatting==NO) {
    if (indexPath.row==0) {
        TimeTableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:@"TimeTableViewCell"];
        if(cell1==nil){
            cell1=[[TimeTableViewCell alloc]init];
        }
        cell1.selectionStyle=UITableViewCellSelectionStyleNone;
        cell1.GetTime.tag=TIME_TAG;
        return cell1;
    }else if(indexPath.row==1){
        ClassHeaderTableViewCell *cell2=[tableView dequeueReusableCellWithIdentifier:@"ClassHeaderTableViewCell"];
        if (cell2==nil) {
            cell2=[[ClassHeaderTableViewCell alloc]init];
        }
        __weak typeof(self) weakSelf=self;
        cell2.block=^(){
            [weakSelf addCell];
        };
        cell2.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell2;
    
    }else if(indexPath.row==_array.count-1){
        TimesTableViewCell *cell4=[tableView dequeueReusableCellWithIdentifier:@"TimesTableViewCell"];
        if (cell4==nil) {
            cell4=[[TimesTableViewCell alloc]init];
        }
        cell4.selectionStyle=UITableViewCellSelectionStyleNone;
        cell4.TimesStr.tag=100+_array.count-1;
        __weak typeof(self) weakSelf=self;
        cell4.block=^(){
            [weakSelf changeTimes];
        };
        return cell4;
    
    
    }else{
        ClassTableViewCell *cell3=[tableView dequeueReusableCellWithIdentifier:@"ClassTableViewCell"];
        if (cell3==nil) {
            cell3=[[ClassTableViewCell alloc]init];
        }
        cell3.selectionStyle=UITableViewCellSelectionStyleNone;
        __weak typeof(self) weakSelf=self;
        cell3.block1=^(){
            [weakSelf delegateCell];
        };
        cell3.Name.tag=500+indexPath.row;
        cell3.Name.placeholder=_array[indexPath.row+1];
        return cell3;
    }
    }else{
        if (indexPath.row==0) {
        TimeTableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:@"TimeTableViewCell"];
        if(cell1==nil){
            cell1=[[TimeTableViewCell alloc]init];
        }
        cell1.selectionStyle=UITableViewCellSelectionStyleNone;
            cell1.GetTime.tag=TIME_TAG;
            return cell1;
        }else if(indexPath.row==1){
            RemarkTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"RemarkTableViewCell"];
            if (cell==nil) {
                cell=[[RemarkTableViewCell alloc]init];
            }
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.RemarkStr.tag=REMARK_TAG;
            return cell;
        }else{
            TimesTableViewCell *cell4=[tableView dequeueReusableCellWithIdentifier:@"TimesTableViewCell"];
            if (cell4==nil) {
                cell4=[[TimesTableViewCell alloc]init];
            }
            cell4.selectionStyle=UITableViewCellSelectionStyleNone;
            cell4.TimesStr.tag=TIMES_YES_TAG;
            return cell4;
        
        }
       
    
    }
   // }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isEatting==NO) {
        if (indexPath.row==0) {
                 return 74;
        }else if (indexPath.row==_array.count-1){
    
                 return 74;
        }else{
                 return 54;
        }
    }else{
        return 74;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    if (indexPath.row==0) {
        NSLog(@"..........");
        [self setupDateView:DateTypeOfStart];
        
    }
}

- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
    //    [_pikerView.datePickerView setMinimumDate:[NSDate date]];
    [self.view addSubview:_pikerView];
    
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"%d - %@", type, date);
    UITextField *text=[self.view viewWithTag:TIME_TAG];
    
    switch (type) {
        case DateTypeOfStart:
            text.placeholder=date;
            break;
            
        default:
            break;
    }
}

-(void)addCell{
    /**
     *  弹出选择视图
     */   _DrugPikerView = [ZZHDateView instanceDatePickerView];
    _DrugPikerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT + 20);
    [_DrugPikerView setBackgroundColor:[UIColor clearColor]];
    _DrugPikerView.delegate = self;
    [self.view addSubview:_DrugPikerView];
    //[_array addObject:@"加一个"];

}
-(void)delegateCell{
    NSLog(@"...........");
    [_array removeLastObject];
    [self.listTableView reloadData];

}

-(void)BuildingPlan:(UIButton *)sender{
   //创建成功 是否保存？？？
    //药物版本的
    _TimeStr=[NSString new];
    _timesStr=[NSString new];
    _DrugStr=[NSMutableString new];
    _RemarkStr=[NSString new];
    if (isEatting==NO) {
        
    UITextField *text=[self.view viewWithTag:TIME_TAG];
    _TimeStr=text.placeholder;
    UILabel *label=[self.view viewWithTag:100+_array.count-1];
    _timesStr=label.text;
    //NSLog(@"----%@----%@",_timesStr,_TimeStr);
    for (int i=2; i<_array.count-1; i++) {
        UITextField *text=[self.view viewWithTag:500+i];
        [_DrugStr appendFormat:@"%@ ",text.placeholder];
    }
        //NSLog(@"此处是药物集合字符串--%@--",_DrugStr);
        _RemarkStr=@"nil";
    }else{
        UITextField *text=[self.view viewWithTag:TIME_TAG];
        _TimeStr=text.placeholder;
        UILabel *label=[self.view viewWithTag:TIMES_YES_TAG];
        _timesStr=label.text;
        UITextField *remarktext=[self.view viewWithTag:REMARK_TAG];
        _RemarkStr=remarktext.text;
        _DrugStr=[NSMutableString stringWithFormat:@"nil%@",nil];
    
    
    }
    NSLog(@"%@===%@===%@===%@",_timesStr,_TimeStr,_RemarkStr,_DrugStr);
    PlanData *addData=[PlanData MR_createEntity];
    addData.time=_TimeStr;
    addData.times=_timesStr;
    addData.remark=_RemarkStr;
    addData.medicine=_DrugStr;
    if ([_name isEqualToString:@""]) {
        addData.name=@"用药";
    }else{
        addData.name=_name;
    }
    if (isEatting==YES) {
       addData.iseating=@"YES";
    }else{
       addData.iseating=@"NO";
    }
    if(self.block){
        self.block();
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)changeTimes{
      NSLog(@"选择时间");
    SelectViewController *select=[[SelectViewController alloc]init];
    select.block=^(NSString *str){
        UILabel *label=[self.view viewWithTag:100+_array.count-1];
        label.text=str;
    
    };
    [self.navigationController pushViewController:select animated:NO];
    
//    TimeArray = [NSMutableArray arrayWithObjects:@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日",nil];
//    
//    backgroundView = [[UIView alloc]initWithFrame:self.view.bounds];
//    backgroundView.backgroundColor = [UIColor whiteColor];
//    [UIView animateWithDuration:0.2 animations:^{
//        backgroundView.backgroundColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.62];
//    }];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(disappearView)];
//    [backgroundView addGestureRecognizer:tap];
//    [self.view addSubview:backgroundView];
//    
//    chooseView = [[UIView alloc]initWithFrame:CGRectMake(60, 120,self.view.frame.size.width-120,self.view.frame.size.height-280)];
//    chooseView.backgroundColor = [UIColor whiteColor];
//    [backgroundView addSubview:chooseView];
//    
//    
//    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 15,130, 15)];
//    lab.text = @"请添加您的健康时间";
//    lab.textColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1];
//    lab.font = [UIFont systemFontOfSize:12];
//    [chooseView addSubview:lab];
//    
//    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    bt1.frame = CGRectMake(chooseView.width-65, chooseView.height-35, 60, 30);
//    [bt1 setTitleColor:[UIColor colorWithRed:24/255.0 green:180/255.0 blue:237/255.0 alpha:1] forState:UIControlStateNormal];
//    [bt1 setTitle:@"确定" forState:UIControlStateNormal];
//    bt1.titleLabel.font = [UIFont systemFontOfSize:16];
//    [bt1 addTarget:self action:@selector(bt1:) forControlEvents:UIControlEventTouchUpInside];
//    [chooseView addSubview:bt1];
//    
//    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    bt2.frame = CGRectMake(chooseView.width-130, chooseView.height-35, 60, 30);
//    [bt2 setTitleColor:[UIColor colorWithRed:24/255.0 green:180/255.0 blue:237/255.0 alpha:1] forState:UIControlStateNormal];
//    [bt2 setTitle:@"取消" forState:UIControlStateNormal];
//    bt2.titleLabel.font = [UIFont systemFontOfSize:16];
//    [bt2 addTarget:self action:@selector(bt2:) forControlEvents:UIControlEventTouchUpInside];
//    [chooseView addSubview:bt2];
//    
//    
//    
//    tab = [[UITableView alloc]initWithFrame:CGRectMake(0,40, chooseView.width,chooseView.height-80)];
//    //    tab.backgroundColor = [UIColor redColor];
//    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tab.delegate = self;
//    tab.dataSource = self;
//    [chooseView addSubview:tab];
//    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
//    [tab addGestureRecognizer:tap1];
//    [tap1 addTarget:self action:@selector(clickTableView:)];
//
}


//- (void)clickTableView:(UITapGestureRecognizer *)tap
//{
//    
//    CGPoint point = [tap locationInView:tab];
//    NSIndexPath *indexPath = [tab indexPathForRowAtPoint:point];
//    if (indexPath == nil) {
//        return;
//    }
//    if ([chooseArray containsObject:TimeArray[indexPath.row]]) {
//        [chooseArray removeObject:TimeArray[indexPath.row]];
//    }else {
//        [chooseArray addObject:TimeArray[indexPath.row]];
//    }
//    
//    [tab reloadData];
//}
//
//
//
//-(void)keyboardShow:(NSNotification *)notification
//{
//    //    backgroundView.userInteractionEnabled = NO;
//    CGRect keyBoardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    NSLog(@"%f",keyBoardFrame.size.height);
//    [UIView animateWithDuration:0.2 animations:^{
//        addView.frame = CGRectMake(20, self.view.bounds.size.height-keyBoardFrame.size.height-130, self.view.width-40, 120);
//    }];
//    
//}
//
//-(void)keyboardHide:(NSNotification *)notification
//{
//    [UIView animateWithDuration:0.2 animations:^{
//        addView.frame = CGRectMake(20, (self.view.height-120)/2, self.view.width-40, 120);
//    }];
//}
//
//
//-(void)disappearView{
//    if (tapView==YES) {
//        [backgroundView removeFromSuperview];
//        [chooseArray removeAllObjects];
//    }
//}
//-(void)bt1:(UIButton *)bt
//{    NSMutableArray *ARR=[NSMutableArray new];
//    NSMutableArray *ARR1=[NSMutableArray new];
//    for (NSString *str in chooseArray) {
//        if ([str isEqualToString:@"周六"]) {
//            [ARR addObject:str];
//        }else if ([str isEqualToString:@"周日"]){
//            [ARR addObject:str];
//        }else{
//            [ARR1 addObject:str];
//        }
//    }
//    UILabel *label=[self.view viewWithTag:100+_array.count-1];
//    NSLog(@"确定");
//    NSLog(@"%@",[chooseArray lastObject]);
//    if (ARR.count==2 && chooseArray.count==2) {
//        label.text=@"每天";
//    }else if(ARR1.count==5 && chooseArray.count==5){
//     label.text=@"工作日";
//    }else{
//        NSMutableString *str=[NSMutableString new];
//        for (NSString *str1 in chooseArray) {
//            [str appendString:[NSString stringWithFormat:@"%@,",str1]];
//        }
//        label.text=str;
//    }
//    
//    
//
//    [self disappearView];
//    
//    
//}
//-(void)bt2:(UIButton *)bt
//{
//    NSLog(@"取消");
//    [self disappearView];
//    [TimeArray removeAllObjects];
//}

#define mark  ZZHDateViewPickerDelegate
-(void)getSelectDate:(NSString *)date{
    [_array addObject:date];
    [self.listTableView reloadData];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
