//
//  tabBarButton.m
//  showzhu
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "tabBarButton.h"
#import "Tools.h"

@implementation tabBarButton

-(UIImageView *)buttonImg {

    if (!_buttonImg) {
        _buttonImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 8, 23, 23)];
        _buttonImg.center = CGPointMake(self.bounds.size.width/2.0, _buttonImg.center.y);
        [self addSubview:_buttonImg];
    }
    return _buttonImg;
}

-(UILabel *)buttonName {
    
    if (!_buttonName) {
        _buttonName = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.buttonImg.frame) + 3, self.frame.size.width, 10)];
        _buttonName.center = CGPointMake(self.bounds.size.width/2.0, _buttonName.center.y);
        _buttonName.font = [UIFont systemFontOfSize:11];
        _buttonName.textColor = [UIColor whiteColor];
        _buttonName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_buttonName];
    }
    return _buttonName;
}



@end
