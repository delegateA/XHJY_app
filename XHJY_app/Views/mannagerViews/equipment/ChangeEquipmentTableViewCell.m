//
//  ChangeEquipmentTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ChangeEquipmentTableViewCell.h"

@implementation ChangeEquipmentTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.leftView.backgroundColor = RGBCOLOR(248, 248, 248);
    self.lineView.backgroundColor = RGBCOLOR(245, 245, 245);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
