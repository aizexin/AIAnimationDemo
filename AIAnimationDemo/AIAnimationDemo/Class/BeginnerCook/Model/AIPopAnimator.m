//
//  AIPopAnimator.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/2.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPopAnimator.h"

@implementation AIPopAnimator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _duration       = 1.;
        _presenting     = YES;
        _originFrame    = CGRectZero;
    }
    return self;
}

#pragma mark -UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return _duration;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView   = [transitionContext containerView];
    
//    UIView *toView          = [transitionContext viewForKey:( )];
}
@end
