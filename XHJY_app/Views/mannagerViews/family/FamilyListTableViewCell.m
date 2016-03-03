//
//  FamilyListTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "FamilyListTableViewCell.h"

@implementation FamilyListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.headIMage.layer.cornerRadius = 25;
    self.headIMage.clipsToBounds = YES;
    self.bigLabel.textColor = [Tools colorWithHexString:@"#b5b5b5" withAlpha:1];
    self.smallLabel.textColor = [Tools colorWithHexString:@"#b5b5b5" withAlpha:1];
    self.line.backgroundColor = [Tools colorWithHexString:@"#f1f1f1" withAlpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
