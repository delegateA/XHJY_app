//
//  FamilyListTableViewCell.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamilyListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headIMage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *typeIMage;
@property (weak, nonatomic) IBOutlet UILabel *smallLabel;
@property (weak, nonatomic) IBOutlet UILabel *bigLabel;
@property (weak, nonatomic) IBOutlet UIView *line;

@end
