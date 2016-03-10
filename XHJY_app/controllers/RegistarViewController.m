//
//  RegistarViewController.m
//  XHJY_app
//
//  Created by admin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "RegistarViewController.h"
#import <MBProgressHUD.h>
@interface RegistarViewController ()


@property(nonatomic,copy)NSString *oUserPhoneNum;
@property(assign,nonatomic)NSInteger timeCount;
@property(strong,nonatomic)NSTimer *timer;
@property(copy,nonatomic)NSString *smsId;
@end

@implementation RegistarViewController

#pragma mark 此处根据属性isRegister来确定是注册还是修改密码
-(void)viewWillAppear:(BOOL)animated{
    if (self.isRegister==YES) {
        self.Password.placeholder=@"我是密码";
    }else{
    self.Password.placeholder=@"我是新密码";
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.view.backgroundColor=[UIColor orangeColor];
    
    [self.PhoneNum addTarget:self action:@selector(changeUser) forControlEvents:UIControlEventEditingChanged];
    [self.Password addTarget:self action:@selector(changeAction) forControlEvents:UIControlEventEditingChanged];
    [self.Identifier addTarget:self action:@selector(changeIdent) forControlEvents:UIControlEventEditingChanged];
    
}
- (BOOL)isValidateMobile:(NSString *)mobile
{
    NSString *phoneRegex = @"^[1][3,4,5,8,7][0-9]{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
-(void)changeUser{
    UIButton *btn=(UIButton *)[self.view viewWithTag:333];
    if (self.PhoneNum.text.length>=11) {
        if ([self isValidateMobile:self.PhoneNum.text]) {
            self.PhoneNum.textColor=[UIColor blackColor];
            [self.Password becomeFirstResponder];
        }else{
            self.PhoneNum.textColor=[UIColor redColor];
        }
    }else if(self.PhoneNum.text.length<1){
        btn.backgroundColor=[UIColor colorWithRed:205/255.0f green:205/255.0f blue:205/255.0f alpha:1];
    }else{
        self.PhoneNum.textColor=[UIColor blackColor];
    }
}
-(void)changeAction{
    UIButton *btn=(UIButton *)[self.view viewWithTag:333];
    if (self.Password.text.length>=1 && self.PhoneNum.text.length>=1) {
        btn.backgroundColor=[UIColor colorWithRed:75/255.0f green:130/255.0f blue:252/255.0f alpha:1];
    }else{
        btn.backgroundColor=[UIColor colorWithRed:205/255.0f green:205/255.0f blue:205/255.0f alpha:1];
    }
    
    
}
-(void)changeIdent{
    UIButton *btn=(UIButton *)[self.view viewWithTag:333];
    if (self.Identifier.text.length>=1 && self.PhoneNum.text.length>=1 && self.Password.text.length>=1) {
        btn.backgroundColor=[UIColor colorWithRed:75/255.0f green:130/255.0f blue:252/255.0f alpha:1];
    }else{
        btn.backgroundColor=[UIColor colorWithRed:205/255.0f green:205/255.0f blue:205/255.0f alpha:1];
    }

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

- (IBAction)TimerBtn:(UIButton *)sender {
    
    if ([self.PhoneNum.text isEqualToString:@""] || [self.Password.text isEqualToString:@""])
    {
       MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
       hud.mode = MBProgressHUDModeText;
       hud.labelText = @"亲，请输入手机号或密码";
       hud.margin = 10.f;
       hud.yOffset = -30.f;
       hud.removeFromSuperViewOnHide = YES;
       [hud hide:YES afterDelay:2];
    
       return;
     }else if (self.PhoneNum.text.length <11)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"您输入的手机号格式不正确";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }else if (self.Password.text.length<6 || self.Password.text.length>16){
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"请输入6~15位密码";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }
    _oUserPhoneNum =self.PhoneNum.text;
    sender.userInteractionEnabled = NO;
    self.timeCount = 60;
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduceTime:) userInfo:sender repeats:YES];
   // [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_oUserPhoneNum zone:@"86" customIdentifier:nil result:^(NSError *error) {
      //  if (!(error)) {
       //     NSLog(@"获取成功");
        //}else{
       //     NSLog(@"获取失败");
      //  }
    //}];
    
    
}
-(void)reduceTime:(NSTimer *)codeTimer{
    UIButton *button=[self.view viewWithTag:222];
    self.timeCount--;
    if (self.timeCount==0) {
        [button setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        //[button setTitleColor:[UIColor colorWithRed:75/255.0f green:130/255.0f blue:252/255.0f alpha:1] forState:UIControlStateNormal];
        UIButton *info=codeTimer.userInfo;
        info.enabled=YES;
        button.userInteractionEnabled=YES;
        [self.timer invalidate];
        
    }else{
        NSString *str=[NSString stringWithFormat:@"%lu秒",self.timeCount];
        [button setTitle:str forState:UIControlStateNormal];
        button.userInteractionEnabled=NO;
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.PhoneNum resignFirstResponder];
}

-(void)next{
    NSLog(@"!!!!");
    
    if ([self.PhoneNum.text isEqualToString:@""])
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"亲，请输入注册手机号码";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }
    else if (self.PhoneNum.text.length <11)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"您输入的手机号码格式不正确";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }
    else if ([self.Password.text isEqualToString:@""])
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"亲，请输入密码";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        
        return;
    }else if ([self.Identifier.text isEqualToString:@""]){
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"亲，请输入验证码";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        
        return;
    }else{
        NSLog(@"我都填写了++++++++++");
        
        
    }
    
}

- (IBAction)Register:(UIButton *)sender {
    if ([self.PhoneNum.text isEqualToString:@""])
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"亲，请输入注册手机号码";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
       [hud hide:YES afterDelay:2];
       return;
    }else if (self.PhoneNum.text.length <11)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"您输入的手机号码格式不正确";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }else if ([self.Password.text isEqualToString:@""])
    {
       MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
       hud.mode = MBProgressHUDModeText;
       hud.labelText = @"亲，请输入密码";
       hud.margin = 10.f;
       hud.yOffset = -30.f;
       hud.removeFromSuperViewOnHide = YES;
      [hud hide:YES afterDelay:2];
    
       return;
    }else if ([self.Identifier.text isEqualToString:@""]){
    
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"亲，请输入验证码";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
    
        return;
    }else{
        NSArray *arr=@[self.PhoneNum.text,self.Password.text];
        NSLog(@"我都填写了++++++++++");
        if (self.block) {
            self.block(arr);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (IBAction)BackLogin:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)BackSuper:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
