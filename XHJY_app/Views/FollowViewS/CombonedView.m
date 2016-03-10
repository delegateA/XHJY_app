//
//  CombonedView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "CombonedView.h"

@implementation CombonedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        pictureheaderView *pv = [[pictureheaderView alloc]initWithFrame:CGRectMake(0, 0 , SCREEN_WIDTH, 35) withPage:@"Icon-_resources.png" withMessage:@"资源积累/消耗" withDetailStr:@""];
        [self addSubview:pv];
        
        _combinedChartView = [[LineChartView alloc]initWithFrame:CGRectMake(0, 35 + 10, SCREEN_WIDTH, self.bounds.size.height - 20 - 35)];
        _combinedChartView.descriptionText = @"";
        _combinedChartView.noDataTextDescription = @"You need to provide data for the chart.";
        
        _combinedChartView.drawGridBackgroundEnabled = NO;
        
        
        _combinedChartView.legend.form = ChartLegendFormLine;
        _combinedChartView.legend.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.f];
        _combinedChartView.legend.textColor = UIColor.blackColor;
        _combinedChartView.legend.position =  ChartLegendPositionAboveChartRight;
        
        _combinedChartView.rightAxis.enabled = NO;
        
        ChartYAxis *leftAxis = _combinedChartView.leftAxis;
        leftAxis.drawGridLinesEnabled = NO;
        leftAxis.customAxisMin = 0.0; // this replaces startAtZero = YES
        
        ChartXAxis *xAxis = _combinedChartView.xAxis;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        [self addSubview:_combinedChartView];
        
        
        ChartLegend *l = _combinedChartView.legend;
        l.position = ChartLegendPositionAboveChartRight;
        l.form = ChartLegendFormSquare;
        l.formSize = 8.0;
        l.formToTextSpace = 4.0;
        l.xEntrySpace = 6.0;
        
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
