//
//  EquipmentTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "EquipmentTableViewCell.h"

@implementation EquipmentTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.pointView.layer.cornerRadius = 5;
    self.pointView.clipsToBounds = YES;
    self.pointView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    
    self.nameLabel.textColor = [Tools colorWithHexString:@"#222222" withAlpha:1];
    
    [self.messageBtn setTitle:@"数据助手" forState:UIControlStateNormal];
    [self.messageBtn  setTitleColor:[Tools colorWithHexString:@"#222222" withAlpha:1] forState:UIControlStateNormal];
    [self.messageBtn setBackgroundColor:RGBCOLOR(248, 248, 248)];
    [self.messageBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    
    [self.detailBtn setTitle:@"设备详情" forState:UIControlStateNormal];
    [self.detailBtn  setTitleColor:[Tools colorWithHexString:@"#222222" withAlpha:1] forState:UIControlStateNormal];
    [self.detailBtn setBackgroundColor:RGBCOLOR(248, 248, 248)];
    [self.detailBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
