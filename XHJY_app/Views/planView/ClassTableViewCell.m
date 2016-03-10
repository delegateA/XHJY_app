//
//  ClassTableViewCell.m
//  XHJY_app
//
//  Created by admin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ClassTableViewCell.h"

@implementation ClassTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)DelegateBtn:(UIButton *)sender {
    if (self.block1) {
        self.block1();
    }
}

- (IBAction)NameText:(UITextField *)sender {
    
}
@end
