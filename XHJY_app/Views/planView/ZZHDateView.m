//
//  ZZHDateView.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ZZHDateView.h"
#import "UIColor+HexString.h"

@interface ZZHDateView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) NSString *selectDate;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UIButton *deleButton;

@property (strong, nonatomic) NSDictionary *pickerDic;
@property (strong, nonatomic) NSArray *provinceArray;
@property (strong, nonatomic) NSArray *cityArray;
@property (strong, nonatomic) NSArray *townArray;
@property (strong, nonatomic) NSArray *selectedArray;
@property (strong, nonatomic) NSString *sureStr;

@end

@implementation ZZHDateView

+(ZZHDateView *)instanceDatePickerView{
    NSArray *nibView=[[NSBundle mainBundle]loadNibNamed:@"ZZHDateView" owner:nil options:nil];
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
    NSString *str2=[self.cityArray objectAtIndex:[self.DrugClass selectedRowInComponent:1]];
    NSString *str3=[self.townArray objectAtIndex:[self.DrugClass selectedRowInComponent:2]];
    self.sureStr=[NSString stringWithFormat:@"%@ %@ %@;",str1,str2,str3];
    
    //delegate
    [self.delegate getSelectDate:self.sureStr];
    
    
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
    self.sureButton.layer.borderColor = [[UIColor colorwithHexString:@"5AC33B"] CGColor];
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
    self.pickerDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.provinceArray = [self.pickerDic allKeys];
    self.selectedArray = [self.pickerDic objectForKey:[[self.pickerDic allKeys] objectAtIndex:0]];
    
    if (self.selectedArray.count > 0) {
        self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
    }
    
    if (self.cityArray.count > 0) {
        self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
    }
    NSLog(@"------%ld",self.provinceArray.count);
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.townArray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.provinceArray objectAtIndex:row];
    } else if (component == 1) {
        return [self.cityArray objectAtIndex:row];
    } else {
        return [self.townArray objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectedArray = [self.pickerDic objectForKey:[self.provinceArray objectAtIndex:row]];
        if (self.selectedArray.count > 0) {
            self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
        } else {
            self.cityArray = nil;
        }
        if (self.cityArray.count > 0) {
            self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
        } else {
            self.townArray = nil;
        }
    }
    [pickerView selectedRowInComponent:1];
    [pickerView reloadComponent:1];
    [pickerView selectedRowInComponent:2];
    
    if (component == 1) {
        if (self.selectedArray.count > 0 && self.cityArray.count > 0) {
            self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:row]];
        } else {
            self.townArray = nil;
        }
        [pickerView selectRow:1 inComponent:2 animated:YES];
    }
    
    [pickerView reloadComponent:2];
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
