//
//  ZZHDateView.h
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZHightPickerViewDelegate <NSObject>

-(void)getSelectHight:(NSString *)hight;

@end

@interface ZHightView : UIView
+(ZHightView*)instanceDatePickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *DrugClass;
- (IBAction)cannelBtn:(UIButton *)sender;
- (IBAction)sureBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *backgView;
@property(nonatomic,weak)id<ZHightPickerViewDelegate>delegate;
@end
