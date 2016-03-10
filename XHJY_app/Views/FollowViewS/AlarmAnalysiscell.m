//
//  AlarmAnalysiscell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/8.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AlarmAnalysiscell.h"

@implementation AlarmAnalysiscell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _typeView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 28, 22, 22)];
        
        //#ff3266       //#ffbf15        //#fff000
        _typeView.image = ImageNamed(@"attitude_run_r.png");
        _typeView.layer.cornerRadius = 11;
        [self.contentView addSubview:_typeView];
        
        
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(35 + 20, 30, 100, 17)];
        _leftLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_leftLabel];
        
        
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 225, 30, 200, 17)];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
        [self.contentView addSubview:_timeLabel];
        
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(35 + 20, 30 + 17 + 12, 200, 17)];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
        _label.numberOfLines = 0;
        _label.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_label];
        
        
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 125, 30 + 17 + 12 ,100, 17)];
        _numberLabel.font = [UIFont systemFontOfSize:14];
        _numberLabel.textAlignment = NSTextAlignmentRight;
        _numberLabel.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
        [self.contentView addSubview:_numberLabel];
       
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 91, SCREEN_WIDTH, 1)];
        line.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
        [self.contentView addSubview:line];
        
    }
    return self;
}
@end
