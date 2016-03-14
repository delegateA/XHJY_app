//
//  ZZHDateView.h
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZSexPickerViewDelegate <NSObject>

-(void)getSelectSex:(NSString *)Sex;

@end

@interface ZSexView : UIView
+(ZSexView*)instanceDatePickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *DrugClass;
- (IBAction)cannelBtn:(UIButton *)sender;
- (IBAction)sureBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *backgView;
@property(nonatomic,weak)id<ZSexPickerViewDelegate>delegate;
@end
