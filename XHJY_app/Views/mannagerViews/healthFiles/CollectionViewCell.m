//
//  CollectionViewCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 70, 70)];
        
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, 22, 22);
        _button.layer.cornerRadius = 11;
        _button.clipsToBounds = YES;
       
        [_button setBackgroundImage:ImageNamed(@"btn_close_s_normal") forState:UIControlStateNormal];
        [_button setBackgroundImage:ImageNamed(@"btn_close_s_press") forState:UIControlStateHighlighted];
        
       
        [self.contentView addSubview:_imageView];
        [self.contentView addSubview:_button];
    }
    return self;
}
@end
