//
//  DatePickerView.m
//  DatePickerView
//
//  Created by Kaden Jack on 2017/11/27.
//  Copyright © 2017年 Kaden Jack. All rights reserved.
//

#import "DatePickerView.h"

@implementation DatePickerView

#define screenHeight [UIScreen mainScreen].bounds.size.height
#define screenWidth  [UIScreen mainScreen].bounds.size.width

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self createUI];
    }
    return self;
}
- (void)createUI{
    if (!bgView) {
        bgView = [[UIView alloc]init];
    }
    bgView.backgroundColor = [UIColor clearColor];
    bgView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    [self addSubview:bgView];
    
    UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(datePickerViewClickAction:)];
    [bgView addGestureRecognizer:tapGesturRecognizer];
    
    if (!pickerView) {
        pickerView = [[UIView alloc]init];
    }
    CGFloat pickerViewHeight = screenHeight/2 - screenHeight/2/12;
    pickerView.backgroundColor = [UIColor whiteColor];
    pickerView.frame = CGRectMake(0, screenHeight-pickerViewHeight, screenWidth, pickerViewHeight);
    [bgView addSubview:pickerView];
    
    //灰线label
    if (!lineLabel) {
        lineLabel = [UILabel new];
    }
    lineLabel.backgroundColor = [UIColor grayColor];
    lineLabel.frame = CGRectMake(0, 0, screenWidth, 1);
    [pickerView addSubview:lineLabel];
    
    if (!finishButton) {
        finishButton = [[UIButton alloc]init];
    }
    finishButton.tag = 2;
    finishButton.backgroundColor = [UIColor grayColor];
    [finishButton setTitle:@"完成" forState:UIControlStateNormal];
    [finishButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    finishButton.frame = CGRectMake(screenWidth - 70, 5, 50, 30);
    [pickerView addSubview:finishButton];
    
    //返回按钮
    if (!backButton) {
        backButton = [[UIButton alloc]init];
    }
    backButton.tag = 1;
    backButton.backgroundColor = [UIColor grayColor];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(20, 5, 50, 30);
    [pickerView addSubview:backButton];
    
    //创建DatePicker
    if (!datePicker) {
        datePicker = [[UIDatePicker alloc]init];
    }
    datePicker.datePickerMode = UIDatePickerModeDate;
    /*DatePicker的各种样式
     UIDatePickerModeTime             样式：  时  分 上午/下午
     UIDatePickerModeDate             样式：  年  月  日
     UIDatePickerModeDateAndTime      样式：  星期  时  分 上午/下午
     UIDatePickerModeCountDownTimer   样式：  时  分
     */
    [datePicker addTarget:self action:@selector(datePickerChange:) forControlEvents:UIControlEventValueChanged];
    datePicker.frame = CGRectMake(40, 35, screenWidth - 80, CGRectGetHeight(pickerView.frame)-35);
    [pickerView addSubview:datePicker];
    
    //创建NSDateFormatter
    if (!dateFormatter) {
        dateFormatter = [NSDateFormatter new];
    }
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
}
- (void)datePickerViewClickAction:(UITapGestureRecognizer *)tap
{
    self.hidden = YES;
}
-(void)datePickerChange:(UIDatePicker *)sender{
    pickerDateString = [dateFormatter stringFromDate:datePicker.date];
}
- (void)clickButton:(UIButton *)sender{
    [self datePickerViewClickAction:nil];
    NSString *dateString = pickerDateString ? pickerDateString : [dateFormatter stringFromDate:[NSDate date]];
    if (self.delegate && [self.delegate respondsToSelector:@selector(datePickerWithDateString:)])
    {
        [self.delegate datePickerWithDateString:dateString];
    }
}

@end
