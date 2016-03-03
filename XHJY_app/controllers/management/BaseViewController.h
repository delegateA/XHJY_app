//
//  BaseViewController.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property(nonatomic,retain)UIButton *backBtn;
@property(nonatomic,retain)UIButton *closeBtn;
@property(nonatomic,retain)UILabel *topTittle;
@property(nonatomic,retain)UIButton *addBtn;
@property(nonatomic,retain)UIButton *rightBtn;
- (void)rightBtnClicked:(UIButton *)sender;
@end
