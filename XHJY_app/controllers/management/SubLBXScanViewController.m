//
//  SubLBXScanViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "SubLBXScanViewController.h"

@interface SubLBXScanViewController ()

@end

@implementation SubLBXScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.topTittle.text = @"扫码";
    self.backBtn.hidden = NO;
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self drawScanView];
    
    
    [self performSelector:@selector(startScan) withObject:nil afterDelay:0.2];
}

//绘制扫描区域
- (void)drawScanView
{
    if (!_qRScanView)
    {
        CGRect rect = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        rect.origin = CGPointMake(0, 64);
        
        self.qRScanView = [[LBXScanView alloc]initWithFrame:rect style:_style];
        [self.view addSubview:_qRScanView];
        
    }
    
    [_qRScanView startDeviceReadyingWithText:@"相机启动中"];
    
    
}

- (void)reStartDevice
{
    [_scanObj startScan];
}

//启动设备
- (void)startScan
{
    if ( ![LBXScanWrapper isGetCameraPermission] )
    {
        [_qRScanView stopDeviceReadying];
        
        [self showError:@"   请到设置隐私中开启本程序相机权限   "];
        return;
    }
    
    
    
    if (!_scanObj )
    {
        __weak __typeof(self) weakSelf = self;
        // AVMetadataObjectTypeQRCode   AVMetadataObjectTypeEAN13Code
        
        CGRect cropRect = CGRectZero;
        
        if (_isOpenInterestRect) {
            
            cropRect = [LBXScanView getScanRectWithPreView:self.view style:_style];
        }
        
        self.scanObj = [[LBXScanWrapper alloc]initWithPreView:self.view
                                              ArrayObjectType:nil
                                                     cropRect:cropRect
                                                      success:^(NSArray<LBXScanResult *> *array){
                                                          [weakSelf scanResultWithArray:array];
                                                      }];
        
    }
    [_scanObj startScan];
    
    
    [_qRScanView stopDeviceReadying];
    
    [_qRScanView startScanAnimation];
    
    self.view.backgroundColor = [UIColor clearColor];
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    [_scanObj stopScan];
    [_qRScanView stopScanAnimation];
}



#pragma mark -实现类继承该方法，作出对应处理
- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    LBXScanResult *a = array[0];
    NSDictionary *dic = [[NSDictionary alloc]init];
    [dic setValue:a.strScanned forKey:@"message"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"readSucceed" object:nil userInfo:dic];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)dealloc
{
    
    
    [[NSNotificationCenter
      defaultCenter] removeObserver:self name:@"readSucceed" object:nil];
    
   
    
    
}


//开关闪光灯
- (void)openOrCloseFlash
{
    [_scanObj openOrCloseFlash];
    
    self.isOpenFlash =!self.isOpenFlash;
    
}


#pragma mark --打开相册并识别图片

/*!
 *  打开本地照片，选择图片识别
 */
- (void)openLocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.delegate = self;
    
    
    picker.allowsEditing = YES;
    
    
    [self presentViewController:picker animated:YES completion:nil];
}



//当选择一张图片后进入这里

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    __block UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    if (!image){
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    __weak __typeof(self) weakSelf = self;
    [LBXScanWrapper recognizeImage:image success:^(NSArray<LBXScanResult *> *array) {
        
        [weakSelf scanResultWithArray:array];
    }];
    
    
    
    //系统自带识别方法
    /*
     CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
     NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
     if (features.count >=1)
     {
     CIQRCodeFeature *feature = [features objectAtIndex:0];
     NSString *scanResult = feature.messageString;
     
     NSLog(@"%@",scanResult);
     }
     */
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"cancel");
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//子类继承必须实现的提示
- (void)showError:(NSString*)str
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
