//
//  AIPush2ViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/3.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  push过来的viewController

#import "AIPush2ViewController.h"

@interface AIPush2ViewController ()

@end

@implementation AIPush2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label            = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, MainSize.width, 50)];
    label.textColor           = [UIColor blackColor];
    label.backgroundColor     = [UIColor colorWithRed:86 green:134 blue:188 alpha:1.];
    label.text                = @"我是第二个页面1234567890";
    label.center              = self.view.center;
    [label setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:label];
}



@end
