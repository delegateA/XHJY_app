//
//  YearCollectionViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/8.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "YearCollectionViewCell.h"

@implementation YearCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, (NSInteger)self.bounds.size.width - 20, (NSInteger)self.bounds.size.height - 20)];
        _label.textColor = [UIColor whiteColor];
        _label.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        _label.text = @"1";
        _label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
        
        
        _circleView = [[UIView alloc]init];
        _circleView.bounds = CGRectMake(0, 0, 10, 10);
        _circleView.center = CGPointMake(self.center.x, self.center.y + 15);
        _circleView.layer.cornerRadius =  5;
        _circleView.clipsToBounds = YES;
        _circleView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_circleView];
        
        
        
    }
    return self;
}

@end
