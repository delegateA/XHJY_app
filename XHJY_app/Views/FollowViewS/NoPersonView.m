//
//  NoPersonView.m
//  XHJY_app
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "NoPersonView.h"
#import <Masonry/Masonry.h>

#define SCROLL_TAG 432
@interface NoPersonView ()

@end


@implementation NoPersonView


-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
       [self setUpViews];
    }
    return self;
 
}
-(void)setUpViews{
    self.userInteractionEnabled=YES;
     __weak typeof(self) wSelf=self;
    self.backgroundColor=[UIColor whiteColor];
    self.scrollView=[UIScrollView new];
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.showsVerticalScrollIndicator=NO;
    self.scrollView.bounces=NO;
    self.scrollView.alwaysBounceVertical=YES;
    self.scrollView.scrollEnabled=NO;
    self.scrollView.tag=SCROLL_TAG;
    self.scrollView.scrollsToTop=YES;
    self.scrollView.userInteractionEnabled=YES;
    [self addSubview:self.scrollView];
    self.scrollView.autoresizesSubviews=NO;
    self.scrollView.frame=self.bounds;

//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self).width.insets(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];
    //初始化容器
   // self.containerView=[UIView new];
   // [self.scrollView addSubview:self.containerView];
    //self.containerView.backgroundColor=[UIColor whiteColor];
   // [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
      //  make.edges.equalTo(self.scrollView);
     //   make.width.equalTo(self.scrollView);
    //}];
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, self.frame.size.height-104)];
    [self.scrollView addSubview:view];
    view.backgroundColor=RGBACOLOR(252, 252, 255, 1) ;
    
    //初始化关注图片
    self.upBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.upBtn setImage:ImageNamed(@"btn_add_b_press") forState:UIControlStateNormal];
    [self.upBtn setImage:ImageNamed(@"btn_add_b_normal") forState:UIControlStateHighlighted];
    [self.scrollView addSubview:self.upBtn];
    [self.upBtn addTarget:self action:@selector(ADDSelf:) forControlEvents:UIControlEventTouchUpInside];
    [self.upBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_top).with.offset(26);
        make.centerX.mas_equalTo(self.scrollView.mas_centerX);
        make.height.mas_equalTo(@70);
        make.width.mas_equalTo(@70);
    }];
    self.btnLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 52, 48, 18)];
    [self.upBtn addSubview:self.btnLabel];
    self.btnLabel.text=@"添加关注";
    self.btnLabel.textColor=[UIColor blackColor];
    self.btnLabel.layer.borderWidth=1;
    self.btnLabel.textAlignment=NSTextAlignmentCenter;
    self.btnLabel.font=[UIFont systemFontOfSize:10];
    self.btnLabel.backgroundColor=[UIColor whiteColor];
    self.btnLabel.layer.borderColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:0.8].CGColor;
    
    //初始化分割线
    self.lineLabel=[UILabel new];
    [self.scrollView addSubview:self.lineLabel];
    self.lineLabel.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:0.8];
    //self.lineLabel.frame=CGRectMake(0, 120, SCREEN_WIDTH, 2);
   [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView.mas_width);
        make.height.mas_equalTo(@1);
        make.top.equalTo(self.upBtn.mas_bottom).with.offset(7);
        make.centerX.mas_equalTo(self.scrollView.mas_centerX);
    }];

 
    //初始化up图片
    self.upImage=[UIImageView new];
    [self.scrollView addSubview:self.upImage];
    self.upImage.image=ImageNamed(@"icon_arrow");
    [self.upImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineLabel.mas_bottom).with.offset(10);
        make.height.mas_equalTo(@18);
        make.width.mas_equalTo(@9);
        make.centerX.equalTo(wSelf);
    }];
    
    //初始化上部字符串
    self.upLabel=[UILabel new];
    [self.scrollView addSubview:self.upLabel];
    self.upLabel.text=@"关注家人，实时查看家人的健康结果！";
    self.upLabel.textAlignment=NSTextAlignmentCenter;
    self.upLabel.numberOfLines=0;
    self.upLabel.adjustsFontSizeToFitWidth=YES;
    self.upLabel.textColor=[Tools colorWithHexString:@"#666666" withAlpha:1];
    self.upLabel.font=[UIFont systemFontOfSize:18];
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView.mas_left).with.offset(40);
        make.right.equalTo(self.scrollView.mas_right).with.offset(-40);
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.upImage.mas_bottom).with.offset(15);
    }];
    
    //区域划分线
    self.label2=[UILabel new];
    [self.scrollView addSubview:self.label2];
    self.label2.text=@"或";
    self.label2.textAlignment=NSTextAlignmentCenter;
    self.label2.font=[UIFont systemFontOfSize:18];
    self.label2.textColor=[Tools colorWithHexString:@"#A8A8AA" withAlpha:1];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.upLabel.mas_bottom).with.offset(80);
        make.centerX.equalTo(wSelf);
        make.height.equalTo(@20);
        make.width.equalTo(@30);
    }];
    
    //左线条
    self.label1=[UILabel new];
    [self.scrollView addSubview:self.label1];
    self.label1.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:0.8];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.label2.mas_centerY);
        make.left.equalTo(self.scrollView.mas_left).with.offset(0);
        make.right.equalTo(self.label2.mas_left).with.offset(-8);
        make.height.mas_equalTo(@1);
    }];
    //右侧线条
    self.lael3=[UILabel new];
    [self.scrollView addSubview:self.lael3];
    self.lael3.backgroundColor=[Tools colorWithHexString:@"#f3f3f4" withAlpha:0.8];
    [self.lael3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.label2.mas_centerY);
        make.right.equalTo(self.scrollView.mas_right).with.offset(10);
        make.left.equalTo(self.label2.mas_right).with.offset(8);
        make.height.mas_equalTo(@1);
    }];
    //下部text
    self.downLabel=[UILabel new];
    [self.scrollView addSubview:self.downLabel];
    self.downLabel.text=@"添加指标，随时了解自己的身体健康！";
    self.downLabel.textColor=[Tools colorWithHexString:@"#666666" withAlpha:1];
    self.downLabel.numberOfLines=0;
    self.downLabel.adjustsFontSizeToFitWidth=YES;
    self.downLabel.font=[UIFont systemFontOfSize:18];
    self.downLabel.textAlignment=NSTextAlignmentCenter;
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label2.mas_bottom).with.offset(80);
        make.centerX.equalTo(wSelf);
        make.width.equalTo(self.upLabel);
    }];
    
    //自己的按钮
    self.scrollView.userInteractionEnabled=YES;
    self.downBtn.userInteractionEnabled=YES;
    self.downBtn=[UIButton new];
    self.downBtn.tag=890;
    [self.scrollView addSubview:self.downBtn];
    [self.downBtn setTitle:@"添加指标" forState:UIControlStateNormal];
    [self.downBtn setTitleColor:[Tools colorWithHexString:@"#A8A8AA" withAlpha:1] forState:UIControlStateNormal];
    [self.downBtn setTitleColor:[Tools colorWithHexString:@"f3f3f4" withAlpha:1] forState:UIControlStateHighlighted];
    [self.downBtn addTarget:self action:@selector(ADDSelf:) forControlEvents:UIControlEventTouchUpInside];
    [self.downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.downLabel.mas_bottom).with.offset(20);
        make.centerX.equalTo(wSelf);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@30);
    }];
    self.scrollView.contentSize=CGSizeMake(SCREEN_WIDTH, 667);
}
-(void)ADDSelf:(UIButton *)sender{
    NSLog(@"点我干嘛");
 
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
