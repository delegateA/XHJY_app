//
//  ZHRampView.m
//  颜色渐变
//
//  Created by hao on 15/12/28.
//  Copyright © 2015年 周豪. All rights reserved.
//

#import "ZHRampView.h"

@implementation ZHRampView
- (id)initWithFrame:(CGRect)frame withColors:(NSArray *)colors withScale:(float)scale
{
    self = [super initWithFrame:frame];
    if (self) {
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.frame;
        NSMutableArray *colorArr = [NSMutableArray array];
        for (int i = 0; i<colors.count ; i++) {
            UIColor *rColor = colors[i];
            CGColorRef cgColor = rColor.CGColor;
            [colorArr addObject:(__bridge id _Nonnull)(cgColor)];
        }
        gradient.colors = [NSArray arrayWithArray:colorArr];
        if (scale>0.5) {
        gradient.startPoint=CGPointMake(0,0);
        gradient.endPoint=CGPointMake(1.5-scale,0);
        }else{
            gradient.startPoint=CGPointMake(scale,0);
            gradient.endPoint=CGPointMake(1,0);
        }
        gradient.cornerRadius=10;
        [self.layer insertSublayer:gradient atIndex:0];
    }

    return self;
}


@end
