//
//  AIPresentCustomTransition.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/17.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  自定义的present转场动画

#import "AIPresentCustomTransition.h"
#import "AIPresentDestViewController.h"
@interface AIPresentCustomTransition ()

@end

@implementation AIPresentCustomTransition

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AIPresentDestViewController *destVC = [[AIPresentDestViewController alloc]init];
    [self presentViewController:destVC animated:YES completion:nil];
}


@end
