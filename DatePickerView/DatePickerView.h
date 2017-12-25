//
//  DatePickerView.h
//  DatePickerView
//
//  Created by Kaden Jack on 2017/11/27.
//  Copyright © 2017年 Kaden Jack. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DatePickerViewDelegate <NSObject>
- (void)datePickerWithDateString:(NSString *)dateString;
@end
@interface DatePickerView : UIView
{
    UIView             * bgView;
    UIView             * pickerView;
    UILabel            * lineLabel;
    UIButton           * finishButton;
    UIButton           * backButton;
    UIDatePicker       * datePicker;
    NSDateFormatter    * dateFormatter;
    NSString           * pickerDateString;
}
@property(nonatomic,weak)id<DatePickerViewDelegate> delegate;
@end
