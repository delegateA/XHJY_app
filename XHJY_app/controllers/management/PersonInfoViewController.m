//
//  PersonInfoViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/1.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "PersonInfoViewController.h"

@interface PersonInfoViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,copy)UIButton *setImageBtn;
@property(nonatomic,copy)UIView *mainView;
@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.setImageBtn.hidden = NO;
    self.mainView.hidden = NO;
    self.closeBtn.hidden = NO;
    self.topTittle.text = @"个人资料";
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

- (UIView *)mainView
{
    if (!_mainView) {
        
        _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 64 + 100 + 60, SCREEN_WIDTH, 80* 5)];
        _mainView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_mainView];
        
        for (int i = 0; i < 5; i++) {
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 20 + 75 * i, 100, 15)];
            label.textColor = [UIColor grayColor];
            label.text = @"name";
            label.textAlignment = NSTextAlignmentLeft;
            label.font = [UIFont systemFontOfSize:16];
            [_mainView addSubview:label];
            
            UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(30, 20 + 15 + 15 + 75 * i, 100, 15)];
            textfield.textAlignment = NSTextAlignmentLeft;
            textfield.textColor = [UIColor blackColor];
            textfield.tag = 30 + i;
            textfield.text = @"Arron";
            [textfield setBorderStyle:UITextBorderStyleNone];
            [_mainView addSubview:textfield];
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 74  + 75 * i, SCREEN_WIDTH, 1)];
            view.backgroundColor = RGBCOLOR(245, 245, 245);
            [_mainView addSubview:view];
            
        }
    }
    
    return _mainView;
}

- (void)buttonPressed:(UIButton *)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选取", nil];
    [sheet showInView:self.view];
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
        
        [self.setImageBtn setImage:image forState:UIControlStateNormal];
        // 保存图像
        // 1. 取图像路径
        NSArray *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *imagePath = [docs[0]stringByAppendingPathComponent:@"abc.png"];
        
        // 2. 转换成NSData保存
        NSData *imageData = UIImagePNGRepresentation(image);
        [imageData writeToFile:imagePath atomically:YES];
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
