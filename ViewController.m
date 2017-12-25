//
//  ViewController.m
//  DatePickerView
//
//  Created by Kaden Jack on 2017/11/27.
//  Copyright © 2017年 Kaden Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton new];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 200);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"选择日期" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    picker = [[DatePickerView alloc]init];
    picker.frame = [UIScreen mainScreen].bounds;
    picker.delegate = self;
    [self.view addSubview:picker];
    picker.hidden = YES;
}
- (void)clickButton{
    picker.hidden = NO;
}
- (void)datePickerWithDateString:(NSString *)dateString
{
    NSLog(@"dateString is %@",dateString);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
