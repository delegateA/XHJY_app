//
//  AlarmViewTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AlarmViewTableViewCell.h"

@implementation AlarmViewTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.contentView.backgroundColor = [Tools colorWithHexString:@"#F8F8F9" withAlpha:1];
        
        self.leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, 100, 45)];
        self.rightLabel.textAlignment = NSTextAlignmentLeft;
        self.leftLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.leftLabel];
        
        
        self.rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 0, 50, 45)];
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.rightLabel];
        
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 1)];
        lineView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
        [self.contentView addSubview:lineView];
        
    }
    return self;
}
@end
