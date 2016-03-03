//
//  CreatFileTableViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "CreatFileTableViewCell.h"

@implementation CreatFileTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lineView.backgroundColor = RGBACOLOR(245, 245, 245, 1);
    [self.messageTextField setBorderStyle:UITextBorderStyleNone];
    self.messageTextField.textColor = [UIColor grayColor];
//    self.messageTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.selectBtn.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)selectType:(id)sender {
}

@end
