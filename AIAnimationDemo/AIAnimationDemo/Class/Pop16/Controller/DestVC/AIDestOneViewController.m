//
//  AIDestOneViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIDestOneViewController.h"

@interface AIDestOneViewController ()

@end

@implementation AIDestOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label      = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.text          = @"我是第一个测试VC";
    label.textAlignment = NSTextAlignmentCenter;
    [label setAdjustsFontSizeToFitWidth:YES];
    label.textColor     = [UIColor blackColor];
    [self.view addSubview:label];
}



@end
