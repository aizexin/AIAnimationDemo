//
//  AIBaiduLoadHUDViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  模仿百度的加载控件

#import "AIBaiduLoadHUDViewController.h"
#import "AIBaiduHUD.h"
@interface AIBaiduLoadHUDViewController ()

@end

@implementation AIBaiduLoadHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [AIBaiduHUD show];
    self.view.backgroundColor = [UIColor grayColor];
}




@end
