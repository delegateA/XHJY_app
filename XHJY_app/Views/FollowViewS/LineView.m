//
//  LineView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "LineView.h"

@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        pictureheaderView *pv = [[pictureheaderView alloc]initWithFrame:CGRectMake(0, 0 , SCREEN_WIDTH, 35) withPage:@"icon_event.png" withMessage:@"平均心率" withDetailStr:@""];
        [self addSubview:pv];
        
        _lineChartView = [[LineChartView alloc]initWithFrame:CGRectMake(0,  35 + 15, SCREEN_WIDTH, self.bounds.size.height - 35 - 30)];
        _lineChartView.descriptionText = @"时间";
        _lineChartView.noDataTextDescription = @"You need to provide data for the chart.";
        
        _lineChartView.dragEnabled = NO;
        [_lineChartView setScaleEnabled:YES];
        _lineChartView.drawGridBackgroundEnabled = NO;
        _lineChartView.pinchZoomEnabled = YES;
        
        _lineChartView.backgroundColor = [UIColor whiteColor];
        
        _lineChartView.legend.form = ChartLegendFormLine;
        _lineChartView.legend.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.f];
        _lineChartView.legend.textColor = UIColor.blackColor;
        _lineChartView.legend.position =  ChartLegendPositionAboveChartRight;
        
        
        ChartXAxis *xAxis = _lineChartView.xAxis;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.labelFont = [UIFont systemFontOfSize:12.f];
        xAxis.labelTextColor = [Tools colorWithHexString:@"#9b9b9b" withAlpha:1];
        xAxis.drawGridLinesEnabled = NO;
        xAxis.drawAxisLineEnabled = NO;
        xAxis.spaceBetweenLabels = 1.0;
        
        ChartYAxis *leftAxis = _lineChartView.leftAxis;
        leftAxis.labelTextColor = [Tools colorWithHexString:@"#9b9b9b" withAlpha:1];
        leftAxis.customAxisMax = 150.0;
        leftAxis.customAxisMin = 0.0;
        leftAxis.drawGridLinesEnabled = YES;
        leftAxis.drawZeroLineEnabled = YES;
        
        
        _lineChartView.rightAxis.enabled = NO;
        
        [_lineChartView animateWithXAxisDuration:0.5];
        [self addSubview:_lineChartView];
       
        
        
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
