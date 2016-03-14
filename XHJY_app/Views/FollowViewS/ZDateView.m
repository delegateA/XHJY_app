//
//  ZZHDateView.m
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ZDateView.h"
#import "UIColor+HexString.h"

@interface ZDateView ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *mainView;
    UIView *backGroundView;
}

@property(nonatomic,copy)NSMutableArray *dataArray;
;

@end

@implementation ZDateView

- (id)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataArray = [[NSMutableArray alloc]initWithArray:array];
        backGroundView = [[UIView alloc]initWithFrame:self.frame];
        backGroundView.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
        [self addSubview:backGroundView];
        
        mainView = [[UIView alloc]init];
        mainView.backgroundColor = [UIColor whiteColor];
        [backGroundView addSubview:mainView];
        mainView.bounds = CGRectMake(0, 0, 280, 60 + 40 * (array.count - 1));
        mainView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
        
        
        UITableView *tableView = [[UITableView alloc]initWithFrame:mainView.bounds];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [mainView addSubview:tableView];
        
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,  tableView.bounds.size.width, 60)];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 60)];
        label.text = [[NSString alloc]initWithFormat:@"%@",self.dataArray[0]];
        label.textColor = [UIColor blackColor];
        [view addSubview:label];
        
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, tableView.bounds.size.width, 1)];
        line.backgroundColor = [UIColor grayColor];
        [view addSubview:line];
        
        
        tableView.tableHeaderView = view;
                                     
    }
    return self;
}

- (void)show
{
    [self alertAnimation];
    
}

- (void)hidden
{
    [UIView beginAnimations:@"fadein" context:nil];
    [UIView setAnimationDuration:0.35];
    backGroundView.alpha = 0.0;
    [UIView commitAnimations];
    
    [self removeFromSuperview];
}



- (void)showBackGround
{
    
    backGroundView.alpha = 0;
    [UIView beginAnimations:@"fadein" context:nil];
    [UIView setAnimationDuration:0.35];
    backGroundView.alpha = 0.3;
    [UIView commitAnimations];
}

- (void) alertAnimation
{
    
    CAKeyframeAnimation *animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.30;
    animation.removedOnCompletion = NO;
    
    NSMutableArray *values = [[NSMutableArray alloc]init];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(0.9, 0.9, 1.0)]];
     [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(1.1, 1.1, 1.0)]];
     [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
  
    animation.values = values;
    [mainView.layer addAnimation:animation forKey:nil];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        // Create a cell to display an ingredient.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:showUserInfoCellIdentifier];
    }
    
    // Configure the cell.
    cell.textLabel.text= self.dataArray[indexPath.row + 1];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 39, tableView.bounds.size.width, 1)];
    line.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
    [cell.contentView addSubview:line];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.messageBlock)
    {
        self.messageBlock(indexPath.row);
    }
    [self hidden];
}







@end
