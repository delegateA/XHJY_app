//
//  BottomView.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/9.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *dataSource;
@property(nonatomic,copy)NSArray *imageArray;
@end
