//
//  BottomView.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "BottomView.h"
#import "BottomTableViewCell.h"

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageArray =  [[NSArray alloc]initWithObjects:@"sleep.png",@"sit.png",@"walk.png",@"run.png",@"hurry.png", nil ];
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[BottomTableViewCell class] forCellReuseIdentifier:@"BottomTableViewCell"];
        _tableView.rowHeight = 51;
        [self addSubview:_tableView];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 31, 20)];
        label.text = @"类型";
        label.textColor = [Tools colorWithHexString:@"#afafaf" withAlpha:1];
        label.adjustsFontSizeToFitWidth = YES;
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        
        NSArray *messageArray = @[@"持续时间",@"消耗卡路里"];
        for (int i = 1; i < 3; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0 + SCREEN_WIDTH / 3 * i, 0, SCREEN_WIDTH / 3, 20)];
            label.text = messageArray[i - 1];
            label.textColor = [Tools colorWithHexString:@"#afafaf" withAlpha:1];
            label.textAlignment = NSTextAlignmentCenter;
            [view addSubview:label];
        }
        _tableView.tableHeaderView = view;
        
    }
    return self;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *cellidentifer = @"BottomTableViewCell";
    BottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifer];
    if(!cell)
    {
        cell = [[BottomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifer];
    }

    cell.image.image = ImageNamed(self.imageArray[indexPath.row]);
    
    cell.alabel.text = @"KKKK";
    cell.blabel.text = @"CCCC";
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
