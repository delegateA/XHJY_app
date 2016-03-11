//
//  AlarmView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AlarmView.h"

@implementation AlarmView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _typeView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 28, 22, 22)];
        
        //#ff3266       //#ffbf15        //#fff000
        _typeView.image = ImageNamed(@"attitude_run_r.png");
        _typeView.layer.cornerRadius = 11;
        [self addSubview:_typeView];
        
        
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(35 + 20, 30, 100, 17)];
        _leftLabel.text = @"红色警告";
        _leftLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:_leftLabel];
        
        
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 225, 30, 200, 17)];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
        _timeLabel.text = @"2016 - 08 - 24 14:00:00";
        [self addSubview:_timeLabel];
        
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(35 + 20, 30 + 17 + 12, 100, 17)];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
        _label.text = @"持续时间:00::00:00.162";
        _label.numberOfLines = 0;
        _label.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:_label];
        
        
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 125, 30 + 17 + 12 ,100, 17)];
        _numberLabel.font = [UIFont systemFontOfSize:14];
        _numberLabel.textAlignment = NSTextAlignmentRight;
        _numberLabel.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
        _numberLabel.text = @"90";
        [self addSubview:_numberLabel];
        
        
        UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, 30 + 17 + 12 + 17 + 25, SCREEN_WIDTH, 20)];
        redView.backgroundColor = [Tools colorWithHexString:@"#ff2e63" withAlpha:1];
        [self addSubview:redView];
        
        
        _startTime = [[UILabel alloc]initWithFrame:CGRectMake(15, 30 + 17 + 12 + 17 + 25, 150, 20)];
        _startTime.textColor = [UIColor whiteColor];
        _startTime.text = @"04:33:22";
        [self addSubview:_startTime];
        
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(SCREEN_WIDTH - 80, 30 + 17 + 12 + 17 + 25, 40, 20);
        _btn.backgroundColor = [UIColor blackColor];
        [self addSubview:_btn];
        
        
        
        _startLine = [[lineChart alloc]initWithFrame:CGRectMake(0, 30 + 17 + 12 + 17 + 25 + 20 + 10, SCREEN_WIDTH, 160)];
        [self addSubview:_startLine];
        
        
        UIView *redbView = [[UIView alloc]initWithFrame:CGRectMake(0, 30 + 17 + 12 + 17 + 25 + 20 + 180, SCREEN_WIDTH, 20)];
        redbView.backgroundColor = [Tools colorWithHexString:@"#ff2e63" withAlpha:1];
        [self addSubview:redbView];
        
        
        
        _endLine = [[lineChart alloc]initWithFrame:CGRectMake(0, 30 + 17 + 12 + 17 + 25 + 20 + 180 + 20 + 10 , SCREEN_WIDTH, 160)];
        [self addSubview:_endLine];

        _endTime = [[UILabel alloc]initWithFrame:CGRectMake(15, 30 + 17 + 12 + 17 + 25 + 20 + 180, 150, 20)];
        _endTime.textColor = [UIColor whiteColor];
        _endTime.text = @"04:36:22";
        [self addSubview:_endTime];
        
        
    }
    return self;
}
@end
