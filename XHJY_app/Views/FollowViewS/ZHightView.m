//
//  ZZHDateView.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ZHightView.h"
#import "UIColor+HexString.h"

@interface ZHightView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) NSString *selectDate;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UIButton *deleButton;

@property (strong, nonatomic) NSDictionary *pickerDic;
@property (strong, nonatomic) NSArray *provinceArray;
@property (strong, nonatomic) NSArray *selectedArray;
@property (strong, nonatomic) NSString *sureStr;

@end

@implementation ZHightView

+(ZHightView *)instanceDatePickerView{
    NSArray *nibView=[[NSBundle mainBundle]loadNibNamed:@"ZHightView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

- (IBAction)cannelBtn:(UIButton *)sender {
    // 开始动画
    [self animationbegin:sender];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)sureBtn:(UIButton *)sender {
    // 开始动画
    [self animationbegin:sender];
    NSString *str1=[self.provinceArray objectAtIndex:[self.DrugClass selectedRowInComponent:0]];
   
    self.sureStr=[NSString stringWithFormat:@"%@",str1];
    
    //delegate
    [self.delegate getSelectHight:self.sureStr];
    
    
    [self cannelBtn:nil];
}

- (void)awakeFromNib
{
    self.backgView.layer.cornerRadius = 5;
    self.backgView.layer.borderWidth = 1;
    self.backgView.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.backgView.layer.masksToBounds = YES;
    
    /** 确定 */
    self.sureButton.layer.cornerRadius = 3;
    self.sureButton.layer.borderWidth = 1;
    self.sureButton.layer.borderColor = [[UIColor colorwithHexString:@"00D9C4"] CGColor];
    self.sureButton.layer.masksToBounds = YES;
    
    /** 取消按钮 */
    self.deleButton.layer.cornerRadius = 3;
    self.deleButton.layer.borderWidth = 1;
    self.deleButton.layer.borderColor = [[UIColor colorwithHexString:@"BAB9B9"] CGColor];
    self.deleButton.layer.masksToBounds = YES;
    
    self.DrugClass.delegate=self;
    self.DrugClass.dataSource=self;
    [self getPickerData];
}


- (void)animationbegin:(UIView *)view {
    /* 放大缩小 */
    
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 动画选项设定
    animation.duration = 0.1; // 动画持续时间
    animation.repeatCount = -1; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:0.9]; // 结束时的倍率
    
    // 添加动画
    [view.layer addAnimation:animation forKey:@"scale-layer"];
    
}

//选择器
- (void)getPickerData {
    NSMutableArray *arr=[NSMutableArray new];
    for (int i=0; i<170; i++) {
        NSString *str=[NSString stringWithFormat:@"%d cm",50+i];
        [arr addObject:str];
    }
    self.provinceArray =[arr copy];
   
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
 
        return self.provinceArray.count;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  
        return [self.provinceArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  
        self.selectedArray = [self.pickerDic objectForKey:[self.provinceArray objectAtIndex:row]];
   
   
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 110;
    } else if (component == 1) {
        return 100;
    } else {
        return 110;
    }
}

@end
