//
//  ZZHDateView.h
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZHDatePickerViewDelegate <NSObject>

-(void)getSelectDate:(NSString *)date;

@end

@interface ZZHDateView : UIView
+(ZZHDateView*)instanceDatePickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *DrugClass;
- (IBAction)cannelBtn:(UIButton *)sender;
- (IBAction)sureBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *backgView;
@property(nonatomic,weak)id<ZZHDatePickerViewDelegate>delegate;
@end
