//
//  TimeTableViewCell.h
//  XHJY_app
//
//  Created by admin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *GetTime;

- (IBAction)Time:(UITextField *)sender;
@end
