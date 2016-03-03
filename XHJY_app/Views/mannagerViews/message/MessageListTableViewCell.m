//
//  MessageListTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "MessageListTableViewCell.h"

@implementation MessageListTableViewCell

-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    [self initLayout];
}

- (void)initLayout
{
    
    _pointView = [[UIView alloc]initWithFrame:CGRectMake(25, 30, 10, 10)];
    _pointView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    _pointView.layer.cornerRadius = 5;
    _pointView.clipsToBounds = YES;
    [self addSubview:_pointView];
    
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(25 + 25 + 10, 30, 100, 14)];
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont systemFontOfSize:18];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_nameLabel];
    
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 100 - 45, 30, 100, 14)];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    _timeLabel.textColor = [UIColor blackColor];
    _timeLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:_timeLabel];
    
    
    _tmLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 40, 34, 40, 8)];
    _tmLabel.textColor = [UIColor grayColor];
    _tmLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_tmLabel];
    
    _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(25 + 25 + 10, 52, SCREEN_WIDTH - 80 - 50 - 10, 40)];
    _detailLabel.textColor = [UIColor grayColor];
    _detailLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_detailLabel];
    
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 1, SCREEN_WIDTH, 1)];
    _lineView.backgroundColor = RGBACOLOR(245, 245, 245, 1);
    [self addSubview:_lineView];
}

-(void)setIntroductionText:(NSString*)text{
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.detailLabel.text = [[NSString alloc]initWithFormat:@"%@",text];
    
    //设置label的最大行数
    self.detailLabel.numberOfLines = 10;
    
    CGFloat height = [Tools heightForString:self.detailLabel.text andWidth:SCREEN_WIDTH - 80 - 50 - 10];
    self.detailLabel.frame = CGRectMake(self.detailLabel.frame.origin.x, self.detailLabel.frame.origin.y, SCREEN_WIDTH - 80 - 50 - 10, height);
    
    //计算出自适应的高度
    frame.size.height = height + 52 + 30 + 1;
    self.lineView.frame = CGRectMake(0, height + 52 + 30, SCREEN_WIDTH, 1);
    self.frame = frame;
}


@end
