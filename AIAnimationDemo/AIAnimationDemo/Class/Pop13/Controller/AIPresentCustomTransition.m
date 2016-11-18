//
//  AIPresentCustomTransition.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/17.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  自定义的present转场动画

#import "AIPresentCustomTransition.h"
#import "AIPresentDestViewController.h"
#import "AIPresentAnimation.h"
#import "AIDismissAnimation.h"
@interface AIPresentCustomTransition ()<UIViewControllerTransitioningDelegate>

@end

@implementation AIPresentCustomTransition

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AIPresentDestViewController *destVC = [[AIPresentDestViewController alloc]init];
    destVC.transitioningDelegate = self;
    destVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:destVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [AIPresentAnimation new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [AIDismissAnimation new];
}

@end
