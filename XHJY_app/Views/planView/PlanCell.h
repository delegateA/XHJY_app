//
//  PlanCell.h
//  XHJY_app
//
//  Created by admin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlanCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *DrugPng;
@property (weak, nonatomic) IBOutlet UILabel *DrugName;
@property (weak, nonatomic) IBOutlet UIImageView *OnorOff;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Time;
@property (weak, nonatomic) IBOutlet UILabel *Times;
@property (weak, nonatomic) IBOutlet UIImageView *TimeImage;
- (IBAction)TureOrNot:(UISwitch *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *TimesImg;
@end
