//
//  BottomTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "BottomTableViewCell.h"

@implementation BottomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.image = [[UIImageView alloc]initWithFrame:CGRectMake(25, 20, 31, 31)];
        [self.contentView addSubview:self.image];
        
        
        self.alabel = [[UILabel alloc]init];
        self.alabel.center = CGPointMake(SCREEN_WIDTH / 2, 20 + 15);
        self.alabel.bounds = CGRectMake(0, 0, 200, 20);
        self.alabel.textColor = [Tools colorWithHexString:@"#afafaf" withAlpha:1];
        self.alabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.alabel];
        
        self.blabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 25 - 100, 20, 100, 30)];
        self.blabel.textColor = [Tools colorWithHexString:@"#afafaf" withAlpha:1];
        self.blabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.blabel];
        
    
    }
    return self;
}

@end
