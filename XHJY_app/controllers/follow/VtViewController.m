//
//  VtViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/8.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "VtViewController.h"
#import "AlarmAnalysiscell.h"

@interface VtViewController()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)UILabel *aLbel;
@property(nonatomic,copy)UILabel *bLbel;
@property(nonatomic,copy)UILabel *cLbel;
@property(nonatomic,copy)UILabel *numLabel;
@property(nonatomic,copy)UITableView *tableView;
@end


@implementation VtViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUIinterfece];
}

- (void)setUIinterfece
{
    self.closeBtn.hidden = NO;
    self.topTittle.text = @"室性事件统计";
    self.baseView.backgroundColor = [Tools colorWithHexString:@"#ff2e63" withAlpha:1];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40 + 122 - 14 - 22)];
    topView.backgroundColor = [Tools colorWithHexString:@"#ff2e63" withAlpha:1];
    [self.view addSubview:topView];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 100 - 30, 40)];
    label.text = @"事件类别统计:";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentLeft;
    [topView addSubview:label];
    
    for (int i = 0; i < 2; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 108 + (85 - 14 - 22) * i , SCREEN_WIDTH, 1)];
        line.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
        [self.view addSubview:line];
    }
    
    NSArray *array = @[@"心动过速",@"早博",@"颤动"];
    UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 109 + 14, 132 / 2, 22)];
    firstLabel.text = array[0];
    firstLabel.textColor = [UIColor whiteColor];
    firstLabel.layer.cornerRadius = 5;
    firstLabel.layer.borderWidth = 1;
    firstLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    firstLabel.clipsToBounds = YES;
    firstLabel.font = [UIFont systemFontOfSize:15];
    firstLabel.adjustsFontSizeToFitWidth = YES;
    firstLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:firstLabel];
    
    
    UILabel *xLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + 132 / 2 + 6, 109 + 14, 12, 22)];
    xLabel.text = @"X";
    xLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:xLabel];
    
    
    for (int i = 0; i < 2; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15 + 132 / 2 + 57 + (57 + 82 / 2) * i, 109 + 14, 82 / 2, 22)];
        label.text = array[i + 1];
        label.textColor = [UIColor whiteColor];
        label.layer.cornerRadius = 5;
        label.layer.borderWidth = 1;
        label.layer.borderColor = [UIColor whiteColor].CGColor;
        label.clipsToBounds = YES;
        label.font = [UIFont systemFontOfSize:15];
        label.adjustsFontSizeToFitWidth = YES;
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        
        
        UILabel *yLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + 132 / 2 + 57 +50 +  100 * i, 109 + 14, 12, 22)];
        yLabel.text = @"X";
        yLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:yLabel];
    }
    
    self.aLbel.text = @"3";
    self.bLbel.text = @"4";
    self.cLbel.text = @"4";
    
    NSString *strA = @"总计:  18  次";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:strA];
   
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize: 20] range:NSMakeRange(5, 2)];
    self.numLabel.attributedText = str;
    
    [self.tableView reloadData];
}

- (UILabel *)aLbel
{
    if (!_aLbel) {
        _aLbel = [[UILabel alloc]initWithFrame:CGRectMake(15 + 132 / 2 + 6 + 12 + 6, 109 + 14, 25, 22)];
        _aLbel.textColor = [UIColor whiteColor];
        _aLbel.textAlignment = NSTextAlignmentCenter;
        _aLbel.adjustsFontSizeToFitWidth = YES;
         [self.view addSubview:_aLbel];
    }
    
    return _aLbel;
}

- (UILabel *)bLbel
{
    if (!_bLbel) {
        
        _bLbel = [[UILabel alloc]initWithFrame:CGRectMake(15 + 132 / 2 + 57 +50 + 12, 109 + 14, 25, 22)];
        _bLbel.textColor = [UIColor whiteColor];
        _bLbel.textAlignment = NSTextAlignmentLeft;
        _bLbel.adjustsFontSizeToFitWidth = YES;
        [self.view addSubview:_bLbel];
    }
    return _bLbel;
}

- (UILabel *)cLbel
{
    if (!_cLbel) {
        
        _cLbel = [[UILabel alloc]initWithFrame:CGRectMake(15 + 132 / 2 + 57 +50 + 12 + 100, 109 + 14, 25, 22)];
        _cLbel.textColor = [UIColor whiteColor];
        _cLbel.textAlignment = NSTextAlignmentLeft;
        _cLbel.adjustsFontSizeToFitWidth = YES;
         [self.view addSubview:_cLbel];
    }
    return _cLbel;
}

- (UILabel *)numLabel
{
    if (!_numLabel) {
        
        _numLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 108 + (85 - 14 - 22) + 1 , SCREEN_WIDTH - 50, 35)];
        _numLabel.textAlignment = NSTextAlignmentLeft;
        _numLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_numLabel];
        
    }
    
    return _numLabel;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + 40 + 122 - 14 - 22, SCREEN_WIDTH, SCREEN_HEIGHT - (64 + 40 + 122 - 14 - 22))];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 92;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[AlarmAnalysiscell class] forCellReuseIdentifier:@"AlarmAnalysiscell"];
        [self.view addSubview:_tableView];
        
    }
    
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CELLIDENTIFIER = @"AlarmAnalysiscell";
    AlarmAnalysiscell *cell = [tableView dequeueReusableCellWithIdentifier:CELLIDENTIFIER];
    if (!cell) {
        
        cell = [[AlarmAnalysiscell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLIDENTIFIER];
    }
    
    cell.leftLabel.text = @"心动过速";
    cell.timeLabel.text = @"04:00:09";
    cell.label.text = @"持续时间:00:10:00";
    cell.numberLabel.text = @"心搏数:2130";
    
    return cell;
    
}


@end
