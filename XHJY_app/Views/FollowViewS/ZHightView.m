//
//  ZZHDateView.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ZHightView.h"
#import "UIColor+HexString.h"

@interface ZHightView ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIView *mainView;
    UIPickerView *pickerVIew;
}
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,copy)NSMutableArray *dataArray;
@end

@implementation ZHightView

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withDataSource:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.selectIndex = -1;
        _dataArray = [[NSMutableArray alloc]initWithArray:array];
        UIView *backGroundView = [[UIView alloc]initWithFrame:self.frame];
        backGroundView.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
        [self addSubview:backGroundView];
        
        mainView = [[UIView alloc]init];
        mainView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT + mainView.bounds.size.height);
        mainView.bounds = CGRectMake(0, 0, SCREEN_WIDTH, 210);
        mainView.backgroundColor = [UIColor whiteColor];
        [backGroundView addSubview:mainView];
        
        pickerVIew = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 180)];
        pickerVIew.delegate = self;
        pickerVIew.dataSource = self;
        [mainView addSubview:pickerVIew];
        
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        sureBtn.frame = CGRectMake(SCREEN_WIDTH / 4 * 3, 0, SCREEN_WIDTH / 4, 30);
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(selectTime:) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setTitleColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1] forState:UIControlStateNormal];
        [mainView addSubview:sureBtn];
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH / 2, 30)];
        titleLabel.text = title;
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.textColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [mainView addSubview:titleLabel];
        
    }
    
    return self;
}


- (void)selectTime:(UIButton *)sender
{
    [self hidden];
    if (self.calendarBlock)
    {
        self.calendarBlock(self.selectIndex);
    }
    
}

- (void)show
{
    [UIView animateWithDuration:0.5 animations:^{
        
        mainView.center = mainView.center =  CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT - mainView.bounds.size.height / 2);

    }];
}

- (void)hidden
{
    [UIView animateWithDuration:0.5 animations:^{
        
        mainView.center = mainView.center =  CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT + mainView.bounds.size.height * 2);
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            
        }
    }];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return  self.dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.dataArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectIndex = row;
}

@end
