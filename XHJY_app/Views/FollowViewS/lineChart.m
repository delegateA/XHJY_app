//
//  lineChart.m
//  梁晓斌demo
//
//  Created by mac on 16/3/9.
//  Copyright © 2016年 xiuzhu. All rights reserved.
//

#import "lineChart.h"


@interface lineChart () {
    
    NSMutableArray *_ECGYArray;//心电图y坐标
    BOOL _isLabelSet;
}


@end

@implementation lineChart

-(instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _ECGYArray = [NSMutableArray array];
        _isLabelSet = NO;
    }
    return self;
}

-(void)setArc:(double)arc {
    
    NSInteger Xheight = self.bounds.size.height / 4;
    
    _arc = arc;
    double yECG = 2.0 - arc;
    //每0.1 ＝ 5dp
    //y坐标
    double _y =  yECG * Xheight;
    
    NSInteger Ynum = (self.bounds.size.width - 26) / 31;
    
    [_ECGYArray insertObject:[NSNumber numberWithDouble:_y] atIndex:0];
    if ([_ECGYArray count] > 5 * (Ynum - 1) + 1) {
        
        [_ECGYArray removeLastObject];//最多56个点
    }
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    UIColor *color = [UIColor colorWithRed:251/255.0 green:173/255.0 blue:195/255.0 alpha:1];
    [color set];

    
    NSInteger Ynum = (self.bounds.size.width - 26) / 31;
    NSInteger Xnum =  9;
    NSInteger  Xheight = self.bounds.size.height / 8;
    
    //先画出背景格子 248 * 342
    //先画粗线 粗线间隔：31 粗线直径：2  横竖12根粗线   左侧线距左边26

    NSMutableArray *verticalArray = [NSMutableArray array];//竖线粗线的点
    //竖线12
    
    
    
    for (int i = 0; i < Ynum; i++) {
        
        NSInteger x = 26 + 31 * i;
        [verticalArray addObject:[NSNumber numberWithInteger:x]];
        CGContextMoveToPoint(context, x,0);
        CGContextAddLineToPoint(context, x, Xheight * (Xnum - 1));
    }
    
    NSMutableArray *horizontalArray = [NSMutableArray array];
    //横线9
    for (int i = 0; i < Xnum; i++) {
        
        NSInteger y =  Xheight * i;
        [horizontalArray addObject:[NSNumber numberWithInteger:y]];
        CGContextMoveToPoint(context, 26 , y);
        CGContextAddLineToPoint(context, 26 + 31 * (Ynum - 1), y);
    }
    //渲染
    CGContextStrokePath(context);

    
    //再画出细线
    CGContextSetLineWidth(context, 1);

    NSMutableArray *ECGXArray = [NSMutableArray array];//心电图的x坐标
    //细线竖线
    for (int i = 0; i < [verticalArray count] - 1; i++) {
        //每一根竖线粗线的x值
        NSInteger x = [[verticalArray objectAtIndex:i] integerValue];
        [ECGXArray addObject:[NSNumber numberWithInteger:x]];

        //计算细线的x值
        x += 2 + 5;//每一个格子第一根细线的x值
        
        for (int i = 0; i < 4; i++) {
            [ECGXArray addObject:[NSNumber numberWithInteger:x + 6 * i]];
            CGContextMoveToPoint(context, x + 6 * i, 0);
            CGContextAddLineToPoint(context, x + 6 * i, Xheight * (Xnum - 1));
        }
    }
    [ECGXArray addObject:[verticalArray lastObject]];
    
    //细线横线
    for (int i = 0 ; i < [horizontalArray count] - 1; i++) {
        //每一根横线粗线的y值
        NSInteger y = [[horizontalArray objectAtIndex:i] integerValue];
        y += 2 + (Xheight - 2) / 5;
        for (int i = 0; i < 4; i++) {
            CGContextMoveToPoint(context, 26 , y + Xheight / 5 * i);
            CGContextAddLineToPoint(context, 26 + 31 * (Ynum - 1), y + (Xheight - 2) / 5 * i);
        }
    }
    
    CGContextStrokePath(context);

    
    if (!_isLabelSet) {
        //左边的数字
        NSArray *leftArray = @[@"2.0",@"1.5",@"1.0",@"0.5",@"0",@"-0.5",@"-1.0",@"-1.5",@"-2.0",];
        for (int i = 0; i < [leftArray count]; i++) {
            
            NSInteger y = [[horizontalArray objectAtIndex:i] integerValue];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 24, 10)];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:10];
            label.text = [leftArray objectAtIndex:i];
            label.center = CGPointMake(label.center.x, y);
            [self addSubview:label];
        }
        
        _isLabelSet = YES;
    }

    //心电图画图
    CGContextSetLineWidth(context, 1);
    color = [UIColor blackColor];
    [color set];

    if ([_ECGYArray count] == 0) {
        return;
    }
    double _y = [[_ECGYArray objectAtIndex:0]doubleValue];
    NSInteger _x = [ECGXArray[0]integerValue];
    CGContextMoveToPoint(context, _x, _y);
    for (int i = 0; i < [_ECGYArray count]; i++) {
        double _y = [[_ECGYArray objectAtIndex:i]doubleValue];
        NSInteger _x = [ECGXArray[i]integerValue];
        CGContextAddLineToPoint(context, _x, _y);
    }
    
    CGContextStrokePath(context);
    
}


@end
