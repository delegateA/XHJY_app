//
//  pictureheaderView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "pictureheaderView.h"

@implementation pictureheaderView

- (id)initWithFrame:(CGRect)frame withPage:(NSString *)page withMessage:(NSString *)string withDetailStr:(NSString *)detail
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        UIImageView *imageVIew = [[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 25, 25)];
        imageVIew.image = ImageNamed(page);
        [self addSubview:imageVIew];
        
        
        UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(15 + 25 + 15, 0, 200, 35)];
        messageLabel.font = [UIFont systemFontOfSize:20];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.textAlignment = NSTextAlignmentLeft;
        messageLabel.text = string;
        messageLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:messageLabel];
        
       
            
        _label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 15 - 200, 0, 200, 35)];
        _label.font = [UIFont systemFontOfSize:20];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentRight;
        _label.text = detail;
        _label.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_label];
        
        
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
