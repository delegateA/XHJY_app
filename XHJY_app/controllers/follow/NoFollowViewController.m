//
//  NoFollowViewController.m
//  XHJY_app
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "NoFollowViewController.h"
#import <Masonry/Masonry.h>
#import "NoPersonView.h"
#import "HavePersonDetailView.h"
#import "CXSlideBar.h"
#import "AnalysisViewController.h"
#import  "FocusOnViewController.h"
#import "AddIndicatorsMainViewController.h"

@interface NoFollowViewController ()<CXSlideBarDelegate,HavePersonDetailViewDelegate>
{
    BOOL isHaveData;
}
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)UIScrollView *NoPer;
@property(nonatomic,strong)CXSlideBar *slideBar;
@property(nonatomic,strong)NSArray *arrPerson;
@property(nonatomic,strong)HavePersonDetailView *Person;
@end

@implementation NoFollowViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    if (isHaveData==YES) {
//        [self createView1];
        [self setUpViews];
    }else{
        [self createView2];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(show) name:@"ShowButton" object:nil];
    
}
//无关注无指标
-(void)createView1{
//    _arrPerson=@[@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1"];
//    [self.view addSubview:self.slideBar];
//    HavePersonDetailView *Person=[[HavePersonDetailView alloc]initWithFrame:CGRectMake(0, 115, SCREEN_WIDTH, SCREEN_HEIGHT-115-44)];
//    Person.HPVC=self;
//    
//    Person.tag=80;
//    [self.view addSubview:Person];
    
//    _NoPer=[[NoPersonView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT)];
//    [self.view addSubview:_NoPer];
}
//有关注和指标
-(void)createView2{
        _arrPerson=@[@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1",@"btn_add_press1"];
        [self.view addSubview:self.slideBar];
         _Person=[[HavePersonDetailView alloc]initWithFrame:CGRectMake(0, 115, SCREEN_WIDTH, SCREEN_HEIGHT-115-44)];
        _Person.delegate=self;
        _Person.HPVC=self;
        _Person.tag=80;
        [self.view addSubview:_Person];
    
}

#define mark  CXslideBar
-(CXSlideBar *)slideBar{
    if (!_slideBar) {
        _slideBar=[CXSlideBar initWithFrame:CGRectMake(0, 20,SCREEN_WIDTH, 95) Array:_arrPerson];
        _slideBar.delegate=self;
        _slideBar.AddVC=self;
    }
    return _slideBar;

}
-(void)slideBarTouch:(CXSlideBar *)slideBar atIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
    if (index==0) {
        [self.navigationController pushViewController:[FocusOnViewController new] animated:YES];
    }
}




-(void)show{
    NSLog(@"____________&________");
    
    [self.view setNeedsDisplay];
    [self.view layoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated{

}

-(void)setUpViews{
    _NoPer.userInteractionEnabled=YES;
    _NoPer.backgroundColor=[UIColor whiteColor];
    _NoPer=[UIScrollView new];
    _NoPer.showsHorizontalScrollIndicator=NO;
    _NoPer.showsVerticalScrollIndicator=NO;
    _NoPer.bounces=NO;
    _NoPer.alwaysBounceVertical=YES;
//    _NoPer.scrollEnabled=NO;
    
    _NoPer.scrollsToTop=YES;
    _NoPer.userInteractionEnabled=YES;
    [self.view addSubview:_NoPer];
    _NoPer.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44);
    
    //    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(self).width.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    //    }];
  
     UIView *containerView=[UIView new];
     [_NoPer addSubview:containerView];
     containerView.backgroundColor=[UIColor whiteColor];
    containerView.frame=CGRectMake(0,0 , SCREEN_WIDTH, 667);
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, 667-104-44)];
    [containerView addSubview:view];
    view.backgroundColor=RGBACOLOR(252, 252, 255, 1) ;
    
    //初始化关注图片
    UIButton *upBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [upBtn setImage:ImageNamed(@"btn_add_b_press") forState:UIControlStateNormal];
    [upBtn setImage:ImageNamed(@"btn_add_b_normal") forState:UIControlStateHighlighted];
    [containerView addSubview:upBtn];
    [upBtn addTarget:self action:@selector(AddPerson:) forControlEvents:UIControlEventTouchUpInside];
    [upBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView.mas_top).with.offset(26);
        make.centerX.mas_equalTo(containerView.mas_centerX);
        make.height.mas_equalTo(@70);
        make.width.mas_equalTo(@70);
    }];
    UILabel * btnLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 52, 48, 18)];
    [upBtn addSubview:btnLabel];
    btnLabel.text=@"添加关注";
    btnLabel.textColor=[UIColor blackColor];
    btnLabel.layer.borderWidth=1;
    btnLabel.textAlignment=NSTextAlignmentCenter;
    btnLabel.font=[UIFont systemFontOfSize:10];
    btnLabel.backgroundColor=[UIColor whiteColor];
    btnLabel.layer.borderColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:0.8].CGColor;
    
    //初始化分割线
    UILabel*lineLabel=[UILabel new];
    [containerView addSubview:lineLabel];
    lineLabel.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:0.8];
    //self.lineLabel.frame=CGRectMake(0, 120, SCREEN_WIDTH, 2);
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(containerView.mas_width);
        make.height.mas_equalTo(@1);
        make.top.equalTo(upBtn.mas_bottom).with.offset(7);
        make.centerX.mas_equalTo(containerView.mas_centerX);
    }];
    
    
    //初始化up图片
    UIImageView*upImage=[UIImageView new];
    [containerView addSubview:upImage];
    upImage.image=ImageNamed(@"icon_arrow");
    [upImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineLabel.mas_bottom).with.offset(10);
        make.height.mas_equalTo(@18);
        make.width.mas_equalTo(@9);
        make.centerX.equalTo(containerView.mas_centerX);
    }];
    
    //初始化上部字符串
    UILabel*upLabel=[UILabel new];
    [containerView addSubview:upLabel];
    upLabel.text=@"关注家人，实时查看家人的健康结果！";
    upLabel.textAlignment=NSTextAlignmentCenter;
    upLabel.numberOfLines=0;
    upLabel.adjustsFontSizeToFitWidth=YES;
    upLabel.textColor=[Tools colorWithHexString:@"#666666" withAlpha:1];
    upLabel.font=[UIFont systemFontOfSize:18];
    [upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(containerView.mas_left).with.offset(40);
        make.right.equalTo(containerView.mas_right).with.offset(-40);
        make.centerX.equalTo(containerView.mas_centerX);
        make.top.equalTo(upImage.mas_bottom).with.offset(15);
    }];
    
    //区域划分线
    UILabel* label2=[UILabel new];
    [containerView addSubview:label2];
    label2.text=@"或";
    label2.textAlignment=NSTextAlignmentCenter;
    label2.font=[UIFont systemFontOfSize:18];
    label2.textColor=[Tools colorWithHexString:@"#A8A8AA" withAlpha:1];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(upLabel.mas_bottom).with.offset(80);
        make.centerX.equalTo(containerView.mas_centerX);
        make.height.equalTo(@20);
        make.width.equalTo(@30);
    }];
    
    //左线条
    UILabel*label1=[UILabel new];
    [containerView addSubview:label1];
    label1.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:0.8];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(label2.mas_centerY);
        make.left.equalTo(containerView.mas_left).with.offset(0);
        make.right.equalTo(label2.mas_left).with.offset(-8);
        make.height.mas_equalTo(@1);
    }];
    //右侧线条
    UILabel * lael3=[UILabel new];
    [containerView addSubview:lael3];
    lael3.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:0.8];
    [lael3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(label2.mas_centerY);
        make.right.equalTo(containerView.mas_right).with.offset(10);
        make.left.equalTo(label2.mas_right).with.offset(8);
        make.height.mas_equalTo(@1);
    }];
    //下部text
    UILabel*downLabel=[UILabel new];
    [containerView addSubview:downLabel];
    downLabel.text=@"添加指标，随时了解自己的身体健康！";
    downLabel.textColor=[Tools colorWithHexString:@"#666666" withAlpha:1];
    downLabel.numberOfLines=0;
    downLabel.adjustsFontSizeToFitWidth=YES;
    downLabel.font=[UIFont systemFontOfSize:18];
    downLabel.textAlignment=NSTextAlignmentCenter;
    [downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.mas_bottom).with.offset(80);
        make.centerX.equalTo(containerView.mas_centerX);
        make.width.equalTo(upLabel);
    }];
    
    //自己的按钮
    UIButton* downBtn=[UIButton new];
    downBtn.tag=890;
    [containerView addSubview:downBtn];
    [downBtn setTitle:@"添加指标" forState:UIControlStateNormal];
    [downBtn setTitleColor:[Tools colorWithHexString:@"#A8A8AA" withAlpha:1] forState:UIControlStateNormal];
    [downBtn setTitleColor:[Tools colorWithHexString:@"f3f3f4" withAlpha:1] forState:UIControlStateHighlighted];
    [downBtn addTarget:self action:@selector(ADDSelf:) forControlEvents:UIControlEventTouchUpInside];
    [downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downLabel.mas_bottom).with.offset(20);
        make.centerX.equalTo(containerView.mas_centerX);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@30);
    }];
    _NoPer.contentSize=CGSizeMake(SCREEN_WIDTH, 667-44);
}

-(void)AddPerson:(UIButton *)sender{
    NSLog(@"添加关注的人");
    FocusOnViewController *vc = [[FocusOnViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}
-(void)ADDSelf:(UIButton *)sender{
    NSLog(@"添加自己的指标");
    AddIndicatorsMainViewController *vc =[[ AddIndicatorsMainViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}
-(void)showHeart{
    _Person.showView.hidden=NO;
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [_Person.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@100);
    }];    [self.view layoutIfNeeded];
    
}




@end
