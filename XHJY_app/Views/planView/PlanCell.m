//
//  PlanCell.m
//  XHJY_app
//
//  Created by admin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "PlanCell.h"

@implementation PlanCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)TureOrNot:(UISwitch *)sender {
    
    if ([sender isOn]) {
        self.TimeImage.image=[UIImage imageNamed:@"icon_time_on"];
        self.TimesImg.image=[UIImage imageNamed:@"icon-_repeat_on"];
        self.OnorOff.image=[UIImage imageNamed:@"blue_on"];
        self.DrugPng.image=[UIImage imageNamed:@"icon_drug_on"];
        self.Name.textColor=[UIColor blackColor];
    }else{
        self.TimeImage.image=[UIImage imageNamed:@"icon_time_off"];
        self.TimesImg.image=[UIImage imageNamed:@"icon-_repeat_off"];
        self.OnorOff.image=[UIImage imageNamed:@"gr_off"];
        self.DrugPng.image=[UIImage imageNamed:@"icon_drug_off"];
        self.Name.textColor=[UIColor darkGrayColor];
    
    
    }
}
@end
