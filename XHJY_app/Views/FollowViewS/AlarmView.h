//
//  AlarmView.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmView : UIView
@property(nonatomic,copy)UIImageView *typeView;//图标
@property(nonatomic,copy)UILabel *leftLabel; //名字
@property(nonatomic,copy)UILabel *timeLabel;//时间
@property(nonatomic,copy)UILabel *label;//持续时间
@property(nonatomic,copy)UILabel *numberLabel;//次数
@property(nonatomic,copy)UILabel *startTime;//开始时间
@property(nonatomic,copy)UILabel *endTime;//开始时间
@property(nonatomic,copy)UIView *startView;//开始界面
@property(nonatomic,copy)UIView *endView;//结束界面
@property(nonatomic,copy)UIButton *btn;
@end
