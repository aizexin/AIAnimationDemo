//
//  AIPlayerButtonViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/28.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPlayerButtonViewController.h"
#import "AIPlayerButton.h"
@interface AIPlayerButtonViewController ()

@end

@implementation AIPlayerButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AIPlayerButton *button = [[AIPlayerButton alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    [self.view addSubview:button];
}



@end
