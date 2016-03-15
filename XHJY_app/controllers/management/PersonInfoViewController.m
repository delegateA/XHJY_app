//
//  PersonInfoViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "EWMViewController.h"
#import "ZZDatePickerView.h"
#import "ZDateView.h"
#import "ZHightView.h"
#import "CreatFileTableViewCell.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface PersonInfoViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,copy)UIButton *setImageBtn;
@property(nonatomic,copy)UITableView *mainView;
@property(nonatomic,copy)NSArray *array;
@property(nonatomic,copy)UIView *midView;
@property (nonatomic,copy)UIButton *nextBtn;
@property(nonatomic,assign)BOOL editing;
@end

@implementation PersonInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [[NSArray alloc]initWithObjects:@"姓名",@"性别",@"年龄",@"身高",@"体重",@"血型", nil];
        _editing = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.setImageBtn.hidden = NO;
    self.mainView.hidden = NO;
    self.closeBtn.hidden = NO;
    self.topTittle.text = @"个人资料";
    self.midView.userInteractionEnabled = NO;
    self.nextBtn.hidden = NO;
    self.rightBtn.hidden = NO;
    [self.rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
   
}

- (void)rightBtnClicked:(UIButton *)sender
{
    if (!_editing) {
        
        self.midView.userInteractionEnabled = YES;
        self.editing = YES;
        [self.rightBtn setTitle:@"完成" forState:UIControlStateNormal];
        self.mainView.allowsSelection = YES;
    }
    else
    {
        self.midView.userInteractionEnabled = NO;
        self.editing = NO;
        [self.rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
        self.mainView.allowsSelection = NO;
    }
    
}


- (UIButton *)setImageBtn
{
    if (!_setImageBtn) {
        
        CGFloat width = 100 ;
        _setImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _setImageBtn.backgroundColor = [UIColor blackColor];
        _setImageBtn.bounds = CGRectMake(0, 0, width, width);
        _setImageBtn.center = CGPointMake(SCREEN_WIDTH / 2, 64 + 30 + 50);
        _setImageBtn.layer.cornerRadius = width / 2;
        _setImageBtn.clipsToBounds = YES;
        [_setImageBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _setImageBtn.tag = 14;
        [self.view addSubview:_setImageBtn];
    }
    return _setImageBtn;
}


- (UIView *)midView
{
    if (!_midView) {
        
        _midView = [[UIView alloc]initWithFrame:CGRectMake(0, 64 + 100 + 50, 0, 40)];
        _midView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_midView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 100, 40)];
        label.textColor = [UIColor grayColor];
        label.text = @"我的二维码";
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:16];
        [_midView addSubview:label];
        
        for (int i = 0; i < 2; i++) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 1  + 38 * i, SCREEN_WIDTH, 1)];
            view.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
            [_midView addSubview:view];
        }
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH
                                                                              - 20 -22, (40 - 22) / 2, 12, 22)];
        imageView.image = ImageNamed(@"icon-_drop_left_normal.png");

        [_midView addSubview:imageView];
        
    }

    return _midView;
}


- (UIButton *)nextBtn
{
    if (!_nextBtn) {
        
        _nextBtn =[UIButton buttonWithType:UIButtonTypeSystem];
        _nextBtn.frame = CGRectMake(0, 64 + 100 + 50, SCREEN_WIDTH, 40);
        [_nextBtn addTarget:self action:@selector(pushToEWM:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_nextBtn];
    }
    return _nextBtn;
}

- (void)pushToEWM:(UIButton *)sender
{
    EWMViewController *vc = [[EWMViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (UITableView *)mainView
{
    if (!_mainView) {
        
        _mainView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + 100 + 50 + 40, SCREEN_WIDTH, SCREEN_HEIGHT - (64 + 100 + 50 + 40))];
        _mainView.backgroundColor = [UIColor whiteColor];
        _mainView.delegate = self;
        _mainView.dataSource = self;
        _mainView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainView.rowHeight = 80;
        _mainView.allowsSelection = NO;
        [_mainView registerNib:[UINib nibWithNibName:@"CreatFileTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CreatFileTableViewCell"];
        [self.view addSubview:_mainView];
        
    }
    
    return _mainView;
}

- (void)buttonPressed:(UIButton *)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选取", nil];
    [sheet showInView:self.view];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CreatFileTableViewCell";
    CreatFileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CreatFileTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.typeLabel.text = self.array[indexPath.row];
    if (indexPath.row == 0) {
        
        cell.messageLabel.hidden = YES;
    }
    else
    {
        cell.messageTextField.hidden = YES;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.editing == YES) {
        
        if (indexPath.row == 0) {
            
            CreatFileTableViewCell *cell = [self.mainView cellForRowAtIndexPath:indexPath];
            [cell.messageTextField becomeFirstResponder];
        }
        
        if (indexPath.row==2) {
            [self setupDateView];
        }else if(indexPath.row==4){
            [self setupWeightView];
        }else if(indexPath.row==3){
            [self setupHightView];
        }else if(indexPath.row==1   ){
            [self setupSexView];
            
        }

    }
    else
    {
        
    }
    
}
-(void)setupDateView{
    
    ZZDatePickerView *pikerView = [[ZZDatePickerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withTime:[NSDate date]];
    pikerView.calendarBlock = ^(NSInteger age)
    {
        NSLog(@"%ld",age);
    };
    [self.view addSubview:pikerView];
    [pikerView show];
    
}

-(void)setupWeightView{

    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 150; i++) {
        [array addObject:[[NSString alloc]initWithFormat:@"%dKg",i]];
    }
    
    ZHightView  *pikerView = [[ZHightView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withTitle:@"设置体重" withDataSource:array];
    
    pikerView.calendarBlock = ^(NSInteger message)
    {
        NSLog(@"%ld",message);
    };
    [self.view addSubview:pikerView];
    [pikerView show];
    
}
-(void)setupHightView{

    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 150; i++) {
        [array addObject:[[NSString alloc]initWithFormat:@"%dcm",i]];
    }
    
    ZHightView  *pikerView = [[ZHightView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withTitle:@"设置身高" withDataSource:array];
    
    pikerView.calendarBlock = ^(NSInteger message)
    {
        NSLog(@"%ld",message);
    };
    [self.view addSubview:pikerView];
    [pikerView show];
}

/**
 *  显示性别
 */
-(void)setupSexView{
    
   ZDateView *weightPikerView = [[ZDateView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withDataArray:@[@"选择性别",@"男",@"女",@"保密"]];
    [self.view addSubview:weightPikerView];
    weightPikerView.messageBlock = ^(NSInteger index)
    {
        
    };
    [weightPikerView show];

}

/**
 *  显示血型
 */
- (void)setupBloodTypeView
{
    ZDateView *weightPikerView = [[ZDateView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withDataArray:@[@"选择血型",@"A",@"B",@"C"]];
    [self.view addSubview:weightPikerView];
    weightPikerView.messageBlock = ^(NSInteger index)
    {
        
    };
    [weightPikerView show];
}

#pragma mark--------------UIActionsheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        //拍照
        
        UIImagePickerController *vc = [[UIImagePickerController alloc]init];
        vc.delegate = self;
        vc.allowsEditing = YES;
        vc.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    
    if (buttonIndex == 1) {
        //从相册中选取
        UIImagePickerController *vc = [[UIImagePickerController alloc]init];
        vc.delegate = self;
        vc.allowsEditing = YES;
        vc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:vc animated:YES completion:nil];
    }
    
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[@"UIImagePickerControllerEditedImage"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        [dic setObject:[Singleton sharedInstance].mainColor forKey:@"userid"];
        
        
        NSData *_data = UIImageJPEGRepresentation(image, 1.0f);
        NSString *_encodedImageStr = [_data base64EncodedStringWithOptions:0];
        [dic setObject:_encodedImageStr forKey:@"avatar"];
        
        
        Byte *bytes = (Byte *)[_data bytes];
        NSString *hexStr= @"";
        for(int i=0;i<[_data length];i++)
        {
            NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff]; ///16进制数
            if([newHexStr length]==1)
            {
                hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
            }
            else
            {
                hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
            }
        }
        NSLog(@"bytes 的16进制数为:%@",hexStr);
        
        [dic setObject:hexStr forKey:@"avatarChecksum"];
        
         MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        [[RequestManager sharedInstance]post:[NSString stringWithFormat:@"%@%@",[Singleton sharedInstance].baseUrl,[Singleton sharedInstance].upLoadImage] params:dic onCompletion:^(id obj) {
            NSLog(@"%@",obj);
            [hud hide:YES];
        } onError:^(NSString *error) {
            NSLog(@"%@",error)
             [hud hide:YES];
        }];
        
        
        
        [self.setImageBtn setImage:image forState:UIControlStateNormal];
        // 保存图像
        // 1. 取图像路径
//        NSArray *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *imagePath = [docs[0]stringByAppendingPathComponent:@"abc.png"];
//        
//        // 2. 转换成NSData保存
//        NSData *imageData = UIImagePNGRepresentation(image);
//        [imageData writeToFile:imagePath atomically:YES];
    });
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
