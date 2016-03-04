//
//  EquipmentMessageTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "EquipmentMessageTableViewCell.h"

@implementation EquipmentMessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lineView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
    self.MessageLabel.textColor= [UIColor blackColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
