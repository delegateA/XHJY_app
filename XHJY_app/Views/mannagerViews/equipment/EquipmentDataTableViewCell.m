//
//  EquipmentDataTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "EquipmentDataTableViewCell.h"

@implementation EquipmentDataTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.pointView.layer.cornerRadius = 5;
    self.lineView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
    self.pointView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    [self.leftBtn setBackgroundImage:ImageNamed(@"icon_upload_press") forState:UIControlStateHighlighted];
    self.bottomLabel.textColor = [UIColor lightGrayColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
