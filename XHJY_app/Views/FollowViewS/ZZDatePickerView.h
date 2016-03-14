//
//  HZQDatePickerView.h
//  HZQDatePickerView
//
//  Created by 1 on 15/10/26.
//  Copyright © 2015年 HZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZDatePickerViewDelegate <NSObject>

- (void)getSelectDate:(NSString *)date ;

@end

@interface ZZDatePickerView : UIView

+ (ZZDatePickerView *)instanceDatePickerView;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerView;

@property (nonatomic, weak) id<ZZDatePickerViewDelegate> delegate;



@end
