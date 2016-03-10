//
//  BarView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "BarView.h"

@implementation BarView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        pictureheaderView *pv = [[pictureheaderView alloc]initWithFrame:CGRectMake(0, 0 , SCREEN_WIDTH, 35) withPage:@"Icon_event_s.png" withMessage:@"事件告警统计" withDetailStr:@""];
        [self addSubview:pv];
        
        
        _chartView = [[BarChartView alloc]initWithFrame:CGRectMake(0,  35 + 10, SCREEN_WIDTH, self.bounds.size.height - 20 - 35)];
        _chartView.descriptionText = @"时间";
        _chartView.noDataTextDescription = @"You need to provide data for the chart.";
        
        _chartView.maxVisibleValueCount = 60;
        _chartView.pinchZoomEnabled = NO;
        _chartView.drawGridBackgroundEnabled = NO;
        _chartView.drawBarShadowEnabled = NO;
        _chartView.drawValueAboveBarEnabled = NO;
        
        ChartYAxis *leftAxis = _chartView.leftAxis;
        leftAxis.valueFormatter = [[NSNumberFormatter alloc] init];
        leftAxis.valueFormatter.maximumFractionDigits = 1;
        leftAxis.labelTextColor = [Tools colorWithHexString:@"#9b9b9b" withAlpha:1];
        leftAxis.customAxisMin = 0.0; // this replaces startAtZero = YES
        leftAxis.customAxisMax = 10.0;
        _chartView.rightAxis.enabled = NO;
        
        ChartXAxis *xAxis = _chartView.xAxis;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.drawGridLinesEnabled = NO;
        xAxis.labelTextColor = [Tools colorWithHexString:@"#9b9b9b" withAlpha:1];
        
        
        ChartLegend *l = _chartView.legend;
        l.position = ChartLegendPositionAboveChartRight;
        l.form = ChartLegendFormSquare;
        l.formSize = 8.0;
        l.formToTextSpace = 4.0;
        l.xEntrySpace = 6.0;
        
        [self addSubview:_chartView];
        
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
