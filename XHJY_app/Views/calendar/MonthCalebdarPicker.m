//
//  MonthCalebdarPicker.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/8.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "MonthCalebdarPicker.h"
#import "YearCollectionViewCell.h"


@interface MonthCalebdarPicker()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property ( nonatomic,retain)  UIView *backView;
@property (nonatomic , retain)  UICollectionView *collectionView;
@property (nonatomic , retain)  UILabel *monthLabel;
@property (nonatomic , retain)  UIButton *previousButton;
@property (nonatomic , retain)  UIButton *nextButton;
@property (nonatomic,assign)   NSInteger year;
@end

@implementation MonthCalebdarPicker

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        self.backView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        [self addSubview:self.backView];
        
        NSDate *now = [NSDate date];
        ;
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
        
        self.year = [dateComponent year];
       
        
        self.monthLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 100, 44)];
        self.monthLabel.textColor = [UIColor whiteColor];
        self.monthLabel.font = [UIFont systemFontOfSize:20];
        self.monthLabel.textAlignment = NSTextAlignmentLeft;
        self.monthLabel.text = [[NSString alloc]initWithFormat:@"%ld",(long)self.year];
        [self addSubview:self.monthLabel];
        
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 1)];
        line.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
        [self addSubview:line];
        
        self.previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.previousButton setBackgroundImage:ImageNamed(@"btn_left_normal.png") forState:UIControlStateNormal];
        self.previousButton.frame = CGRectMake(SCREEN_WIDTH - 16 - 8 - 26 - 16, 11, 16, 16);
        [self.previousButton addTarget:self action:@selector(lastYear:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.previousButton];
        
        
        
        self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.nextButton setBackgroundImage:ImageNamed(@"btn_right_normal.png") forState:UIControlStateNormal];
        self.nextButton.frame = CGRectMake(SCREEN_WIDTH - 16 - 8, 11, 16, 16);
        [self.nextButton addTarget:self action:@selector(nextYear:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.nextButton];
        
        //确定是水平滚动，还是垂直滚动
        CGFloat itemWidth = SCREEN_WIDTH / 4;
        CGFloat itemHeight = SCREEN_WIDTH / 3;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.itemSize = CGSizeMake(itemWidth, itemHeight);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
    
        
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, self.bounds.size.height - 44) collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        //注册Cell，必须要有
        [self.collectionView registerClass:[YearCollectionViewCell class] forCellWithReuseIdentifier:@"YearCollectionViewCell"];
        [self addSubview:self.collectionView];
        
    }
    return self;
}

- (void)lastYear:(UIButton *)sender
{
    self.year = self.year - 1;
    self.monthLabel.text = [[NSString alloc]initWithFormat:@"%ld",(long)self.year];
    [self.collectionView reloadData];
}

- (void)nextYear:(UIButton *)sender
{
    self.year = self.year + 1;
    self.monthLabel.text = [[NSString alloc]initWithFormat:@"%ld",(long)self.year];
    [self.collectionView reloadData];
}

#pragma mark----------------UICollectionViewDelegate

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"YearCollectionViewCell";
    YearCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.label.text = [[NSString alloc]initWithFormat:@"%ld",indexPath.row + 1];
    cell.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    
    return cell;
}
    


#pragma mark --UICollectionViewDelegateFlowLayout




#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.calendarBlock) {
        self.calendarBlock(indexPath.row, self.year);
    }
    

}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
