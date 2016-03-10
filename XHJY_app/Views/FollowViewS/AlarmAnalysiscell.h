//
//  AlarmAnalysiscell.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/8.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmAnalysiscell : UITableViewCell

@property(nonatomic,copy)UIImageView *typeView;//图标
@property(nonatomic,copy)UILabel *leftLabel; //名字
@property(nonatomic,copy)UILabel *timeLabel;//时间
@property(nonatomic,copy)UILabel *label;//持续时间
@property(nonatomic,copy)UILabel *numberLabel;//次数

@end
