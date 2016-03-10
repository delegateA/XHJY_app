//
//  batteryImageView.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/10.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface batteryImageView : UIImageView
@property(nonatomic,copy)UIView *numberView;
- (void)loadViewWithNumber:(NSInteger)num;
@end
