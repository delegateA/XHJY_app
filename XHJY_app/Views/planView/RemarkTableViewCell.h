//
//  RemarkTableViewCell.h
//  XHJY_app
//
//  Created by admin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemarkTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *RemarkStr;
- (IBAction)ReMarkEdting:(UITextField *)sender;

@end
