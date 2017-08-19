//
//  AIButtonsViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  多个按钮像微博照片九宫格排布

#import "AIButtonsViewController.h"
#import "AIButtonsView.h"

@interface AIButtonsViewController ()

@end

@implementation AIButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AIButtonsView *btnView = [[AIButtonsView alloc]init];
    btnView.btnCount = 8;
    CGSize viewSize = [AIButtonsView sizeWithBtnCount:btnView.btnCount];
    btnView.frame = CGRectMake(100, 100, viewSize.width, viewSize.height);
    [self.view addSubview:btnView];
    
}



@end
