//
//  PieView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _pv = [[pictureheaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35) withPage:@"Icon_sprot.png" withMessage:@"运动消耗" withDetailStr:@""];
        [self addSubview:_pv];
        
        _pieCHartView = [[PieChartView alloc]initWithFrame:CGRectMake(0,  35 + 10, SCREEN_WIDTH, self.bounds.size.height - 35 - 20)];
        _pieCHartView.usePercentValuesEnabled = YES;
        _pieCHartView.drawSlicesUnderHoleEnabled = NO;
        _pieCHartView.holeRadiusPercent = 0.58;
        _pieCHartView.transparentCircleRadiusPercent = 0.61;
        _pieCHartView.descriptionText = @"";
        [_pieCHartView setExtraOffsetsWithLeft:5.f top:10.f right:5.f bottom:5.f];
        
        _pieCHartView.drawCenterTextEnabled = YES;
        
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"iOS Charts\nby Daniel Cohen Gindi"];
        [centerText setAttributes:@{
                                    NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f],
                                    NSParagraphStyleAttributeName: paragraphStyle
                                    } range:NSMakeRange(0, centerText.length)];
        [centerText addAttributes:@{
                                    NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:10.f],
                                    NSForegroundColorAttributeName: UIColor.grayColor
                                    } range:NSMakeRange(10, centerText.length - 10)];
        [centerText addAttributes:@{
                                    NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:10.f],
                                    NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]
                                    } range:NSMakeRange(centerText.length - 19, 19)];
        _pieCHartView.centerAttributedText = centerText;
        
        _pieCHartView.drawHoleEnabled = YES;
        _pieCHartView.rotationAngle = 0.0;
        _pieCHartView.rotationEnabled = YES;
        _pieCHartView.highlightPerTapEnabled = YES;
        
        ChartLegend *l = _pieCHartView.legend;
        l.position = ChartLegendPositionRightOfChart;
        l.xEntrySpace = 7.0;
        l.yEntrySpace = 0.0;
        l.yOffset = 0.0;
        
        [_pieCHartView animateWithXAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
        
        [self addSubview:_pieCHartView];
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
