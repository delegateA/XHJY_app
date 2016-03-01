//
//  ManageBtn.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ManageBtn.h"

@implementation ManageBtn

-(UIImageView *)buttonImg {
    
    if (!_buttonImg) {
        _buttonImg = [[UIImageView alloc]init];
        _buttonImg.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height / 4);
        _buttonImg.bounds = CGRectMake(0, 0, 22 * SCREEN_WIDTH / 375, 22 * SCREEN_WIDTH / 375);
        [self addSubview:_buttonImg];
    }
    return _buttonImg;
}

-(UILabel *)buttonName {
    
    if (!_buttonName) {
        _buttonName = [[UILabel alloc]init];
        _buttonName.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height * 3 / 4);
        _buttonName.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height / 4);
        _buttonName.font = [UIFont systemFontOfSize:16 * SCREEN_WIDTH / 375];
        _buttonName.textColor = [UIColor whiteColor];
        _buttonName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_buttonName];
    }
    return _buttonName;
}

@end
