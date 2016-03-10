//
//  TimesTableViewCell.h
//  XHJY_app
//
//  Created by admin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TimesBlock) ();
@interface TimesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TimesStr;
- (IBAction)TimesBtn:(UIButton *)sender;
@property(nonatomic,copy)TimesBlock block;
@end
