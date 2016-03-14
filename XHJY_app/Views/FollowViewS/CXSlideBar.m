//
//  CXSlideBar.m
//  pregnant-information
//
//  Created by 王长旭 on 16/1/14.
//  Copyright © 2016年 wcxdell. All rights reserved.
//

#import "CXSlideBar.h"
#import "FocusOnViewController.h"

@interface CXSlideBar()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView * scrollView;
@property (strong, nonatomic) UIImageView * indicator;
@property (strong, nonatomic) NSMutableArray * labelArrays;
@property (weak,nonatomic) NSArray * array;
@property (assign, nonatomic)  NSInteger labelWidth;
@property (assign, nonatomic) NSInteger currentIndex;
@property(nonatomic,strong)NSMutableArray *nameArray;

//@property BOOL tapCategoryTitle;
@end

@implementation CXSlideBar

#pragma mark - Life Cycle
+(instancetype)initWithFrame:(CGRect)frame Array:(NSArray *)array{
    CXSlideBar * slideBar = [[CXSlideBar alloc] initWithFrame:frame];
    [slideBar setupWithArray:array];
    return slideBar;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
    }
    return self;
}

#pragma mark - Public Method

-(void)setupWithArray:(NSArray*) array{
    self.backgroundColor = [UIColor whiteColor];
    self.array = array;
    [self addSubview:self.scrollView];
    
   // self.tapCategoryTitle = NO;
    self.currentIndex = 1;
    self.labelArrays = [NSMutableArray array];
    self.nameArray=[NSMutableArray new];
    self.labelWidth = 45;
    
    NSInteger categoryCount = [array count];
    self.scrollView.contentSize = CGSizeMake(10+(categoryCount) * (self.labelWidth+30), self.scrollView.frame.size.height);
    for (int i = 0; i < categoryCount; i++) {
        [self createCategoryLabel:i];
    }
    [self highlightedCategory:self.currentIndex];
}


- (void) createCategoryLabel:(int)index {
    UIImageView *label = [[UIImageView alloc] initWithFrame:CGRectMake(index * (self.labelWidth+30)+10, 25, 45, 45)];
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(5, 44, 50, 16)];
    name.text=@"添加关注";
    name.textColor=[UIColor blackColor];
    name.layer.borderWidth=1;
    name.textAlignment=NSTextAlignmentCenter;
    name.font=[UIFont systemFontOfSize:8];
    name.backgroundColor=[UIColor whiteColor];
    name.layer.borderColor=[UIColor grayColor].CGColor;
    name.alpha=0;
    [label addSubview:name];
    label.tag = index;
    label.image = [UIImage imageNamed:self.array[index]];
    [label setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(tapCategory:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [label addGestureRecognizer:tap];
    [self.labelArrays addObject:label];
    [self.scrollView addSubview:label];
    [self.nameArray addObject:name];
}

- (void) tapCategory:(UITapGestureRecognizer *)recognizer {
    UIView *viewT = [recognizer view];
    if (viewT.tag ==self.currentIndex ) {
        return;
    }
    if (viewT.tag==0) {
        NSLog(@"########我是添加");
        [self.AddVC.navigationController pushViewController:[FocusOnViewController new] animated:YES];
    }else{
        NSInteger last = self.currentIndex;
        self.currentIndex = viewT.tag;
    CABasicAnimation *AN=[CABasicAnimation animationWithKeyPath:@"bounds.size"];
    [AN setToValue:[NSValue valueWithCGSize:CGSizeMake(60, 60)]];
    AN.fillMode=kCAFillModeForwards;
    AN.removedOnCompletion=NO;
    [[viewT layer]addAnimation:AN forKey:@" img"];
        [self highlightedCategory:last];
    }
    if ([self.delegate respondsToSelector:@selector(slideBarTouch:atIndex:)]) {
        [self.delegate slideBarTouch:self atIndex:self.currentIndex];
    }
    
}

-(void)moveTo:(NSInteger)index{
    NSInteger last = self.currentIndex;
    self.currentIndex = index;
    [self highlightedCategory:last];
}

- (void) highlightedCategory:(NSInteger)lastHighlighted {
    UIImageView * labelCurrent = self.labelArrays[self.currentIndex];
    UIImageView * labelLast = self.labelArrays[lastHighlighted];
    UILabel *name=self.nameArray[self.currentIndex];
    UILabel *namelast=self.nameArray[lastHighlighted];
    if (lastHighlighted==self.currentIndex) {
        CABasicAnimation *AN=[CABasicAnimation animationWithKeyPath:@"bounds.size"];
        [AN setToValue:[NSValue valueWithCGSize:CGSizeMake(60, 60)]];
        AN.fillMode=kCAFillModeForwards;
        AN.removedOnCompletion=NO;
        [[labelCurrent layer]addAnimation:AN forKey:@" img"];
        name.alpha=1;
    }else{
        name.alpha=1;
        namelast.alpha=0;
    CABasicAnimation *AN=[CABasicAnimation animationWithKeyPath:@"bounds.size"];
    [AN setToValue:[NSValue valueWithCGSize:CGSizeMake(60, 60)]];
    AN.fillMode=kCAFillModeForwards;
    AN.removedOnCompletion=NO;
    [[labelCurrent layer]addAnimation:AN forKey:@" img"];
    CABasicAnimation *AN1=[CABasicAnimation animationWithKeyPath:@"bounds.size"];
    [AN1 setToValue:[NSValue valueWithCGSize:CGSizeMake(45, 45)]];
    AN1.fillMode=kCAFillModeForwards;
    AN1.removedOnCompletion=NO;
        [[labelLast layer]addAnimation:AN1 forKey:@" img"];
    }
}

#pragma mark - Getter
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}


@end
