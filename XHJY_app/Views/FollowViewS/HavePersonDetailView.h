//
//  HavePersonDetailView.h
//  XHJY_app
//
//  Created by zzh_iPhone on 16/3/7.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHRampView.h"
#import "lineChart.h"
@protocol HavePersonDetailViewDelegate <NSObject>

-(void)showHeart;

@end

@interface HavePersonDetailView : UIView


@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIViewController *HPVC;

@property(nonatomic,strong)UIView *containerView;
@property(nonatomic,strong)UIView *BGView;
@property(nonatomic,strong)lineChart *showView;
@property(nonatomic,strong)UIImageView *workIMG;
@property(nonatomic,strong)UILabel *batteryLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *HRLabel;
@property(nonatomic,strong)UILabel *HRNumLabel;
@property(nonatomic,strong)UIImageView *HRimg;
@property(nonatomic,strong)UILabel *HRunit;
@property(nonatomic,strong)UILabel *frequency;
@property(nonatomic,strong)UILabel *frequencyNum;
@property(nonatomic,strong)UILabel *frequencyUnit;
@property(nonatomic,strong)UILabel *minHeart;
@property(nonatomic,strong)UILabel *minHeartNum;
@property(nonatomic,strong)UILabel *minHeartTime;
@property(nonatomic,strong)UIImageView *minHimg;
@property(nonatomic,strong)UILabel *maxHeart;
@property(nonatomic,strong)UILabel *maxHeartNum;
@property(nonatomic,strong)UILabel *maxHeartTime;
@property(nonatomic,strong)UIImageView *maxHimg;
@property(nonatomic,strong)UIButton *warningBtn;
@property(nonatomic,strong)UIButton *analyzeBtn;
@property(nonatomic,strong)UIButton *startBtn;
@property(nonatomic,strong)UIButton *showBtn;
@property(nonatomic,strong)UIButton *oneLabel;
@property(nonatomic,strong)UIButton *twoLabel;
@property(nonatomic,strong)UIButton *threeLabel;
@property(nonatomic,strong)UIButton *fourLabel;
@property(nonatomic,strong)UILabel *oneBtn;
@property(nonatomic,strong)UILabel *twoBtn;
@property(nonatomic,strong)UILabel *threeBtn;
@property(nonatomic,strong)UILabel *fourBtn;
@property(nonatomic,strong)UILabel *forecastLabel;
@property(nonatomic,strong)UIImageView *oneIMG;
@property(nonatomic,strong)UIImageView *twoIMG;
@property(nonatomic,strong)UIImageView *threeIMG;
@property(nonatomic,strong)UILabel *pressLabel;
@property(nonatomic,strong)UIImageView *powerIMG;
@property(nonatomic,strong)UIImageView *colorIMG;
@property(nonatomic,strong)ZHRampView *colorView;
@property(nonatomic,assign)float abc;
@property(nonatomic,assign)BOOL isShow;

@property(nonatomic,weak)id<HavePersonDetailViewDelegate>delegate;

@end
