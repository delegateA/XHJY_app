//
//  SuperChartView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "SuperChartView.h"

@implementation SuperChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
                
        pictureheaderView *pv = [[pictureheaderView alloc]initWithFrame:CGRectMake(0, 0 , SCREEN_WIDTH, 35) withPage:@"Icon-_resources.png" withMessage:@"资源积累/消耗" withDetailStr:@""];
        [self addSubview:pv];
        
        _superChartView = [[BarChartView alloc]initWithFrame:CGRectMake(0,  35 + 10, SCREEN_WIDTH, self.bounds.size.height - 35 - 20)];
        
        _superChartView.descriptionText = @"";
        _superChartView.noDataTextDescription = @"You need to provide data for the chart.";
        
        _superChartView.drawGridBackgroundEnabled = NO;
        
        _superChartView.dragEnabled = YES;
        [_superChartView setScaleEnabled:YES];
        _superChartView.pinchZoomEnabled = NO;
        
        
        
        _superChartView.drawBarShadowEnabled = NO;
        _superChartView.drawValueAboveBarEnabled = YES;
        
        
        // scaling can now only be done on x- and y-axis separately
        _superChartView.pinchZoomEnabled = NO;
        
        _superChartView.drawGridBackgroundEnabled = NO;
        
        ChartXAxis *xAxis = _superChartView.xAxis;
        xAxis.labelPosition = XAxisLabelPositionBottomInside;
        xAxis.labelFont = [UIFont systemFontOfSize:13.f];
        xAxis.drawGridLinesEnabled = NO;
        xAxis.drawAxisLineEnabled = NO;
        xAxis.spaceBetweenLabels = 2.0;
        xAxis.labelTextColor = [UIColor lightGrayColor];
        
        ChartYAxis *leftAxis = _superChartView.leftAxis;
        leftAxis.drawLabelsEnabled = YES;
        leftAxis.spaceTop = 0.25f;
        leftAxis.spaceBottom = 0.25f;
        leftAxis.drawAxisLineEnabled = YES;
        leftAxis.drawGridLinesEnabled = NO;
        leftAxis.drawZeroLineEnabled = YES;
        leftAxis.zeroLineColor = UIColor.grayColor;
        leftAxis.zeroLineWidth = 0.7f;
        leftAxis.customAxisMax = 2.2;
        leftAxis.customAxisMin = -2.2;
        
        _superChartView.rightAxis.enabled = NO;
        _superChartView.legend.enabled = NO;
        
        [self addSubview:_superChartView];
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
