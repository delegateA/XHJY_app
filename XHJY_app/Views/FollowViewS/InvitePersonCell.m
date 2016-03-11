//
//  InvitePersonCell.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/11.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "InvitePersonCell.h"

@implementation InvitePersonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *line = [[UIView alloc]initWithFrame: CGRectMake(0, 79, SCREEN_WIDTH, 1)];
        line.backgroundColor = [Tools  colorWithHexString:@"#f3f3f3" withAlpha:1];
        [self.contentView addSubview:line];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(85 + 25 + 42,  21, SCREEN_WIDTH - 85 - 25 - 42, 15)];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_label];
        
        _labelSmall = [[UILabel alloc]initWithFrame:CGRectMake(85 + 25 + 42, 44, SCREEN_WIDTH - 85 - 25 - 42, 24)];
        _labelSmall.textColor = [Tools  colorWithHexString:@"#aeaeae" withAlpha:1];
        _labelSmall.font = [UIFont systemFontOfSize:14];
        _labelSmall.text = @"100000";
        _label.numberOfLines = 0;
        [self.contentView addSubview:_labelSmall];
        
        
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn.frame = CGRectMake(25, 20, 42, 42);
        _btn.layer.cornerRadius = 21;
        _btn.layer.borderWidth = 1;
        _btn.layer.borderColor = [Tools  colorWithHexString:@"#f3f3f3" withAlpha:1].CGColor;
        _btn.backgroundColor = [UIColor whiteColor];
        _btn.clipsToBounds = YES;
        [self.contentView addSubview:_btn];
        
        
        _aImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25 + (42 - 24) / 2, 20 + (42 - 24) / 2 , 25, 25)];
        _aImageView.image = ImageNamed(@"icon_sure");
        [self.contentView addSubview:_aImageView];
        
        
        _logoIMageVIew = [[UIImageView alloc]initWithFrame:CGRectMake(25 + 25 + 42, 20, 42, 42)];
        _logoIMageVIew.backgroundColor = [UIColor whiteColor];
        _logoIMageVIew.layer.cornerRadius = 21;
        _logoIMageVIew.clipsToBounds = YES;
        [self.contentView addSubview:_logoIMageVIew];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
