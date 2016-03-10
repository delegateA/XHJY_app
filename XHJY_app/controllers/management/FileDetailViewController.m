//
//  FileDetailViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "FileDetailViewController.h"
#import "CreatFileTableViewCell.h"
#import "CollectionViewCell.h"
#import "DCPicScrollView.h"

@interface FileDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate>
//主页
@property(nonatomic,copy)UIView *mainView;

@property(nonatomic,copy)NSArray *array1;
@property(nonatomic,copy)NSArray *array2;
@property(nonatomic,copy)NSArray *array3;
@property(nonatomic,copy)NSArray *array4;
@property(nonatomic,copy)NSMutableArray *dataArray;

@property(nonatomic,copy)UIView *selectView;
@property(nonatomic,copy)NSString *selectString;

@property(nonatomic,copy)DCPicScrollView *scrollview;
@property(nonatomic,copy)UIButton *deleteBtn;
@property(nonatomic,copy)UIButton *editOverBtn;

/**
 *  下面的图片
 */
@property(nonatomic,copy)UICollectionView *collectionView;
/**
 *  是否编辑
 */
@property(nonatomic,assign)BOOL editing;

@end

@implementation FileDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topTittle.text = @"健康档案";
    self.backBtn.hidden = NO;
    self.rightBtn.hidden = NO;
    [self.rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    self.selectString = @"疾病";
    
    self.scrollview.AutoScrollDelay = 3.0;
    self.editing = NO;
    
    self.mainView.hidden = NO;
    self.mainView.userInteractionEnabled = NO;
}

#pragma mark -------懒加载

- (UIView *)mainView
{
    if (!_mainView) {
        
        _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 65 + 200, SCREEN_WIDTH, 80* 5)];
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
                button.backgroundColor = [UIColor blackColor];
                button.frame = CGRectMake(SCREEN_WIDTH - 40 - 22, 50, 18, 10);
                [button setBackgroundImage:ImageNamed(@"btn_b_normal") forState:UIControlStateNormal];
                [button setBackgroundImage:ImageNamed(@"btn_b_presss") forState:UIControlStateHighlighted];
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



- (DCPicScrollView *)scrollview
{
    
    if (!_scrollview) {
        
    
    NSArray *arr = @[@"http://p1.qqyou.com/pic/UploadPic/2013-3/19/2013031923222781617.jpg",
                     @"http://cdn.duitang.com/uploads/item/201409/27/20140927192649_NxVKT.thumb.700_0.png",
                     @"http://img4.duitang.com/uploads/item/201409/27/20140927192458_GcRxV.jpeg",
                     @"http://cdn.duitang.com/uploads/item/201304/20/20130420192413_TeRRP.thumb.700_0.jpeg"];
    
    
    
    _scrollview = [[DCPicScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 200) WithImageNames:arr withButton:NO];
//    _scrollview.placeImage    占位图
    
    [_scrollview setImageViewDidTapAtIndex:^(NSInteger inx) {
        
    }];
    
    _scrollview.AutoScrollDelay = 2.0f;
    [self.view addSubview:_scrollview];
    }
    return _scrollview;
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


- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _deleteBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH / 2, 60);
        [_deleteBtn setBackgroundColor:[UIColor grayColor]];
        [_deleteBtn setTitle:@"删除档案" forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_deleteBtn addTarget:self action:@selector(deleteFile:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_deleteBtn];
    }
    return _deleteBtn;
    
}

- (UIButton *)editOverBtn
{
    if (!_editOverBtn) {
        
        _editOverBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _editOverBtn.frame = CGRectMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 60, SCREEN_WIDTH / 2, 60);
        [_editOverBtn setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
        [_editOverBtn setTitle:@"完成编辑" forState:UIControlStateNormal];
        [_editOverBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_editOverBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_editOverBtn addTarget:self action:@selector(editOver:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_editOverBtn];
    }
    return _editOverBtn;
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
        
        _selectView = [[UIView alloc]initWithFrame:CGRectMake(30, 64 + 70  + 200, 70, 44 * 3)];
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

/**
 *  开始编辑
 *
 *  @param sender
 */
- (void)rightBtnClicked:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
    self.scrollview.hidden = YES;
    self.mainView.center = CGPointMake(self.mainView.center.x, self.mainView.center.y - 200);
    self.collectionView.hidden = NO;
    self.rightBtn.hidden = YES;
        self.deleteBtn.hidden = NO;
        self.editOverBtn.hidden = NO;
        self.editing = YES;
        self.mainView.userInteractionEnabled = YES;
    }];
}

/**
 *  删除档案
 *
 *  @param sender
 */
- (void)deleteFile:(UIButton *)sender
{
    
}

/**
 *  完成编辑
 *
 *  @param sender
 */
- (void)editOver:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.editing = NO;
        self.scrollview.hidden = NO;
        self.mainView.center = CGPointMake(self.mainView.center.x, self.mainView.center.y + 200);
        self.collectionView.hidden = YES;
        self.rightBtn.hidden = NO;
        self.deleteBtn.hidden = YES;
        self.editOverBtn.hidden = YES;
        self.mainView.userInteractionEnabled = NO;
        
    }];
}

/**
 *  选择类型
 *
 *  @param sender
 */

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
                textfield.delegate = self;
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

/**
 *  展示选择框
 *
 *  @param sender
 */
- (void)selectViewShow:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.selectView.alpha = 1;
    }];
}

/**
 *  关键盘
 *
 *  @param view
 */
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


#pragma mark ------ UItextFieldDelegate


- (void)textFieldDidEndEditing:(UITextField *)textField
{
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
