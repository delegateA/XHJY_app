//
//  ChangeSecrectViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/4.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ChangeSecrectViewController.h"

@interface ChangeSecrectViewController ()<UITextFieldDelegate>
@property(nonatomic,copy)NSArray *titleArray;
@property(nonatomic,copy)NSArray *placeholderArray;
@end

@implementation ChangeSecrectViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleArray = [[NSArray alloc]initWithObjects:@"旧密码",@"设置新密码",@"重复新密码", nil];
        _placeholderArray = [[NSArray alloc]initWithObjects:@"请输入旧密码",@"请输入新密码",@"请再次输入新密码已确认", nil];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backBtn.hidden = NO;
    self.topTittle.text = @"修改密码";
    [self setUIinterface];
}

- (void)setUIinterface
{
    for (int i = 0; i < 4; i++) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,  64 + 30 + i * 60, SCREEN_WIDTH, 1)];
        view.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].lineColor withAlpha:1];
        [self.view addSubview:view];
        
    }
    
    for (int i = 0; i < 3; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 30 + 64 + 60 * i, 80, 60)];
        label.text = self.titleArray[i];
        label.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:label];
    
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(30 + 80 + 40, 30 + 64 + 60  * i, SCREEN_WIDTH - 30 - 30 - 80 - 40, 60)];
        textField.placeholder = self.placeholderArray[i];
        textField.tag = 10 + i;
        textField.delegate = self;
        textField.secureTextEntry = YES;
        [self.view addSubview:textField];
    }
    
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    sendBtn.frame = CGRectMake(0, 64 + 30 + 60 * 3 + 30, SCREEN_WIDTH, 60);
    [sendBtn setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
    [sendBtn setTitle:@"确 认 修 改" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sendBtn.tag = 100;
    [sendBtn addTarget:self action:@selector(changePassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn];
    
    
    
}

- (void)changePassword:(UIButton *)sender
{
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    BOOL flag = NO;
    if (textField.tag == 12) {
        
        [self changePassword:[self.view viewWithTag:100]];
    }
    else
    {
        UITextField *text = [self.view viewWithTag:textField.tag + 1];
        [text becomeFirstResponder];
    }
    
    
    return flag;
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
    [self resignKeyBoardInView:self.view];
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
