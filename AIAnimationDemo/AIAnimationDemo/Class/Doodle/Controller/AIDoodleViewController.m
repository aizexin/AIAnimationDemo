//
//  AIDoodleViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/4/17.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDoodleViewController.h"
#import "AFBrushBoard.h"
#import <MLTransition.h>

@interface AIDoodleViewController ()<UIGestureRecognizerDelegate>

@end

@implementation AIDoodleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AFBrushBoard *brushBoard = [[AFBrushBoard alloc]initWithFrame:self.view.frame];
    [self.view addSubview:brushBoard];
    brushBoard.disableMLTransition      = YES;
}



@end
