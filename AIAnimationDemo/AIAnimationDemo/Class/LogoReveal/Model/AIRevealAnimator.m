//
//  AIRevealAnimator.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/26.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIRevealAnimator.h"
@implementation AIRevealAnimator


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _animationDuration;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.storedContext  = transitionContext;
    
    if (self.operation  == UINavigationControllerOperationPush) {
        
    }
}
@end
