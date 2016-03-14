//
//  ZZHDateView.h
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ZDateView : UIView
/**
 *  返回的id
 */
@property (nonatomic, copy) void(^messageBlock)(NSInteger age);
- (id)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array;
- (void)show;
- (void)hidden;
@end
