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
    
    UIView *toView          = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *herbView        = _presenting ? toView : [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    CGRect initialFrame     = _presenting ? _originFrame : herbView.frame;
    CGRect finalFrame       = _presenting ? herbView.frame : _originFrame;
    
    CGFloat xScaleFactor    = _presenting ?
    initialFrame.size.width / finalFrame.size.width:
    finalFrame.size.width   / initialFrame.size.width;
    
    CGFloat yScaleFactor    = _presenting ?
    initialFrame.size.height    / finalFrame.size.height:
    finalFrame.size.height      /   initialFrame.size.height;
    
    CGAffineTransform scaleTransfrom   = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor);
    if (_presenting) {
        herbView.transform  = scaleTransfrom;
        herbView.center     = CGPointMake(
                                          initialFrame.size.width *.5 + initialFrame.origin.x,
                                          initialFrame.size.height *.5 + initialFrame.origin.y);
        herbView.clipsToBounds          = YES;
    }
    
    [containerView addSubview:toView];
    [containerView bringSubviewToFront:herbView];
    
    [UIView animateWithDuration:_duration delay:1. usingSpringWithDamping:.4 initialSpringVelocity:0. options:(UIViewAnimationOptionCurveLinear) animations:^{
        
        herbView.transform      = self.presenting ? CGAffineTransformIdentity:scaleTransfrom;
        herbView.center         = CGPointMake(
                                              initialFrame.size.width *.5 + initialFrame.origin.x,
                                              initialFrame.size.height *.5 + initialFrame.origin.y);
        
    } completion:^(BOOL finished) {
        if (!self.presenting) {
            [self dismissComletion];
        }else {
            [transitionContext completeTransition:YES];
        }
    }];
}

- (void)dismissComletion {
    
}
@end
