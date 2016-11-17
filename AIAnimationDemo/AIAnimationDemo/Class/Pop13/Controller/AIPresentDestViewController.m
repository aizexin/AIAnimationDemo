//
//  AIPresentDestViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/17.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPresentDestViewController.h"

@interface AIPresentDestViewController ()

@end

@implementation AIPresentDestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame      = CGRectMake(0, 0, 200, 400);
    btn.center     = self.view.center;
    [btn setTitle:@"dissmis" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(onClickBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
}

-(void)onClickBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
