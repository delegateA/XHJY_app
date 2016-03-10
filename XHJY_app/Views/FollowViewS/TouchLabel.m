//
//  TouchLabel.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "TouchLabel.h"

@implementation TouchLabel

-(instancetype)init{
    if (self=[super init]) {
        self.userInteractionEnabled=YES;
    }
    return self;


}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.backgroundColor=[UIColor lightGrayColor];

}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.backgroundColor=[UIColor whiteColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
