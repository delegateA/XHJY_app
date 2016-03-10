//
//  SelectTableViewCell.h
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectLabel;
@property(nonatomic,assign)BOOL isSelect;
@end
