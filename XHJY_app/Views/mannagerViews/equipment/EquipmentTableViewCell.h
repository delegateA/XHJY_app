//
//  EquipmentTableViewCell.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "batteryImageView.h"

@interface EquipmentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *pointView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet batteryImageView *statusImage;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;
@property (weak, nonatomic) IBOutlet UIButton *detailBtn;

@end
