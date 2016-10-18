//
//  AIWillComeLoadViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/17.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  wellcome动画

#import "AIWellComeLoadViewController.h"
#import "AIWellComeAnimationView.h"
#import "UIView+SetRect.h"
@interface AIWellComeLoadViewController ()

@end

@implementation AIWellComeLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

-(void)setUI{
    AIWellComeAnimationView *wellComeAnimationView = [[AIWellComeAnimationView alloc]init];
    wellComeAnimationView.viewSize                 = CGSizeMake(100, 100);
    wellComeAnimationView.center                   = self.view.center;
    [self.view addSubview:wellComeAnimationView];
}



@end
