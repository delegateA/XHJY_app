//
//  FocusOnViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "FocusOnViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>//CNContactPickerViewController
#import "LBXScanViewStyle.h"
#import "SubLBXScanViewController.h"
#import "GxqAlertView.h"

@interface FocusOnViewController ()<ABPeoplePickerNavigationControllerDelegate>

@property(nonatomic,copy)UITextField *textField;
@property(nonatomic,copy)UIButton *bottomBtn;
@end

@implementation FocusOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.closeBtn.hidden = NO;
    self.midView.hidden = NO;
    self.firstLabel.text = @"邀请家人";
    self.secondLabel.text = @"请输入家人的手机号或者扫描二维码";
    [self setUiinterface];
    [self.textField setBorderStyle:UITextBorderStyleNone];
    if (self.btnType == 0) {
         [self.bottomBtn setTitle:@"申 请 关 注" forState:UIControlStateNormal];
    }
    else
    {
         [self.bottomBtn setTitle:@"邀 请 关 注" forState:UIControlStateNormal];
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notice:) name:@"readSucceed" object:nil];
}

- (void)notice:(id)sender
{
    NSLog(@"%@",sender);
}

- (void)setUiinterface
{
    NSArray *array = @[@"手机号",@"扫一扫"];
    NSArray *array2 = @[@"btn_directory_press.png",@"btn_scanning_normal.png"];
    for (int i = 0; i < 2; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 227 + 75 * i, 100, 15)];
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [Tools colorWithHexString:@"#c1c1c1" withAlpha:1];
        label.text = array[i];
        [self.view addSubview:label];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 20 + i;
        btn.frame = CGRectMake(SCREEN_WIDTH - 25 - 22, 235 + i * 65, 22, 22);
        [btn setBackgroundImage:ImageNamed(array2[i]) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(messageGet:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 279 + i * 60 , SCREEN_WIDTH, 1)];
        line.backgroundColor = [Tools colorWithHexString:@"#f3f3f3" withAlpha:1];
        [self.view addSubview:line];
        
    }
}

- (UITextField *)textField
{
    if (!_textField) {
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 254, 150, 20)];
    _textField.textColor = [UIColor blackColor];
    _textField.placeholder = @"点击输入手机号";
    [self.view addSubview:_textField];
    }
    return _textField;
}

- (UIButton *)bottomBtn
{
    if (!_bottomBtn) {
        
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60);
        [_bottomBtn setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_bottomBtn addTarget:self action:@selector(pushToAddPerson:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomBtn];
    }
    return _bottomBtn;
}

/**
 *  获取信息
 *
 *  @param sender
 */
- (void)messageGet:(UIButton *)sender
{
    //手机号
    if (sender.tag == 20) {
        
        ABPeoplePickerNavigationController *peoplePicker = [[ABPeoplePickerNavigationController alloc] init];
        peoplePicker.peoplePickerDelegate = self;
        [self presentViewController:peoplePicker animated:YES completion:nil];
        
    }
    //二维码
    if (sender.tag == 21) {
        
        //设置扫码区域参数
        LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
        style.centerUpOffset = 44;
        style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Inner;
        style.photoframeLineW = 3;
        style.photoframeAngleW = 18;
        style.photoframeAngleH = 18;
        style.isNeedShowRetangle = NO;
        
        style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
        
        //qq里面的线条图片
        UIImage *imgLine = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
        
        style.animationImage = imgLine;
        //非正方形
        //        style.isScanRetangelSquare = NO;
        //        style.xScanRetangleOffset = 40;
        
        
        [self openScanVCWithStyle:style];
    }
}

- (void)openScanVCWithStyle:(LBXScanViewStyle*)style
{
    SubLBXScanViewController *vc = [SubLBXScanViewController new];
    vc.style = style;
    //vc.isOpenInterestRect = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  邀请/申请关注
 *
 *  @param sender
 */
- (void)pushToAddPerson:(UIButton *)sender
{
    if (self.btnType == 0) {
        
    }
    else
    {
        
    }
    
    //icon_fail  #ff3063 邀请失败
    //icon_success 
    
    UIColor *color = [Tools colorWithHexString:@"#ff3063" withAlpha:1];
    
    [GxqAlertView showWithIMage:@"icon_fail" noticeTitle:@"" noticelMessage:@"账号不存在" buttonNum:1 buttonTitles:@[@"邀请失败"] buttonColors:@[color] LeftBlock:^{
        
    } RightBlock:^{
        
    }];
    
    
}



#pragma mark -- ABPeoplePickerNavigationControllerDelegate
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    
    ABMultiValueRef valuesRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    CFIndex index = ABMultiValueGetIndexForIdentifier(valuesRef,identifier);
    CFStringRef value = ABMultiValueCopyValueAtIndex(valuesRef,index);
    
    [self dismissViewControllerAnimated:YES completion:^{
        self.textField.text = (__bridge NSString*)value;
    }];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
