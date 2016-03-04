//
//  HealthFileTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "HealthFileTableViewCell.h"

@implementation HealthFileTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.verticalLine.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
    self.horizontalLine.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
    self.circleView.layer.cornerRadius = 5;
    self.circleView.clipsToBounds = YES;
    self.circleView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    self.typeLabel.layer.cornerRadius = 5;
    self.typeLabel.textColor = [UIColor whiteColor];
    self.typeLabel.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
