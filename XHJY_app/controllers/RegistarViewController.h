//
//  RegistarViewController.h
//  XHJY_app
//
//  Created by admin on 16/3/3.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SendArrBlock) (NSArray *array);

@interface RegistarViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *PhoneNum;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UITextField *Identifier;
- (IBAction)TimerBtn:(UIButton *)sender;

- (IBAction)Register:(UIButton *)sender;
- (IBAction)BackLogin:(UIButton *)sender;
- (IBAction)BackSuper:(UIButton *)sender;
@property(nonatomic,copy)SendArrBlock block;
@property(nonatomic,assign)BOOL isRegister;

@end
