//
//  LoginViewController.m
//  XHJY_app
//
//  Created by admin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "LoginViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "RegistarViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.Account addTarget:self action:@selector(changeUser) forControlEvents:UIControlEventEditingChanged];
    [self.Password addTarget:self action:@selector(changeAction) forControlEvents:UIControlEventEditingChanged];
}

- (BOOL)isValidateMobile:(NSString *)mobile
{
    NSString *phoneRegex = @"^[1][3,4,5,8,7][0-9]{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
-(void)changeUser{
    UIButton *btn=(UIButton *)[self.view viewWithTag:666];
    if (self.Account.text.length>=11) {
        if ([self isValidateMobile:self.Account.text]) {
            self.Account.textColor=[UIColor blackColor];
            [self.Password becomeFirstResponder];
        }else{
            self.Account.textColor=[UIColor redColor];
        }
    }else if(self.Account.text.length<1){
        btn.backgroundColor=[UIColor colorWithRed:205/255.0f green:205/255.0f blue:205/255.0f alpha:1];
    }else{
        self.Account.textColor=[UIColor blackColor];
    }
}
-(void)changeAction{
    UIButton *btn=(UIButton *)[self.view viewWithTag:666];
    if (self.Password.text.length>=1 && self.Account.text.length>=1) {
        btn.backgroundColor=[UIColor colorWithRed:75/255.0f green:130/255.0f blue:252/255.0f alpha:1];
    }else{
        btn.backgroundColor=[UIColor colorWithRed:205/255.0f green:205/255.0f blue:205/255.0f alpha:1];
    }
}
-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [self.Account resignFirstResponder];
    [self.Password resignFirstResponder];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.Account resignFirstResponder];
    [self.Password resignFirstResponder];
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

- (IBAction)Forget:(UIButton *)sender {
    RegistarViewController *regist=[[RegistarViewController alloc]init];
    regist.isRegister=NO;
    [self.navigationController pushViewController:regist animated:YES];
}

- (IBAction)Login:(UIButton *)sender {
    
    if ([self.Account.text isEqualToString:@""])
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"亲,请输入手机号";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }else if ([self.Password.text isEqualToString:@""])
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"亲,请输入密码";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }
    else if (self.Password.text.length <6)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"密码要6位以上哦";
        hud.margin = 10.f;
        hud.yOffset = -30.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return;
    }else{
        NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:self.Account.text,@"userName",self.Password.text,@"passWord", nil];
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        [userDefaults setObject:dict forKey:@"Message"];
        [userDefaults synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (IBAction)Registar:(UIButton *)sender {
    RegistarViewController *registar=[[RegistarViewController alloc]init];
    registar.isRegister=YES;
    __weak typeof(self) weakSelf=self;
    registar.block=^(NSArray *arr){
        weakSelf.Account.text=[arr firstObject];
        weakSelf.Password.text=[arr lastObject];
    
    };
    [self.navigationController pushViewController:registar animated:YES];
    
}
@end
