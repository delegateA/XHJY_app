//
//  ZZHDateView.h
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZDatePickerViewDelegate <NSObject>

-(void)getSelectWeight:(NSString *)weight;

@end

@interface ZDateView : UIView
+(ZDateView*)instanceDatePickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *DrugClass;
- (IBAction)cannelBtn:(UIButton *)sender;
- (IBAction)sureBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *backgView;
@property(nonatomic,weak)id<ZDatePickerViewDelegate>delegate;
@end
