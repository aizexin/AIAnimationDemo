//
//  AIGradientLayerNavgationDelegate.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/3.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIGradientLayerNavgationDelegate.h"
#import "AIGradientTransitionAnimation.h"
@implementation AIGradientLayerNavgationDelegate


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    return (id)[AIGradientTransitionAnimation new];
}
@end
