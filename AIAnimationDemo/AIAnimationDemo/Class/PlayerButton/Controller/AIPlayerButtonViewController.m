//
//  AIPlayerButtonViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/28.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPlayerButtonViewController.h"
#import "AIPlayerButton.h"
#import "AILoadingView.h"
@interface AIPlayerButtonViewController ()

@end

@implementation AIPlayerButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AIPlayerButton *button = [[AIPlayerButton alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
    button.backgroundColor = [UIColor flatWhiteColorDark];
    button.strokeColor     = [UIColor flatBlueColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(onclickBuutton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    AILoadingView *loadingView  = [[AILoadingView alloc]initWithFrame:CGRectMake(100, 200, 30, 30)];
    loadingView.backgroundColor = [UIColor flatWhiteColor];
    [self.view addSubview:loadingView];
    
}

- (void)onclickBuutton:(UIButton*)button {
    AILog(@"222222222222");
    button.selected        = !button.isSelected;
}

@end
