//
//  SelectViewController.h
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^sendBlock) (NSString *);
@interface SelectViewController : UIViewController

@property(nonatomic,copy)sendBlock block;
@end
