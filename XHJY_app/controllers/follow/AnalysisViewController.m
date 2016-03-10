//
//  AnalysisViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "AnalysisViewController.h"
#import "CalandarViewController.h"
#import "AlarmAnalysisViewController.h"
#import "pictureheaderView.h"
#import <Charts/Charts.h>
#import "BottomView.h"
#import "SuperChartView.h"
#import "PieView.h"
#import "CombonedView.h"
#import "BarView.h"
#import "LineView.h"

@interface AnalysisViewController ()
@property(nonatomic,copy)UIScrollView *scrollView;
@property(nonatomic,copy)UILabel *messageLabel;
/**
 *  平均心率
 */
@property(nonatomic,copy)LineView *lineChartView;
/**
 *  事件告警统计
 */
@property(nonatomic,copy)BarView *chartView;
/**
 *  资源积累/消耗
 */
@property(nonatomic,copy)CombonedView *combinedChartView;
/**
 *  运动消耗
 */
@property(nonatomic,copy)PieView *pieCHartView;
@property(nonatomic,copy)BottomView *bottomView;
@property(nonatomic,copy)SuperChartView *superChartView;
@property(nonatomic,assign)NSInteger selectType;
@end

@implementation AnalysisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.selectType = 0;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadDay:) name:@"selectDay" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadMonth:) name:@"selectMonth" object:nil];
    
    
    [self setUIinterface];
}

- (void)setUIinterface
{
    self.baseView.backgroundColor = [UIColor whiteColor];
    self.closeBtn.hidden = NO;
    [self.closeBtn setBackgroundImage:ImageNamed(@"btn_close_g_normal") forState:UIControlStateNormal];
    [self.closeBtn setBackgroundImage:ImageNamed(@"btn_close_g_press") forState:UIControlStateHighlighted];
    self.topTittle.text = @"2016-03-05";
    self.topTittle.textColor = [UIColor blackColor];
    
    self.addBtn.hidden = NO;
    [self.addBtn setBackgroundImage:ImageNamed(@"btn_alarm_b_normal") forState:UIControlStateNormal];
     [self.addBtn setBackgroundImage:ImageNamed(@"btn_alarm_b_press") forState:UIControlStateHighlighted];

    NSInteger w = 120;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setBackgroundColor:[UIColor blackColor]];
     button.bounds = CGRectMake(0, 0, 30, 30);
     button.center = CGPointMake(SCREEN_WIDTH / 2 + w / 2 + 15, 20 + 22);
     [self.view addSubview:button];
     [button addTarget:self action:@selector(selelctTime:) forControlEvents:UIControlEventTouchUpInside];
    
    
    for (int i = 0; i < 2; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 64 + 35 * i, SCREEN_WIDTH, 1)];
        line.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
        [self.view addSubview:line];
    }
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 35 + 90 + 35 + 330 + (35 + 290) * 2 + 35 + 500);
    self.messageLabel.text = @"1、指具有机翼、一具或多具发动机的靠自身动力驱动前进. \n2、指具有机翼、一具或多具发动机的靠自身动力驱动前进.";
    pictureheaderView *pc = [self.scrollView viewWithTag:13];
    pc.label.text = @"总能量消耗:25000KCal";
    
    
    
    
    [self lineData];
    [self BarData];
    [self setCombinedData];
    [self setPieData];
//    [self setSuperBarData];
    
}

- (void)loadDay:(id)sender
{
    if (self.selectType == 0) {
        
    }
    else
    {
        self.chartView.hidden = NO;
        self.combinedChartView.hidden = NO;
        self.superChartView.hidden = YES;
    
        self.pieCHartView.frame = CGRectMake(self.pieCHartView.frame.origin.x, self.pieCHartView.frame.origin.y + 290 + 35, SCREEN_WIDTH, self.pieCHartView.frame.size.height);
        self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x, self.bottomView.frame.origin.y + 290 + 35, SCREEN_WIDTH, self.bottomView.frame.size.height);
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.scrollView.contentSize.height + 290 + 35);
    }
    self.selectType = 0;
}

- (void)loadMonth:(id)sender
{
    if (self.selectType == 1) {
        
    }
    else
    {
        self.chartView.hidden = YES;
        self.combinedChartView.hidden = YES;
        self.superChartView.hidden = NO;
        [self setSuperBarData];
        self.pieCHartView.frame = CGRectMake(self.pieCHartView.frame.origin.x, self.pieCHartView.frame.origin.y - 290 - 35, SCREEN_WIDTH, self.pieCHartView.frame.size.height);
        self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x, self.bottomView.frame.origin.y - 290 - 35, SCREEN_WIDTH, self.bottomView.frame.size.height);
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.scrollView.contentSize.height - 290 -35);
    }
    self.selectType = 1;
}

/**
 *  lineData
 */
- (void)lineData
{
    //************************线***************************//
    int count = 24;
    double range = 150;
    
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        [xVals addObject:[@(i) stringValue]];
    }
    
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        double mult = range / 3.0;
        double val = (double) (arc4random_uniform(mult) + 5);
        [yVals addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    
    LineChartDataSet *set1 = [[LineChartDataSet alloc] initWithYVals:yVals label:@"运动强度"];
    set1.axisDependency = AxisDependencyLeft;
    [set1 setColor:[Tools colorWithHexString:@"#918dff" withAlpha:1]];
    [set1 setCircleColor:UIColor.whiteColor];
    set1.lineWidth = 2.0;
    set1.circleRadius = 3.0;
    set1.fillAlpha = 65/255.0;
    set1.fillColor = [Tools colorWithHexString:@"#e3fcf3" withAlpha:1];
    set1.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
    set1.drawCircleHoleEnabled = NO;
    
    NSMutableArray *yVals2 = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        double mult = range / 2;
        double val = (double) (arc4random_uniform(mult)) + 50;
        [yVals2 addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    
    LineChartDataSet *set2 = [[LineChartDataSet alloc] initWithYVals:yVals2 label:@"平均心率"];
    set2.axisDependency = AxisDependencyLeft;
    [set2 setColor:[Tools colorWithHexString:@"45ccb9" withAlpha:1]];
    [set2 setCircleColor:UIColor.whiteColor];
    set2.lineWidth = 2.0;
    set2.circleRadius = 3.0;
    set2.fillAlpha = 65/255.0;
    set2.fillColor = [Tools colorWithHexString:@"#e9fffb" withAlpha:1];
    set2.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
    set2.drawCircleHoleEnabled = NO;
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set2];
    [dataSets addObject:set1];
    
    LineChartData *data = [[LineChartData alloc] initWithXVals:xVals dataSets:dataSets];
    [data setValueTextColor:UIColor.whiteColor];
    [data setValueFont:[UIFont systemFontOfSize:9.f]];
    
    self.lineChartView.lineChartView.data = data;
    for (id<ILineChartDataSet> set in _lineChartView.lineChartView.data.dataSets)
    {
        set.drawFilledEnabled = YES;
        
        set.drawCirclesEnabled = NO;
        
        set.drawValuesEnabled = NO;
        
        set.drawCubicEnabled = YES;
    }
}


/**
 *  barData
 */
- (void)BarData
{
    
    //*****************************Bar***************************************************************//
    
    NSMutableArray *xbVals = [[NSMutableArray alloc] init];
    int bcount = 24;
    for (int i = 0; i < bcount; i++)
    {
        [xbVals addObject:[[NSString alloc]initWithFormat:@"%d",i]];
    }
    
    NSMutableArray *ybVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < bcount; i++)
    {
        double mult = (3);
        double val1 = (double) (arc4random_uniform(mult) + mult / 3);
        double val2 = (double) (arc4random_uniform(mult) + mult / 3);
        if (i == 2) {
            val2 = 0;
        }
        
        
        [ybVals addObject:[[BarChartDataEntry alloc] initWithValues:@[@(val1), @(val2)] xIndex:i]];
    }

    BarChartDataSet *set = [[BarChartDataSet alloc] initWithYVals:ybVals label:@""];
    set.colors = @[[Tools colorWithHexString:@"#ff3566" withAlpha:1],[Tools colorWithHexString:@"#ffca53" withAlpha:1]];
    set.stackLabels = @[@"告警",@"事件"];
    
    NSMutableArray *dataSet = [[NSMutableArray alloc] init];
    [dataSet addObject:set];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.maximumFractionDigits = 1;
    //    formatter.negativeSuffix = @" $";
    //    formatter.positiveSuffix = @" $";
    
    BarChartData *bdata = [[BarChartData alloc] initWithXVals:xbVals dataSets:dataSet];
    [bdata setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:7.f]];
    [bdata setValueFormatter:formatter];
    
    self.chartView.chartView.data = bdata;
    for (id<IBarChartDataSet> set in _chartView.chartView.data.dataSets)
    {
        set.drawValuesEnabled = NO;
    }

}




/**
 *  comBined
 */
- (void)setCombinedData
{
    //****************************Comboned*************************************\\
    
    int ccount = 24;
    double crange = 150;
    
    NSMutableArray *cxVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < ccount; i++)
    {
        [cxVals addObject:[@(i) stringValue]];
    }
    
    NSMutableArray *cyVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < ccount / 2; i++)
    {
        double mult = crange / 20.0;
        double val = (double) (arc4random_uniform(mult) + 5);
        [cyVals addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    
    LineChartDataSet *cset1 = [[LineChartDataSet alloc] initWithYVals:cyVals label:@"压力"];
    cset1.axisDependency = AxisDependencyLeft;
    [cset1 setColor:[Tools colorWithHexString:@"#918dff" withAlpha:1]];
    [cset1 setCircleColor:UIColor.whiteColor];
    cset1.lineWidth = 2.0;
    cset1.circleRadius = 3.0;
    cset1.fillAlpha = 1;
    cset1.fillColor = [Tools colorWithHexString:@"#918dff" withAlpha:1];
    cset1.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
    cset1.drawCircleHoleEnabled = NO;
    
    NSMutableArray *cyVals2 = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < ccount; i++)
    {
        double mult = crange / 2;
        double val = (double) (arc4random_uniform(mult) / 2) + 5;
        [cyVals2 addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    
    LineChartDataSet *cset2 = [[LineChartDataSet alloc] initWithYVals:cyVals2 label:@"资源积累"];
    cset2.axisDependency = AxisDependencyLeft;
    [cset2 setColor:[UIColor blackColor]];
    [cset2 setCircleColor:UIColor.whiteColor];
    cset2.lineWidth = 2.0;
    cset2.circleRadius = 3.0;
    cset2.fillAlpha = 1;
    cset2.fillColor = [UIColor clearColor];
    cset2.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
    cset2.drawCircleHoleEnabled = NO;
    
    NSMutableArray *cdataSets = [[NSMutableArray alloc] init];
    [cdataSets addObject:cset2];
    [cdataSets addObject:cset1];
    
    LineChartData *cdata = [[LineChartData alloc] initWithXVals:cxVals dataSets:cdataSets];
    [cdata setValueTextColor:UIColor.whiteColor];
    [cdata setValueFont:[UIFont systemFontOfSize:9.f]];
    
    self.combinedChartView.combinedChartView.data = cdata;
    for (id<ILineChartDataSet> set in _combinedChartView.combinedChartView.data.dataSets)
    {
        set.drawFilledEnabled = YES;
        
        set.drawCirclesEnabled = NO;
        
        set.drawValuesEnabled = NO;
        
        set.drawCubicEnabled = YES;
    }
}

/**
 *  pie
 */

- (void)setPieData
{
    //*******************************Pie********************************************//
    
    
    
    NSArray *parties = @[
                         @"Party A", @"Party B", @"Party C", @"Party D", @"Party E", @"Party F",
                         @"Party G", @"Party H", @"Party I", @"Party J", @"Party K", @"Party L",
                         @"Party M", @"Party N", @"Party O", @"Party P", @"Party Q", @"Party R",
                         @"Party S", @"Party T", @"Party U", @"Party V", @"Party W", @"Party X",
                         @"Party Y", @"Party Z"
                         ];
    
    
    double mult = 8;
    
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    
    // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
    for (int i = 0; i < 4; i++)
    {
        [yVals1 addObject:[[BarChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 4) xIndex:i]];
    }
    
    NSMutableArray *pxVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 4; i++)
    {
        [pxVals addObject:parties[i]];
    }
    
    PieChartDataSet *pdataSet = [[PieChartDataSet alloc] initWithYVals:yVals1 label:@"Election Results"];
    
    pdataSet.sliceSpace = 2.0;
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObjectsFromArray:ChartColorTemplates.vordiplom];
    [colors addObjectsFromArray:ChartColorTemplates.joyful];
    [colors addObjectsFromArray:ChartColorTemplates.colorful];
    [colors addObjectsFromArray:ChartColorTemplates.liberty];
    [colors addObjectsFromArray:ChartColorTemplates.pastel];
    [colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
    
    pdataSet.colors = colors;
    
    PieChartData *pdata = [[PieChartData alloc] initWithXVals:pxVals dataSet:pdataSet];
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [pdata setValueFormatter:pFormatter];
    [pdata setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
    [pdata setValueTextColor:UIColor.whiteColor];
    
    self.pieCHartView.pieCHartView.data = pdata;
    [self.pieCHartView.pieCHartView highlightValues:nil];
    
    
    self.bottomView.hidden = NO;
}
/**
 *  月资源数据
 */

- (void)setSuperBarData
{
    NSArray<NSDictionary *> *dataList = @[
                                          @{@"xIndex": @(0),
                                            @"yValue": @(-1.8f),
                                            @"xValue": @"1"},
                                          @{@"xIndex": @(1),
                                            @"yValue": @(1.5f),
                                            @"xValue": @"2"},
                                          @{@"xIndex": @(2),
                                            @"yValue": @(1.0f),
                                            @"xValue": @"3"},
                                          @{@"xIndex": @(3),
                                            @"yValue": @(-1.3f),
                                            @"xValue": @"4"},
                                          @{@"xIndex": @(4),
                                            @"yValue": @(-1.1f),
                                            @"xValue": @"5"},
                                          ];
    
    NSMutableArray<BarChartDataEntry *> *values = [[NSMutableArray alloc] init];
    NSMutableArray<NSString *> *dates = [[NSMutableArray alloc] init];
    NSMutableArray<UIColor *> *colors = [[NSMutableArray alloc] init];
    
    UIColor *green = [Tools colorWithHexString:@"#56d2c2" withAlpha:1];
    UIColor *red = [Tools colorWithHexString:@"#ff3566" withAlpha:1];
    
    for (int i = 0; i < dataList.count; i++)
    {
        NSDictionary *d = dataList[i];
        BarChartDataEntry *entry = [[BarChartDataEntry alloc] initWithValue:[d[@"yValue"] doubleValue] xIndex:[d[@"xIndex"] integerValue]];
        [values addObject:entry];
        
        [dates addObject:d[@"xValue"]];
        
        // specific colors
        if ([d[@"yValue"] doubleValue] >= 0.f)
        {
            [colors addObject:red];
        }
        else
        {
            [colors addObject:green];
        }
    }
    
    BarChartDataSet *set = [[BarChartDataSet alloc] initWithYVals:values label:@"Values"];
    set.barSpace = 0.4f;
    set.colors = colors;
    set.valueColors = colors;
    
    BarChartData *data = [[BarChartData alloc] initWithXVals:dates dataSet:set];
    [data setValueFont:[UIFont systemFontOfSize:13.f]];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.maximumFractionDigits = 1;
    [data setValueFormatter:formatter];
    
    self.superChartView.superChartView.data = data;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_scrollView];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 30, 35)];
        label.font = [UIFont systemFontOfSize:20];
        label.text = @"健康分析";
        label.textAlignment = NSTextAlignmentLeft;
        [_scrollView addSubview:label];
        
    }
    return _scrollView;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 35, SCREEN_WIDTH - 30, 90)];
        _messageLabel.font = [UIFont systemFontOfSize:15];
        _messageLabel.textColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        _messageLabel.numberOfLines = 0;
        _messageLabel.textAlignment = NSTextAlignmentLeft;
        [_scrollView addSubview:_messageLabel];
        
    }
    
    return _messageLabel;
}

- (LineView *)lineChartView
{
    if (!_lineChartView) {
        
        _lineChartView = [[LineView alloc]initWithFrame:CGRectMake(0, 90 + 35 + 15, SCREEN_WIDTH, 300 + 35 + 30)];
        [_scrollView addSubview:_lineChartView];
        
    }
    
    return _lineChartView;
}

- (BarView *)chartView
{
    if (!_chartView) {
        
        _chartView = [[BarView alloc]initWithFrame:CGRectMake(0, 90 + 35 + 35 + 330, SCREEN_WIDTH, 290 + 35)];
        
        
        [_scrollView addSubview:_chartView];
        
    }
    
    return _chartView;
}


- (CombonedView *)combinedChartView
{
    if (!_combinedChartView) {
        
     
        _combinedChartView = [[CombonedView alloc]initWithFrame:CGRectMake(0, 90 + 35 + 35 + 330 + 35 + 290 , SCREEN_WIDTH, 290 + 35)];
       
        [_scrollView addSubview:_combinedChartView];
        
        
       
    }
    return _combinedChartView;
}

- (PieView *)pieCHartView
{
    if (!_pieCHartView) {
        
        _pieCHartView = [[PieView alloc]initWithFrame:CGRectMake(0, 90 + 35 + 35 + 330 + 35 + 290 + 35 + 290, SCREEN_WIDTH, 200 + 20 + 35)];
        [_scrollView addSubview:_pieCHartView];
    }
    
    return _pieCHartView;
}

- (SuperChartView *)superChartView
{
    if (!_superChartView) {
        
        _superChartView = [[SuperChartView alloc]initWithFrame:CGRectMake(0, 90 + 35 + 35 + 330 , SCREEN_WIDTH, 290 + 35)];
        [_scrollView addSubview:_superChartView];
        
    }
    return _superChartView;
}


- (UIView *)bottomView
{
    if (!_bottomView) {
        
        //0, 90 + 35 + 35 + 330 + 35 + 290 + 35 + 290 + 35 + 10, SCREEN_WIDTH, 200
        
        _bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, 90 + 35 + 35 + 330 + 35 + 290 + 35 + 290 + 35 + 220, SCREEN_WIDTH, 225)];
            
            [_scrollView addSubview:_bottomView];
            
        }

    return _bottomView;
    
}


/**
 *  选时间
 *
 *  @param sender
 */
- (void)selelctTime:(UIButton *)sender
{
    CalandarViewController *vc = [[CalandarViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
/**
 *  警告分析
 *
 *  @param sender
 */
- (void)rightBtnClicked:(UIButton *)sender
{
    AlarmAnalysisViewController *vc = [[AlarmAnalysisViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}





@end
