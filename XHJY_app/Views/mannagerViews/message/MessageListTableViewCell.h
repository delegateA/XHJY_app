//
//  MessageListTableViewCell.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageListTableViewCell : UITableViewCell
@property(nonatomic,copy)UIView *lineView;
@property(nonatomic,copy)UIView *pointView;
@property(nonatomic,copy)UILabel *nameLabel;
@property(nonatomic,copy)UILabel *timeLabel;
@property(nonatomic,copy)UILabel *tmLabel;
@property(nonatomic,copy)UILabel *detailLabel;
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier;
-(void)setIntroductionText:(NSString*)text;
@end
