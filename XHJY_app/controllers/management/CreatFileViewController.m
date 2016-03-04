//
//  CreatFileViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "CreatFileViewController.h"
#import "CreatFileTableViewCell.h"
#import "CollectionViewCell.h"

@interface CreatFileViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,copy)NSArray *array1;
@property(nonatomic,copy)NSArray *array2;
@property(nonatomic,copy)NSArray *array3;
@property(nonatomic,copy)NSArray *array4;
@property(nonatomic,copy)NSMutableArray *dataArray;

@property(nonatomic,copy)UIView *selectView;
@property(nonatomic,copy)NSString *selectString;

@property(nonatomic,copy)UICollectionView *collectionView;

@property(nonatomic,copy)UIView *mainView;

@end

@implementation CreatFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topTittle.text = @"创建档案";
    self.backBtn.hidden = NO;
    self.rightBtn.hidden = YES;
    self.selectString = @"疾病";
    self.mainView.hidden = NO;
    [self.collectionView reloadData];
    
}

- (UIView *)mainView
{
    if (!_mainView) {
        
        _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 65, SCREEN_WIDTH, 80* 5)];
        _mainView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_mainView];
        
        for (int i = 0; i < 5; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 20 + 75 * i, 100, 15)];
            label.text = self.dataArray[i];
            label.textColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = [UIFont systemFontOfSize:16];
            [_mainView addSubview:label];
            
            UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(30, 20 + 15 + 15 + 75 * i, 100, 15)];
            textfield.textAlignment = NSTextAlignmentLeft;
            textfield.textColor = [UIColor blackColor];
            textfield.tag = 30 + i;
            [textfield setBorderStyle:UITextBorderStyleNone];
            [_mainView addSubview:textfield];
            
            if (i == 0)
            {
                textfield.text = self.selectString;
                textfield.userInteractionEnabled = NO;
            
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(SCREEN_WIDTH - 40 - 22, 50, 22, 22);
                [button setBackgroundColor:[UIColor blackColor]];
                button.tag = 99;
                [button addTarget:self action:@selector(selectViewShow:) forControlEvents:UIControlEventTouchUpInside];
                [_mainView addSubview:button];
            }
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 74  + 75 * i, SCREEN_WIDTH, 1)];
            view.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
            [_mainView addSubview:view];
            
        }
    }
    
    return _mainView;
}



- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, self.mainView.frame.origin.y + self.mainView.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - (self.mainView.frame.origin.y + self.mainView.frame.size.height)) collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        
        //注册Cell，必须要有
        [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}



- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:self.array1];
    }
    return _dataArray;
}

- (NSArray *)array1
{
    if (!_array1) {
        _array1 = @[@"档案类型",@"疾病类型",@"是否确诊",@"时间",@"医院"];
    }
    return _array1;
}

- (NSArray *)array2
{
    if (!_array2) {
        _array2 = @[@"档案类型",@"手术类型",@"时间",@"医院"];
    }
    return _array2;
}

- (NSArray *)array3
{
    if (!_array3) {
        _array3 = @[@"档案类型",@"体检类型",@"时间",@"医院"];
    }
    return _array3;
}

- (NSArray *)array4
{
    if (!_array4) {
        _array4 = @[@"疾病",@"手术",@"体检"];
    }
    return _array4;
}

- (UIView *)selectView
{
    if (!_selectView) {
        
        _selectView = [[UIView alloc]initWithFrame:CGRectMake(30, 64 + 70 , 70, 44 * 3)];
        _selectView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_selectView];
        for (int i = 0; i < 3; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(0, 0 + 44 * i, 70, 44);
            [button setTintColor:[UIColor blackColor]];
            [button addTarget:self
                       action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 10 + i;
            [button setTitle:self.array4[i] forState:UIControlStateNormal];
            [_selectView addSubview:button];
        }
        _selectView.alpha = 0;
    }
    return _selectView;
}

- (void)selectType:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.selectView.alpha = 0;
        self.selectString = self.array4[sender.tag - 10];
        [self.dataArray removeAllObjects];
       for (UIView *subviews  in [self.mainView subviews])
       {
           if (subviews.tag == 99) {
               
           }
           else
           {
               [subviews  removeFromSuperview];
           }
        }
        
        if (sender.tag == 10) {
            
            [self.dataArray addObjectsFromArray:self.array1];
            for (int i = 0; i < 5; i++) {
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 20 + 75 * i, 100, 15)];
                label.text = self.dataArray[i];
                label.textColor = [UIColor grayColor];
                label.textAlignment = NSTextAlignmentLeft;
                label.font = [UIFont systemFontOfSize:16];
                [_mainView addSubview:label];
                
                UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(30, 20 + 15 + 15 + 75 * i, 100, 15)];
                textfield.textAlignment = NSTextAlignmentLeft;
                textfield.textColor = [UIColor blackColor];
                textfield.tag = 30 + i;
                [textfield setBorderStyle:UITextBorderStyleNone];
                [_mainView addSubview:textfield];
                
                if (i == 0) {
                    textfield.text = self.selectString;
                    textfield.userInteractionEnabled = NO;
                }
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 74  + 75 * i, SCREEN_WIDTH, 1)];
                view.backgroundColor = RGBCOLOR(245, 245, 245);
                [_mainView addSubview:view];
                
            }

           
        }
        else if(sender.tag == 11)
        {
             [self.dataArray addObjectsFromArray:self.array2];
            for (int i = 0; i < 4; i++) {
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 20 + 75 * i, 100, 15)];
                label.text = self.dataArray[i];
                label.textColor = [UIColor grayColor];
                label.textAlignment = NSTextAlignmentLeft;
                label.font = [UIFont systemFontOfSize:16];
                [_mainView addSubview:label];
                
                UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(30, 20 + 15 + 15 + 75 * i, 100, 15)];
                textfield.textAlignment = NSTextAlignmentLeft;
                textfield.textColor = [UIColor blackColor];
                textfield.tag = 30 + i;
                [textfield setBorderStyle:UITextBorderStyleNone];
                [_mainView addSubview:textfield];
                
                if (i == 0) {
                    textfield.text = self.selectString;
                    textfield.userInteractionEnabled = NO;
                }

                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 74  + 75 * i, SCREEN_WIDTH, 1)];
                view.backgroundColor = RGBCOLOR(245, 245, 245);
                [_mainView addSubview:view];
            }

            
        }
        else if(sender.tag == 12)
        {
            [self.dataArray addObjectsFromArray:self.array3];
            for (int i = 0; i < 4; i++) {
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 20 + 75 * i, 100, 15)];
                label.text = self.dataArray[i];
                label.textColor = [UIColor grayColor];
                label.textAlignment = NSTextAlignmentLeft;
                label.font = [UIFont systemFontOfSize:16];
                [_mainView addSubview:label];
                
                UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(30, 20 + 15 + 15 + 75 * i, 100, 15)];
                textfield.textAlignment = NSTextAlignmentLeft;
                textfield.textColor = [UIColor blackColor];
                textfield.tag = 30 + i;
                [textfield setBorderStyle:UITextBorderStyleNone];
                [_mainView addSubview:textfield];
                
                if (i == 0) {
                    textfield.text = self.selectString;
                    textfield.userInteractionEnabled = NO;
                }
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 74  + 75 * i, SCREEN_WIDTH, 1)];
                view.backgroundColor = RGBCOLOR(245, 245, 245);
                [_mainView addSubview:view];
            }
        }
    }];
}

- (void)selectViewShow:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.selectView.alpha = 1;
    }];
}




- (void)resignKeyBoardInView:(UIView *)view
{
    for (UIView *v in view.subviews) {
        if ([v.subviews count] > 0) {
            [self resignKeyBoardInView:v];
        }
        if ([v isKindOfClass:[UITextView class]] || [v isKindOfClass:[UITextField class]]) {
            [v resignFirstResponder];
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self resignKeyBoardInView:self.mainView];
}

#pragma mark---------------UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    BOOL flag = NO;
    if (textField.tag == 34) {
        /**
         *  完成编辑的方法
         */
        
    }
    else
    {
        UITextField *text = [self.view viewWithTag:textField.tag + 1];
        [text becomeFirstResponder];
    }
    
    
    return flag;
}


#pragma mark----------------UICollectionViewDelegate

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CollectionViewCell";
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
  
    cell.imageView.image = ImageNamed(@"btn_add_f_normal");
    
    
    cell.button.tag = 100 + indexPath.row;
    cell.button.hidden = YES;
    [cell.button addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
  
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 10);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //选择图片-------------
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/**
 *  删除图片
 *
 *  @param sender 删除哪一个
 */
- (void)deleteImage:(UIButton *)sender
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
