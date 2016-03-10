//
//  SZCalendarCell.m
//  SZCalendarPicker
//
//  Created by Stephen Zhuang on 14/12/1.
//  Copyright (c) 2014年 Stephen Zhuang. All rights reserved.
//

#import "SZCalendarCell.h"

@implementation SZCalendarCell
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width)];
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont systemFontOfSize:17]];
        [_dateLabel setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}

//- (UIView *)circleView
//{
//    if (!_circleView) {
//        
//        _circleView = [[UIView alloc]init];
//        _circleView.bounds = CGRectMake(0, 0, 10, 10);
//        _circleView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - 10);
//        _circleView.layer.cornerRadius = 5;
//        _circleView.clipsToBounds = YES;
//        _circleView.backgroundColor = [UIColor whiteColor];
//        [self addSubview:_circleView];
//    }
//    return _circleView;
//}
@end
