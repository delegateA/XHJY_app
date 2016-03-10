//
//  pictureheaderView.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pictureheaderView : UIView
@property(nonatomic,copy)UILabel *label;
- (id)initWithFrame:(CGRect)frame withPage:(NSString *)page withMessage:(NSString *)string withDetailStr:(NSString *)detail;
@end
