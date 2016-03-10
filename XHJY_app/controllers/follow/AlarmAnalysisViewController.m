//
//  AlarmAnalysisViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/8.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AlarmAnalysisViewController.h"
#import "AlarmAnalysiscell.h"
#import "HorizontalMenu.h"
#import "AlarmViewTableViewCell.h"

@interface AlarmAnalysisViewController()<HorizontalMenuDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)UIView *headerView;
@property(nonatomic,copy)UITableView *tableView;
@property(nonatomic,assign)NSInteger selectIndex;
@end

@implementation AlarmAnalysisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.closeBtn.hidden = NO;
    self.topTittle.text = @"事件/告警";
    self.selectIndex = 0;
    self.baseView.backgroundColor = [Tools colorWithHexString:@"#ff2e63" withAlpha:1];
    self.headerView.backgroundColor = [Tools colorWithHexString:@"#ff2e63" withAlpha:1];
    self.tableView.hidden = NO;
}

- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 61)];
        _headerView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [self.view addSubview:_headerView];
        
        HorizontalMenu *menu = [[HorizontalMenu alloc]initWithFrame:CGRectMake(0, 17, SCREEN_WIDTH, 44) withTitles:@[@"告警",@"事件"]];
        menu.delegate = self;
        menu.selectLine.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [_headerView addSubview:menu];
        
    }
    return _headerView;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 125, SCREEN_WIDTH, SCREEN_HEIGHT - 125)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[AlarmAnalysiscell class] forCellReuseIdentifier:@"AlarmAnalysiscell"];
        [_tableView registerClass:[AlarmViewTableViewCell class] forCellReuseIdentifier:@"AlarmViewTableViewCell"];
        [self.view addSubview:_tableView];
        
    }
    
    return _tableView;
}


#pragma mark------------HorizontalMenuDelegate
- (void)clieckButton:(UIButton *)button
{
    self.selectIndex = button.tag;
    [self.tableView reloadData];
}


#pragma mark------------UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.selectIndex == 0) {
        
        static NSString *cellidentifier = @"AlarmViewTableViewCell";
        AlarmViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
        if (!cell) {
            cell = [[AlarmViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        }
        
        cell.leftLabel.text = @"房形早博";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"3 次"];
        [str addAttribute:NSForegroundColorAttributeName value:[Tools colorWithHexString:@"#afafb0" withAlpha:1] range:NSMakeRange(2,1)];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(2, 1)];
        cell.rightLabel.attributedText = str;
        
        
        return cell;
    }
    else
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
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectIndex == 0) {
       
        return 45;
    }
    else
    {
        return  92;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (self.selectIndex == 0) {
        CGFloat height = [Tools heightForString:@"您的身体出现--------------------------的问题" andWidth:SCREEN_WIDTH - (35 +20 + 25)];
        
        return 110 - 30 + height;

    }
    else
    {
        return 25;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.selectIndex == 0) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110)];
        view.backgroundColor = [UIColor whiteColor];
        
        
        UIImageView *typeView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 33, 10, 10)];
        
        //#ff3266       //#ffbf15        //#fff000
        typeView.backgroundColor = [Tools colorWithHexString:@"#ff3266" withAlpha:1];
        typeView.layer.cornerRadius = 5;
        [view addSubview:typeView];
        
        
        UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(35 + 20, 30, 100, 17)];
        leftLabel.text = @"红色警告";
        leftLabel.font = [UIFont systemFontOfSize:18];
        [view addSubview:leftLabel];
        
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 225, 30, 200, 17)];
        timeLabel.font = [UIFont systemFontOfSize:14];
        timeLabel.textAlignment = NSTextAlignmentRight;
        timeLabel.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
        timeLabel.text = @"2016 - 08 - 24 14:00:00";
        [view addSubview:timeLabel];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(35 + 20, 30 + 17 + 12, SCREEN_WIDTH - (35 +20 + 25), 30)];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [Tools colorWithHexString:@"#afafb0" withAlpha:1];
        label.text = @"您的身体出现--------------------------的问题";
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        
        CGFloat height = [Tools heightForString:@"您的身体出现--------------------------的问题" andWidth:SCREEN_WIDTH - (35 +20 + 25)];
        label.frame = CGRectMake(35 + 20, 30 + 17 + 12, SCREEN_WIDTH - (35 +20 + 25), height);
        
        [view addSubview:label];
        return view;
    }
    
    else
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 25)];
        view.backgroundColor = [Tools colorWithHexString:@"#f8f8f9" withAlpha:1];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, SCREEN_WIDTH - 100, 25)];
        label.textColor = [Tools colorWithHexString:@"#666666" withAlpha:1];
        label.text = @"2016.02.03";
        [view addSubview:label];
          return view;
    }
    
}


@end
