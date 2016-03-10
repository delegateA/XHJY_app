//
//  ClassHeaderTableViewCell.h
//  XHJY_app
//
//  Created by admin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block)();
@interface ClassHeaderTableViewCell : UITableViewCell

- (IBAction)ADDBtn:(UIButton *)sender;
@property(nonatomic,copy)Block block;
@end
