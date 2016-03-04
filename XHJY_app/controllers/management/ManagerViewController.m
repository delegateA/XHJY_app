//
//  ManagerViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/29.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ManagerViewController.h"
#import "ManageBtn.h"
#import "SetViewController.h"
#import "ManagerFilesViewController.h"
#import "EquipmentManagerViewController.h"
#import "PersonInfoViewController.h"
#import "MessageListViewController.h"
#import "ManagePersonViewController.h"

@interface ManagerViewController ()

@property(nonatomic,copy)UIButton *setBtn;
@property(nonatomic,copy)UIImageView *setImage;
@property(nonatomic,copy)UILabel *nameLabel;
@property(nonatomic,assign)CGFloat percent ;
@property(nonatomic,copy)UIView *midView;
@property(nonatomic,copy)UIView *messageBtn;
@property(nonatomic,copy)UIView *infoBtn;
@property(nonatomic,copy)UILabel *numLabel;

@end

@implementation ManagerViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.percent = SCREEN_WIDTH  /  375;
    [self setMessage];
    
}

- (void)setMessage
{
    [self.nameLabel setText:@"kaish"];
    self.setBtn.enabled = YES;
    self.setImage.backgroundColor = [UIColor blackColor];
    [self.midView setBackgroundColor:[Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1]];
    [self.infoBtn setBackgroundColor:[UIColor whiteColor]];
    [self.messageBtn setBackgroundColor:[UIColor whiteColor]];
    [self.numLabel setText:@"6"];
}

- (UIButton *)setBtn
{
    
    if (!_setBtn) {
        
        CGFloat width = 22 * self.percent;
        _setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_setBtn setImage:ImageNamed(@"btn_set_normal") forState:UIControlStateNormal];
        [_setBtn setImage:ImageNamed(@"btn_set_press") forState:UIControlStateSelected];
        _setBtn.frame = CGRectMake(SCREEN_WIDTH - 10 - width,20 + 10 * self.percent,  width, width);
        [_setBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _setBtn.tag = 13;
        [self.view addSubview:_setBtn];
    }
    return _setBtn;
}

- (UIImageView *)setImage
{
    if (!_setImage) {
        
        CGFloat width = 100 * self.percent;
        _setImage = [[UIImageView alloc]init];
        _setImage.backgroundColor = [UIColor blackColor];
        _setImage.bounds = CGRectMake(0, 0, width, width);
        _setImage.center = CGPointMake(SCREEN_WIDTH / 2, (75 + 50) * self.percent);
        _setImage.layer.cornerRadius = width / 2;
        _setImage.clipsToBounds = YES;
        [self.view addSubview:_setImage];
    }
    return _setImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.bounds = CGRectMake(0, 0, SCREEN_WIDTH, 40);
        _nameLabel.center = CGPointMake(SCREEN_WIDTH / 2, 195 * self.percent);
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:24 * self.percent];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UIView *)midView
{
    if (!_midView) {
        
        
        _midView = [[UIView alloc]initWithFrame:CGRectMake(0, 260 * self.percent , SCREEN_WIDTH, 100 * self.percent)];
        NSMutableArray *buttonTitles = [NSMutableArray arrayWithObjects:@"家   人",@"健康档案",@"设备管理",nil];
        NSMutableArray *buttonImgs = [NSMutableArray arrayWithObjects:@"icon_-groups",@"icon-_lists",@"icon_equ", nil];
        
        NSInteger count = 3;//几个button
        
        
        
        for (int i = 0; i < count; i++) {
            
            ManageBtn *button = [ManageBtn buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0 + SCREEN_WIDTH/count * i, 0, SCREEN_WIDTH/count, _midView.bounds.size.height);
            button.tag = 10 + i;
            button.buttonName.text = buttonTitles[i];
            button.buttonImg.image = [UIImage imageNamed:buttonImgs[i]];
            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [_midView addSubview:button];
            
        }
        for (int i = 0; i < count - 1; i++) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(1 + SCREEN_WIDTH/count * (i + 1), 10, 1, _midView.bounds.size.height - 20)];
            line.backgroundColor = [UIColor whiteColor];
            [_midView addSubview:line];
        }
        [self.view addSubview:_midView];
        
    }
    return _midView;
}


- (UIView *)messageBtn
{
    if (!_messageBtn) {
        
        _messageBtn = [[UIView alloc]initWithFrame:CGRectMake(0, 420 * self.percent, SCREEN_WIDTH, 60 * self.percent)];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.bounds = CGRectMake(0, 0, 22 * self.percent, 22 * self.percent);
        imageView.center = CGPointMake(20 +  11 * self.percent, _infoBtn.bounds.size.height / 2);
        imageView.image = ImageNamed(@"icon-_message");
        [_messageBtn addSubview:imageView];
        
        UILabel *message = [[UILabel alloc]init];
        message.text = @"消        息";
        message.frame = CGRectMake(40 + 22 * self.percent, 0, 100, _infoBtn.bounds.size.height);
        message.textAlignment = NSTextAlignmentLeft;
        message.textColor = [UIColor blackColor];
        message.font = [UIFont systemFontOfSize:14 * self.percent];
        [_messageBtn addSubview:message];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH, 1)];
        line.backgroundColor = RGBCOLOR(245, 245, 245);
        [_messageBtn addSubview:line];
        
        
        [self.view addSubview:_messageBtn];
        
        UITapGestureRecognizer *tapGesTure = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToMessage)];
        
        [_messageBtn addGestureRecognizer:tapGesTure];
    }
    return _messageBtn;
}

- (UIView *)infoBtn
{
    if (!_infoBtn) {
        
        _infoBtn = [[UIView alloc]initWithFrame:CGRectMake(0, 360 * self.percent, SCREEN_WIDTH, 60 * self.percent)];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.bounds = CGRectMake(0, 0, 22 * self.percent, 22 * self.percent);
        imageView.center = CGPointMake(20 +  11 * self.percent, _infoBtn.bounds.size.height / 2);
        imageView.image = ImageNamed(@"icon-_data");
        [_infoBtn addSubview:imageView];
        
        UILabel *message = [[UILabel alloc]init];
        message.text = @"个人资料";
        message.frame = CGRectMake(40 + 22 * self.percent, 0, 100, _infoBtn.bounds.size.height);
        message.textAlignment = NSTextAlignmentLeft;
        message.textColor = [UIColor blackColor];
        message.font = [UIFont systemFontOfSize:14 * self.percent];
        [_infoBtn addSubview:message];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH, 1)];
        line.backgroundColor = RGBCOLOR(245, 245, 245);
        [_infoBtn addSubview:line];
        
        [self.view addSubview:_infoBtn];
        
        
        UITapGestureRecognizer *tapGesTure = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToPersonInfo)];
        
        [_infoBtn addGestureRecognizer:tapGesTure];
        
    }
    return _infoBtn;
}

- (UILabel *)numLabel
{
    if (!_numLabel) {
        
        _numLabel = [[UILabel alloc]init];
        _numLabel.backgroundColor =  [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
        _numLabel.frame = CGRectMake(SCREEN_WIDTH - 20 - 30 * self.percent, 15 * self.percent, 30 * self.percent,30 * self.percent);
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.font = [UIFont  systemFontOfSize:11];
        _numLabel.layer.cornerRadius = 15 * self.percent;
        _numLabel.clipsToBounds = YES;
        _numLabel.textAlignment = NSTextAlignmentCenter;
        [_messageBtn addSubview:_numLabel];
        
    }
    return _numLabel;
}


- (void)buttonPressed:(UIButton *)sender
{
       if (sender.tag == 10) {
           
           ManagePersonViewController *vc = [[ManagePersonViewController alloc]init];
           [self.navigationController pushViewController:vc animated:YES];
       }
       if (sender.tag == 11) {
           
           ManagerFilesViewController *vc = [[ManagerFilesViewController alloc]init];
           [self.navigationController pushViewController:vc animated:YES];
       }
       if (sender.tag == 12) {
           
           EquipmentManagerViewController *vc = [[EquipmentManagerViewController alloc]init];
           [self.navigationController pushViewController:vc animated:YES];
       }
       if (sender.tag == 13) {
           
           SetViewController *vc = [[SetViewController alloc]init];
           [self.navigationController pushViewController:vc animated:YES];
       }
}

- (void)pushToMessage
{
    MessageListViewController *vc = [[MessageListViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushToPersonInfo
{
    PersonInfoViewController *vc = [[PersonInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
