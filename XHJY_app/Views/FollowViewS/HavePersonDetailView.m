//
//  HavePersonDetailView.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "HavePersonDetailView.h"
#import <Masonry/Masonry.h>
#import "UIButton+ImageTitleSpacing.h"
#import "TouchLabel.h"
#import "ZHRampView.h"
@interface HavePersonDetailView ()

@end
@implementation HavePersonDetailView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self setUpViews];
        self.isShow=NO;
        self.userInteractionEnabled=YES;
    }
    return self;
    
}

-(void)setUpViews{
    self.backgroundColor=[UIColor whiteColor];
    self.scrollView=[UIScrollView new];
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator=NO;
    self.scrollView.bounces=NO;
    self.scrollView.alwaysBounceVertical=YES;
    //self.scrollView.tag=SCROLL_TAG;
    self.scrollView.scrollsToTop=YES;
    self.scrollView.userInteractionEnabled=YES;
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).width.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    self.containerView=[UIView new];
    [self.scrollView addSubview:self.containerView];
    self.containerView.backgroundColor=[UIColor whiteColor];
    self.containerView.frame=CGRectMake(0,0 , SCREEN_WIDTH, 708);
    

    self.BGView=[UIView new];
    [self.containerView addSubview:self.BGView];
    self.BGView.backgroundColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [self.BGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.containerView.mas_width);
        make.centerX.equalTo(self.containerView.mas_centerX);
        make.height.mas_equalTo(@215);
        make.top.equalTo(self.scrollView.mas_top).with.offset(0);
        
    }];
    
    self.workIMG=[UIImageView new];
    [self.containerView addSubview:self.workIMG];
    self.workIMG.image=ImageNamed(@"icon_work");
    [self.workIMG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView.mas_left).with.offset(15);
        make.top.equalTo(self.containerView.mas_top).with.offset(9);
        make.width.mas_equalTo(@19);
        make.height.mas_equalTo(@12);
    }];
    
    self.batteryLabel=[UILabel new];
    [self.containerView addSubview:self.batteryLabel];
    self.batteryLabel.text=@"工作中";
    self.batteryLabel.textAlignment=NSTextAlignmentCenter;
    self.batteryLabel.font=[UIFont systemFontOfSize:12];
    self.batteryLabel.textColor=[Tools colorWithHexString:@"FFFFFF" withAlpha:1];
    [self.batteryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.workIMG.mas_centerY);
        make.left.equalTo(self.workIMG.mas_right).with.offset(5);
        
    }];
   
    self.timeLabel=[UILabel new];
    [self.containerView addSubview:self.timeLabel];
    self.timeLabel.text=@"持续监测时间：00:00:00";
    self.timeLabel.textColor=[Tools colorWithHexString:@"FFFFFF" withAlpha:1];
    self.timeLabel.font=[UIFont systemFontOfSize:12];
    self.timeLabel.textAlignment=NSTextAlignmentCenter;
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.batteryLabel.mas_centerY);
        make.right.equalTo(self.mas_right).with.offset(-15);
    }];

    UILabel *label=[UILabel new];
    [self.containerView addSubview:label];
    label.backgroundColor=[Tools colorWithHexString:@"#73dbce" withAlpha:1];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.top.mas_equalTo(self.containerView.mas_top).with.offset(30);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    UILabel *label2=[UILabel new];
    [self.containerView addSubview:label2];
    label2.backgroundColor=[Tools colorWithHexString:@"#73dbce" withAlpha:1];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.top.mas_equalTo(self.containerView.mas_top).with.offset(140);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    UILabel *label3=[UILabel new];
    [self.containerView addSubview:label3];
    label3.backgroundColor=[Tools colorWithHexString:@"#73dbce" withAlpha:1];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.BGView.mas_height);
        make.width.equalTo(@1);
        make.top.mas_equalTo(self.containerView.mas_top).with.offset(0);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    self.HRLabel=[UILabel new];
    [self.containerView addSubview:self.HRLabel];
    self.HRLabel.textAlignment=NSTextAlignmentCenter;
    self.HRLabel.text=@"实时心率";
    self.HRLabel.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.HRLabel.font=[UIFont systemFontOfSize:16];
    [self.HRLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(label.mas_bottom).with.offset(10);
        
    }];
    
    self.HRNumLabel=[UILabel new];
    [self.containerView addSubview:self.HRNumLabel];
    self.HRNumLabel.textAlignment=NSTextAlignmentLeft;
    self.HRNumLabel.textColor=[Tools colorWithHexString:@"FFFFFF" withAlpha:1];
    self.HRNumLabel.text=@"100";
    self.HRNumLabel.adjustsFontSizeToFitWidth=YES;
    self.HRNumLabel.font=[UIFont systemFontOfSize:50];
    [self.HRNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.HRLabel.mas_bottom).with.offset(11);
        make.left.equalTo(self.mas_left).with.offset(20);
        make.bottom.equalTo(label2.mas_top).with.offset(-15);
    }];
   
    
    self.HRimg=[UIImageView new];
    [self.containerView addSubview:self.HRimg];
    self.HRimg.image=ImageNamed(@"attitude_run");
    [self.HRimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.HRNumLabel.mas_top);
        make.right.equalTo(label3.mas_left).with.offset(-20);
    }];
    
    self.HRunit=[UILabel new];
    [self.containerView addSubview:self.HRunit];
    self.HRunit.textAlignment=NSTextAlignmentCenter;
    self.HRunit.text=@"(bpm)";
    self.HRunit.adjustsFontSizeToFitWidth=YES;
    self.HRunit.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.HRunit.font=[UIFont systemFontOfSize:12];
    [self.HRunit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.HRimg.mas_left);
        make.top.equalTo(self.HRimg.mas_bottom).with.offset(11);
    }];
    self.frequency=[UILabel new];
    [self.containerView addSubview:self.frequency];
    self.frequency.textAlignment=NSTextAlignmentCenter;
    self.frequency.text=@"呼吸频率";
    self.frequency.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.frequency.font=[UIFont systemFontOfSize:16];
    [self.frequency mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_right).with.offset(15);
        make.top.equalTo(label.mas_bottom).with.offset(10);
        
    }];
    
    self.frequencyNum=[UILabel new];
    [self.containerView addSubview:self.frequencyNum];
    self.frequencyNum.textAlignment=NSTextAlignmentCenter;
    self.frequencyNum.textColor=[Tools colorWithHexString:@"FFFFFF" withAlpha:1];
    self.frequencyNum.text=@"32";
    self.frequencyNum.font=[UIFont systemFontOfSize:45];
    [self.frequencyNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.HRLabel.mas_bottom).with.offset(11);
        make.left.equalTo(label3.mas_right).with.offset(40);
        make.bottom.equalTo(label2.mas_top).with.offset(-15);
    }];
    //此处没问题
    self.frequencyUnit=[UILabel new];
    [self.containerView addSubview:self.frequencyUnit];
    self.frequencyUnit.textAlignment=NSTextAlignmentCenter;
    self.frequencyUnit.text=@"(次/分)";
    self.frequencyUnit.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.frequencyUnit.font=[UIFont systemFontOfSize:12];
    [self.frequencyUnit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.frequencyNum.mas_right).with.offset(10);
        make.top.equalTo(self.HRimg.mas_bottom).with.offset(11);
    }];
    self.minHeart=[UILabel new];
    self.minHeart.text=@"最小心率(bpm)";
    [self.containerView addSubview:self.minHeart];
    self.minHeart.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.minHeart.textAlignment=NSTextAlignmentCenter;
    self.minHeart.font=[UIFont systemFontOfSize:11];
    [self.minHeart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.mas_bottom).with.offset(10);
        make.left.equalTo(self.mas_left).with.offset(15);
        
    }];
    self.minHeartNum=[UILabel new];
    [self.containerView addSubview:self.minHeartNum];
    self.minHeartNum.textAlignment=NSTextAlignmentCenter;
    self.minHeartNum.font=[UIFont systemFontOfSize:30];
    self.minHeartNum.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.minHeartNum.text=@"75";
    [self.minHeartNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.minHeart.mas_centerX);
        make.top.equalTo(self.minHeart.mas_bottom).with.offset(18);
        make.bottom.equalTo(self.BGView.mas_bottom).with.offset(-10);
    }];
    
    self.minHeartTime=[UILabel new];
    [self.containerView addSubview:self.minHeartTime];
    self.minHeartTime.text=@"09:32:21";
    self.minHeartTime.textAlignment=NSTextAlignmentCenter;
    self.minHeartTime.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.minHeartTime.font=[UIFont systemFontOfSize:11];
    [self.minHeartTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.minHeart.mas_top);
        make.right.equalTo(label3.mas_left).with.offset(-15);
    }];

    self.minHimg=[UIImageView new];
    [self.containerView addSubview:self.minHimg];
    self.minHimg.image=ImageNamed(@"attitude_run");
    [self.minHimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.minHeartTime.mas_bottom).with.offset(18);
        make.centerX.equalTo(self.minHeartTime.mas_centerX);
    }];
 
    self.maxHeart=[UILabel new];
    self.maxHeart.text=@"最大心率(bpm)";
    [self.containerView addSubview:self.maxHeart];
    self.maxHeart.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.maxHeart.textAlignment=NSTextAlignmentCenter;
    self.maxHeart.font=[UIFont systemFontOfSize:11];
    [self.maxHeart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.mas_bottom).with.offset(10);
        make.left.equalTo(label3.mas_right).with.offset(15);
        
    }];
    self.maxHeartNum=[UILabel new];
    [self.containerView addSubview:self.maxHeartNum];
    self.maxHeartNum.textAlignment=NSTextAlignmentCenter;
    self.maxHeartNum.font=[UIFont systemFontOfSize:30];
    self.maxHeartNum.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.maxHeartNum.text=@"152";
    [self.maxHeartNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.maxHeart.mas_centerX);
        make.top.equalTo(self.maxHeart.mas_bottom).with.offset(18);
        make.bottom.equalTo(self.BGView.mas_bottom).with.offset(-10);
    }];
    
    self.maxHeartTime=[UILabel new];
    [self.containerView addSubview:self.maxHeartTime];
    self.maxHeartTime.text=@"09:32:21";
    self.maxHeartTime.textAlignment=NSTextAlignmentCenter;
    self.maxHeartTime.textColor=[Tools colorWithHexString:@"#FFFFFF" withAlpha:1];
    self.maxHeartTime.font=[UIFont systemFontOfSize:11];
    [self.maxHeartTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maxHeart.mas_top);
        make.right.equalTo(self.mas_right).with.offset(-15);
    }];
    
    self.maxHimg=[UIImageView new];
    [self.containerView addSubview:self.maxHimg];
    self.maxHimg.image=ImageNamed(@"attitude_run");
    [self.maxHimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maxHeartTime.mas_bottom).with.offset(18);
        make.centerX.equalTo(self.maxHeartTime.mas_centerX);
    }];
    
    self.warningBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.containerView addSubview:self.warningBtn];
    [self.warningBtn setImage:ImageNamed(@"icon_alarm") forState:UIControlStateNormal];
    [self.warningBtn setTitle:@"告警(3)" forState:UIControlStateNormal];
    self.warningBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    self.warningBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    self.warningBtn.layer.borderWidth=1;
    self.warningBtn.layer.borderColor=[Tools colorWithHexString:@"#FF2E63" withAlpha:1].CGColor;
    self.warningBtn.layer.cornerRadius=5;
    [self.warningBtn setTitleColor:[Tools colorWithHexString:@"#FF2E63" withAlpha:1] forState:UIControlStateNormal];
    [self.warningBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.BGView.mas_bottom).with.offset(5);
        make.height.equalTo(@30);
//        make.width.equalTo(@100);
    }];
    [self.warningBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:4];
    [self.warningBtn addTarget:self action:@selector(warningBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.startBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.containerView addSubview:self.startBtn];
    [self.startBtn setImage:ImageNamed(@"icon_switch") forState:UIControlStateNormal];
    [self.startBtn setTitle:@"开始监测" forState:UIControlStateNormal];
    self.startBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    self.startBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    self.startBtn.layer.borderWidth=1;
    self.startBtn.layer.borderColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1].CGColor;
    self.startBtn.layer.cornerRadius=5;
    [self.startBtn setTitleColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1] forState:UIControlStateNormal];
    [self.startBtn addTarget:self action:@selector(stateBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(self.BGView.mas_bottom).with.offset(5);
        make.height.equalTo(@30);
        make.width.equalTo(self.warningBtn.mas_width);
    }];
    [self.startBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:4];
    
    self.analyzeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.containerView addSubview:self.analyzeBtn];
    [self.analyzeBtn setImage:ImageNamed(@"icon_analysis") forState:UIControlStateNormal];
    [self.analyzeBtn setTitle:@"分析" forState:UIControlStateNormal];
    self.analyzeBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    self.analyzeBtn.layer.borderWidth=1;
    self.analyzeBtn.layer.borderColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1].CGColor;
    self.analyzeBtn.titleLabel.font=[UIFont systemFontOfSize:15];    self.analyzeBtn.layer.cornerRadius=5;
    [self.analyzeBtn setTitleColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1] forState:UIControlStateNormal];
    [self.analyzeBtn addTarget:self action:@selector(analyzeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.analyzeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.warningBtn.mas_right).with.offset(16);
        make.top.equalTo(self.BGView.mas_bottom).with.offset(5);
        make.height.equalTo(@30);
        make.width.equalTo(@70);
        make.centerX.equalTo(self.mas_centerX);
        make.right.equalTo(self.startBtn.mas_left).with.offset(-16);
    }];
    [self.analyzeBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
    UILabel *label4=[UILabel new];
    [self.containerView addSubview:label4];
    label4.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.top.equalTo(self.analyzeBtn.mas_bottom).with.offset(8);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    self.showBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.containerView addSubview:self.showBtn];
    [self.showBtn setImage:ImageNamed(@"icon_display") forState:UIControlStateNormal];
    self.showBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.showBtn setTitle:@"显示心电图" forState:UIControlStateNormal];
    [self.showBtn setTitleColor:[Tools colorWithHexString:@"#999999" withAlpha:1] forState:UIControlStateNormal];
    [self.showBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label4.mas_bottom).with.offset(10);
        make.centerX.equalTo(label4.mas_centerX);
    }];
    [self.showBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:6];
    [self.showBtn addTarget:self action:@selector(showBtnImg:) forControlEvents:UIControlEventTouchUpInside];
   
    self.showView=[[lineChart alloc]init];
    self.showView.hidden=YES;
    [self.containerView addSubview:self.showView];
//    self.showView.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showBtn.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.mas_width);
        make.height.mas_equalTo(@0).priorityLow();
    }];
   

    UILabel *label5=[UILabel new];
    [self.containerView addSubview:label5];
    label5.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.top.mas_equalTo(self.showView.mas_bottom).with.offset(10);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    UILabel *label6=[UILabel new];
    [self.containerView addSubview:label6];
    label6.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.top.mas_equalTo(label5.mas_bottom).with.offset(50);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];UILabel *label7=[UILabel new];
    [self.containerView addSubview:label7];
    label7.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.top.equalTo(label6.mas_bottom).with.offset(50);
        make.centerX.equalTo(self.mas_centerX);
    }];
    UILabel *label8=[UILabel new];
    [self.containerView addSubview:label8];
    label8.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.top.mas_equalTo(label7.mas_bottom).with.offset(50);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    UILabel *label9=[UILabel new];
    [self.containerView addSubview:label9];
    label9.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.top.mas_equalTo(label8.mas_bottom).with.offset(50);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    UILabel *labelA=[UILabel new];
    [self.containerView addSubview:labelA];
    labelA.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [labelA mas_makeConstraints:^(MASConstraintMaker *make) {

        make.width.equalTo(@1);
        make.top.mas_equalTo(label5.mas_bottom);
        make.bottom.equalTo(label7.mas_top);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    UILabel *labelB=[UILabel new];
    [self.containerView addSubview:labelB];
    labelB.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    float a=SCREEN_WIDTH/4.f;
    [labelB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(labelA.mas_height);
        make.width.equalTo(@1);
        make.top.mas_equalTo(label5.mas_bottom);
        make.right.equalTo(self.mas_right).with.offset(-a);
    }];
    UILabel *labelC=[UILabel new];
    [self.containerView addSubview:labelC];
    labelC.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:1];
    [labelC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@1);
        make.top.mas_equalTo(label5.mas_bottom);
        make.bottom.equalTo(label9.mas_top);
        make.left.equalTo(self.mas_left).with.offset(a);
    }];
    
    self.oneLabel=[UIButton new];
    [self.containerView addSubview:self.oneLabel];
    [self.oneLabel setTitle:@"室 性" forState:UIControlStateNormal];
    self.oneLabel.titleLabel.font=[UIFont systemFontOfSize:16   ];
    [self.oneLabel  setTitleColor:[Tools colorWithHexString:@"#222222" withAlpha:1] forState:UIControlStateNormal];
    [self.oneLabel addTarget:self action:@selector(oneButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label5.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(labelC.mas_left);
        make.bottom.equalTo(label6.mas_top);
    }];
    self.twoLabel=[UIButton new];
    [self.containerView addSubview:self.twoLabel];
    [self.twoLabel setTitle:@"室上性" forState:UIControlStateNormal];
    [self.oneLabel setTitleColor:[Tools colorWithHexString:@"#f3f3f4" withAlpha:1] forState:UIControlStateHighlighted];
    self.twoLabel.titleLabel.font=[UIFont systemFontOfSize:16];
    
    [self.twoLabel setTitleColor:[Tools colorWithHexString:@"#222222" withAlpha:1] forState:UIControlStateNormal];
    [self.twoLabel addTarget:self action:@selector(twoButton:) forControlEvents:UIControlEventTouchUpInside];
     [self.twoLabel setTitleColor:[Tools colorWithHexString:@"#f3f3f4" withAlpha:1] forState:UIControlStateHighlighted];    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label5.mas_bottom);
        make.left.equalTo(labelC.mas_left);
        make.right.equalTo(labelA.mas_left);
        make.bottom.equalTo(label6.mas_top);
    }];
    self.threeLabel=[UIButton new];
    [self.containerView addSubview:self.threeLabel];
    [self.threeLabel setTitle:@"心动过缓" forState:UIControlStateNormal];
    self.threeLabel.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.threeLabel setTitleColor:[Tools colorWithHexString:@"#222222" withAlpha:1] forState:UIControlStateNormal];
    [self.threeLabel addTarget:self action:@selector(threeButton:) forControlEvents:UIControlEventTouchUpInside];
     [self.threeLabel setTitleColor:[Tools colorWithHexString:@"#f3f3f4" withAlpha:1] forState:UIControlStateHighlighted];    [self.threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label5.mas_bottom);
        make.left.equalTo(labelA.mas_right);
        make.right.equalTo(labelB.mas_left);
        make.bottom.equalTo(label6.mas_top);
    }];
    self.fourLabel=[UIButton new];
    [self.containerView addSubview:self.fourLabel];
    [self.fourLabel setTitle:@"房 颤" forState:UIControlStateNormal];
    self.fourLabel.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.fourLabel setTitleColor:[Tools colorWithHexString:@"#222222" withAlpha:1] forState:UIControlStateNormal];
    [self.fourLabel setTitleColor:[Tools colorWithHexString:@"#f3f3f4" withAlpha:1] forState:UIControlStateHighlighted];
    [self.fourLabel addTarget:self action:@selector(fourButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.fourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label5.mas_bottom);
        make.left.equalTo(labelB.mas_right);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(label6.mas_top);
    }];
    
    self.oneBtn=[UILabel new];
    [self.containerView addSubview:self.oneBtn];
    self.oneBtn.text=@"0";
    self.oneBtn.font=[UIFont systemFontOfSize:30];
    self.oneBtn.textColor=[Tools colorWithHexString:@"#222222" withAlpha:1];
    self.oneBtn.textAlignment=NSTextAlignmentCenter;
    [self.oneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label6.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(labelC.mas_left);
        make.bottom.equalTo(label7.mas_top);
    }];
    self.twoBtn=[UILabel new];
    [self.containerView addSubview:self.twoBtn];
    self.twoBtn.text=@"0";
    self.twoBtn.font=[UIFont systemFontOfSize:30];
    self.twoBtn.textColor=[Tools colorWithHexString:@"#222222" withAlpha:1];
    self.twoBtn.textAlignment=NSTextAlignmentCenter;
    [self.twoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label6.mas_bottom);
        make.left.equalTo(labelC.mas_right);
        make.right.equalTo(labelA.mas_left);
        make.bottom.equalTo(label7.mas_top);
    }];
    self.threeBtn=[UILabel new];
    [self.containerView addSubview:self.threeBtn];
    self.threeBtn.text=@"0";
    self.threeBtn.font=[UIFont systemFontOfSize:30];
    self.threeBtn.textColor=[Tools colorWithHexString:@"#222222" withAlpha:1];
    self.threeBtn.textAlignment=NSTextAlignmentCenter;
    [self.threeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label6.mas_bottom);
        make.left.equalTo(labelA.mas_right);
        make.right.equalTo(labelB.mas_left);
        make.bottom.equalTo(label7.mas_top);
    }];
    self.fourBtn=[UILabel new];
    [self.containerView addSubview:self.fourBtn];
    self.fourBtn.text=@"0";
    self.fourBtn.font=[UIFont systemFontOfSize:30];
    self.fourBtn.textColor=[Tools colorWithHexString:@"#222222" withAlpha:1];
    self.fourBtn.textAlignment=NSTextAlignmentCenter;
    [self.fourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label6.mas_bottom);
        make.left.equalTo(labelB.mas_right);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(label7.mas_top);
    }];
    
    self.forecastLabel=[UILabel new];
    [self.containerView addSubview:self.forecastLabel];
    self.forecastLabel.text=@"风险预测";
    self.forecastLabel.textAlignment=NSTextAlignmentCenter;
    self.forecastLabel.font=[UIFont systemFontOfSize:16];
    self.forecastLabel.textColor=[Tools colorWithHexString:@"#222222" withAlpha:1];
    [self.forecastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label7.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(labelC.mas_left);
        make.bottom.equalTo(label8.mas_top);
    }];
    
    self.pressLabel=[UILabel new];
    [self.containerView addSubview:self.pressLabel];
    self.pressLabel.text=@"压力指数";
    self.pressLabel.textAlignment=NSTextAlignmentCenter;
    self.pressLabel.font=[UIFont systemFontOfSize:16];
    self.pressLabel.textColor=[Tools colorWithHexString:@"#222222" withAlpha:1];
    [self.pressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label8.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(labelC.mas_left);
        make.bottom.equalTo(label9.mas_top);
    }];
    self.oneIMG=[UIImageView new];
    [self.containerView addSubview:self.oneIMG];
    self.oneIMG.layer.cornerRadius=10;
    self.oneIMG.backgroundColor=[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [self.oneIMG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.twoBtn.mas_centerX);
        make.centerY.equalTo(self.forecastLabel.mas_centerY);
        make.width.mas_equalTo(@20);
        make.height.mas_equalTo(@20);
    }];
    self.twoIMG=[UIImageView new];
    [self.containerView addSubview:self.twoIMG];
    self.twoIMG.layer.cornerRadius=10;
    self.twoIMG.backgroundColor=[Tools colorWithHexString:@"#FFD700" withAlpha:1];
    [self.twoIMG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.threeLabel.mas_centerX);
        make.centerY.equalTo(self.forecastLabel.mas_centerY);
        make.width.mas_equalTo(@20);
        make.height.mas_equalTo(@20);
    }];
    self.threeIMG=[UIImageView new];
    [self.containerView addSubview:self.threeIMG];
    self.threeIMG.layer.cornerRadius=10;
    self.threeIMG.backgroundColor=[Tools colorWithHexString:@"#ff4040" withAlpha:1];
    [self.threeIMG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.fourBtn.mas_centerX);
        make.centerY.equalTo(self.forecastLabel.mas_centerY);
        make.width.mas_equalTo(@20);
        make.height.mas_equalTo(@20);
    }];
    
    self.abc=0.4;
    self.colorView=[[ZHRampView alloc]initWithFrame:CGRectMake(0, 0, 210, 22) withColors:@[[UIColor greenColor],[UIColor yellowColor],[UIColor redColor]]withScale:self.abc];
    self.colorView.layer.cornerRadius=4;
    [self.containerView addSubview:self.colorView];
    
    [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label8.mas_bottom).with.offset(19);
        make.left.equalTo(self.oneIMG.mas_left);
        make.right.equalTo(self.threeIMG.mas_right);
        make.height.mas_equalTo(@22);
    }];
    self.colorIMG=[UIImageView new];
    [self.containerView addSubview:self.colorIMG];
    self.colorIMG.image=ImageNamed(@"icon_pressure");
    [self.colorIMG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.colorView.mas_top);
        make.top.equalTo(label8.mas_bottom).with.offset(7);
        make.width.mas_equalTo(@16);
        make.left.equalTo(self.colorView.mas_left).with.offset(210.00*(1-self.abc)+12);
    }];
    
    
    self.scrollView.contentSize=CGSizeMake(SCREEN_WIDTH, self.containerView.frame.size.height);
}
/**
 *  点击获得心率图
 *
 *  @param sender 点击按钮
 */
-(void)showBtnImg:(UIButton *)sender{
    [self.delegate showHeart];
    self.showView.hidden=NO;
    [self.showView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@200);
    }];
    [self.showView setNeedsDisplay];
}
-(void)oneButton:(UIButton *)sender{
    NSLog(@"室性");

}
-(void)twoButton:(UIButton *)sender{
    NSLog(@"室上性");
}
-(void)threeButton:(UIButton *)sender{
    NSLog(@"心动");

}
-(void)fourButton:(UIButton *)sender{
    NSLog(@"房颤");

}
-(void)analyzeBtn:(UIButton *)sender{
    NSLog(@"分析");
}
-(void)stateBtn:(UIButton *)sender{
    NSLog(@"开始监测");
}
-(void)warningBtn:(UIButton *)sender{
    NSLog(@"警告");
   // [self.HPVC.navigationController pushViewController:[EgViewController new] animated:NO];

}

@end
