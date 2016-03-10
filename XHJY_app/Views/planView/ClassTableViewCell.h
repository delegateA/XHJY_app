//
//  ClassTableViewCell.h
//  XHJY_app
//
//  Created by admin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^Block)();
@interface ClassTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *Name;
- (IBAction)DelegateBtn:(UIButton *)sender;
- (IBAction)NameText:(UITextField *)sender;
@property(nonatomic,copy)Block block1;
@end
