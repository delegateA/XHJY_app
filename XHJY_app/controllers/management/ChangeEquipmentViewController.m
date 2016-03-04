//
//  ChangeEquipmentViewController.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/3/2.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "ChangeEquipmentViewController.h"
#import "ChangeEquipmentTableViewCell.h"

@interface ChangeEquipmentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *bottomBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *epTittle;
@property (weak, nonatomic) IBOutlet UILabel *epMessage;
@property(nonatomic,copy)NSMutableArray *array;

@end

@implementation ChangeEquipmentViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc]init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.backBtn.hidden = NO;
    [self setUIInterface];
}

- (void)setUIInterface
{
    self.topView.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];
    self.bottomBtn.backgroundColor = [Tools colorWithHexString:[Singleton sharedInstance].mainColor withAlpha:1];;
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headerView.backgroundColor = RGBCOLOR(248, 248, 248);
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 40, 7, 15, 15)];
    imageView.layer.cornerRadius = 15 / 2;
    imageView.clipsToBounds = YES;
    imageView.image = ImageNamed(@"icon_refresh@2x");
    [headerView addSubview:imageView];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 40 + 15 + 10, 0, 100,30)];
    label.text = @"重新扫描";
    label.textColor = RGBCOLOR(147, 147, 147);
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:label];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 29, SCREEN_WIDTH, 1)];
    line.backgroundColor = RGBCOLOR(245, 245, 245);
    [headerView addSubview:line];
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actiondo:)];
    
    [headerView addGestureRecognizer:tapGesture];
    
    self.tableView.tableHeaderView = headerView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"ChangeEquipmentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ChangeEquipmentTableViewCell"];
    
    
}

/**
 *  点击刷新
 *
 *  @param sender 
 */
- (void)actiondo:(UITapGestureRecognizer *)sender
{
    
}
/**
 *  更换设备
 *
 *  @param sender
 */
- (IBAction)changeEquiment:(id)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ChangeEquipmentTableViewCell";
    ChangeEquipmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[ChangeEquipmentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.messageLabel.text = @"老鼠爱大米";
    if ([self.array containsObject:[NSNumber numberWithInteger:indexPath.row]]) {
        
       cell.selectImage.image = ImageNamed(@"icon_square_s.png");
    }
    else
    {
       cell.selectImage.image = ImageNamed(@"icon_square_uns.png");
    }
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.array containsObject:[NSNumber numberWithInteger:indexPath.row]]) {
        
        [self.array removeObject:[NSNumber numberWithInteger:indexPath.row]];
    }
    else
    {
        [self.array addObject:[NSNumber numberWithInteger:indexPath.row]];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
