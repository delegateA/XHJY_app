//
//  AddPlanViewController.h
//  XHJY_app
//
//  Created by admin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NotificationBlock) ();
@interface AddPlanViewController : UIViewController
@property(nonatomic,copy)NotificationBlock block;
@end
