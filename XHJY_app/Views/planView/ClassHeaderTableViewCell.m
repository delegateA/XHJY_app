//
//  ClassHeaderTableViewCell.m
//  XHJY_app
//
//  Created by admin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ClassHeaderTableViewCell.h"

@implementation ClassHeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)ADDBtn:(UIButton *)sender {
    NSLog(@"ooo");
    if(self.block){
        self.block();
    }
}
@end
