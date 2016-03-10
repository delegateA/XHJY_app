//
//  batteryImageView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/10.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "batteryImageView.h"
#import "UIImage+RTTint.h"

@implementation batteryImageView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _numberView = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 22, 8)];
        [self addSubview:_numberView];
        
        UIImage *image = ImageNamed(@"battery");
        self.image = [image rt_tintedImageWithColor:[Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1]];
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       
        
    }
    return self;
}

- (void)loadViewWithNumber:(NSInteger)num
{
    self.numberView.frame = CGRectMake(1, 1, 22 * num / 100, 8);
    if (num >= 65) {
        
        self.numberView.backgroundColor = [UIColor greenColor];
    }
    else if(num >= 30)
    {
        self.numberView.backgroundColor = [UIColor orangeColor];
        
    }
    else
    {
        self.numberView.backgroundColor = [UIColor redColor];
    }
}

@end
