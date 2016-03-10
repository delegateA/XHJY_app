//
//  LoginViewController.h
//  XHJY_app
//
//  Created by admin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *Account;
@property (weak, nonatomic) IBOutlet UITextField *Password;
- (IBAction)Forget:(UIButton *)sender;
- (IBAction)Login:(UIButton *)sender;

- (IBAction)Registar:(UIButton *)sender;

@end
