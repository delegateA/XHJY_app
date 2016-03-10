//
//  DetailDrugViewController.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "DetailDrugViewController.h"
#import "TimeTableViewCell.h"
#import "ClassHeaderTableViewCell.h"
#import "ClassTableViewCell.h"
#import "TimesTableViewCell.h"

@interface DetailDrugViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *DrugView;
@property(nonatomic,strong)NSMutableArray *array;
@end

@implementation DetailDrugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNaviBarView];
    [self createView];
    self.view.backgroundColor=[UIColor whiteColor];
    NSString *d=[self.dic objectForKey:@"isEating"];
    NSLog(@"%%%%%%%%%@",d);
    _array=[[[self.dic objectForKey:@"Medicine"] componentsSeparatedByString:@";"] copy];
    NSLog(@"------%@",self.dic);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    titleLabel.text=[self.dic objectForKey:@"Name"];
    
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:18.f];
    [self.view addSubview:titleLabel];
    
}
-(void)delePlan:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createView{
    self.DrugView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-44)];
    [self.view addSubview:self.DrugView];
    self.DrugView.delegate=self;
    self.DrugView.dataSource=self;
    self.DrugView.rowHeight=74;
    [self.DrugView registerNib:[UINib nibWithNibName:@"TimeTableViewCell" bundle:nil] forCellReuseIdentifier:@"TimeTableViewCell"];
    [self.DrugView registerNib:[UINib nibWithNibName:@"ClassHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"ClassHeaderTableViewCell"];
    [self.DrugView registerNib:[UINib nibWithNibName:@"TimesTableViewCell" bundle:nil] forCellReuseIdentifier:@"TimesTableViewCell"];
    [self.DrugView registerNib:[UINib nibWithNibName:@"ClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"ClassTableViewCell"];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2+_array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==0) {
        TimeTableViewCell *Cell1=[tableView dequeueReusableCellWithIdentifier:@"TimeTableViewCell"];
        if (Cell1==nil) {
            Cell1=[[TimeTableViewCell alloc]init];
            
        }
        Cell1.selectionStyle=UITableViewCellSelectionStyleNone;
        Cell1.GetTime.placeholder=[self.dic objectForKey:@"Time"];
        return Cell1;
        
    }else if(indexPath.row==1){
        ClassHeaderTableViewCell *cell2=[tableView dequeueReusableCellWithIdentifier:@"ClassHeaderTableViewCell"];
        if (cell2==nil) {
            cell2=[[ClassHeaderTableViewCell alloc]init];
        }
        cell2.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell2;
    }else if(indexPath.row==_array.count+1){
    TimesTableViewCell *cell3=[tableView dequeueReusableCellWithIdentifier:@"TimesTableViewCell"];
    if (cell3==nil) {
        cell3=[[TimesTableViewCell alloc]init];
    }
    cell3.selectionStyle=UITableViewCellSelectionStyleNone;
    cell3.TimesStr.text=[self.dic objectForKey:@"times"];
    return cell3;
    }else{
        ClassTableViewCell *cell4=[tableView dequeueReusableCellWithIdentifier:@"ClassTableViewCell"];
        if (cell4==nil) {
            cell4=[[ClassTableViewCell alloc]init];
        }
        cell4.Name.placeholder=_array[indexPath.row-2];
        cell4.selectionStyle=UITableViewCellSelectionStyleNone;
        NSLog(@"---------------%@",cell4.Name.placeholder);     return cell4;
    
    }
    
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
