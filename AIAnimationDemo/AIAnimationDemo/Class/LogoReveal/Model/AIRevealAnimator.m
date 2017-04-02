//
//  AIRevealAnimator.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/26.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIRevealAnimator.h"
#import "AIRWLogoLayer.h"
#import "AILogoRevealViewController.h"
@implementation AIRevealAnimator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _animationDuration  = 2.;
        _operation          = UINavigationControllerOperationPush;
    }
    return self;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _animationDuration;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.storedContext  = transitionContext;
    
    if (self.operation  == UINavigationControllerOperationPush) {
        AILogoRevealViewController *fromVC     = [transitionContext viewControllerForKey:( UITransitionContextFromViewKey)];
        UIViewController *toVC       = [transitionContext viewControllerForKey:( UITransitionContextToViewControllerKey)];
        
        [transitionContext.containerView addSubview:toVC.view];
        toVC.view.frame              = [transitionContext finalFrameForViewController:toVC];
        
        CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.fromValue          = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.toValue            = [NSValue valueWithCATransform3D:
                                        CATransform3DConcat(
                                                            CATransform3DMakeTranslation(0.0, -10.0, 0.0),CATransform3DMakeScale(150.0, 150.0, 1.0))];
        animation.duration           = _animationDuration;
        animation.delegate           = self;
        animation.fillMode           = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        animation.timingFunction     = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
        CAShapeLayer *maskLayer      = [[AIRWLogoLayer alloc]logoLayer];
        maskLayer.position           = fromVC.logo.position;
        [maskLayer addAnimation:animation forKey:nil];
        toVC.view.layer.mask         = maskLayer;
//        [fromVC.logo addAnimation:animation forKey:nil];
    }
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (_storedContext) {
        [_storedContext completeTransition:!_storedContext.transitionWasCancelled];
        AILogoRevealViewController *fromVC     = [_storedContext viewControllerForKey:( UITransitionContextFromViewKey)];
        [fromVC.logo removeAllAnimations];
        UIViewController *toVC       = [_storedContext viewControllerForKey:( UITransitionContextToViewControllerKey)];
        toVC.view.layer.mask         = nil;
    }
    _storedContext                   = nil;
}
@end
