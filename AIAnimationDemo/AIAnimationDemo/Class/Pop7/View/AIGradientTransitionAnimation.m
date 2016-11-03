//
//  AIGradientTransitionAnimation.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/3.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIGradientTransitionAnimation.h"
#import "AICAGradientLayerViewController.h"
#import "AIPush2ViewController.h"
#import "CAGradientMaskView.h"

#import <UIKit/UIKit.h>

#define TransitionTimeInterVal 4.
@interface AIGradientTransitionAnimation ()<UIViewControllerAnimatedTransitioning>

@property (weak, nonatomic) id transitionContext;

@property (nonatomic, strong) CAGradientMaskView *tranformFadeViewOne;
@end

@implementation AIGradientTransitionAnimation

// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return TransitionTimeInterVal;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext                  = transitionContext;
    UIView *containerView                   = [transitionContext containerView];
    AICAGradientLayerViewController *formVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    AIPush2ViewController *toVC             = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:toVC.view];
    
    //下面是设置动画
    self.tranformFadeViewOne               = [[CAGradientMaskView alloc] initWithFrame:toVC.view.bounds];
    self.tranformFadeViewOne.contentMode   = UIViewContentModeScaleAspectFill;
    self.tranformFadeViewOne.fadeDuradtion = TransitionTimeInterVal;
    UIImage *screenImage                   = formVC.lastScreenImage;//[UIImage imageNamed:@"3"];
    self.tranformFadeViewOne.image         = screenImage;
    [toVC.view addSubview:self.tranformFadeViewOne];
    [self.tranformFadeViewOne fadeAnimated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.tranformFadeViewOne.fadeDuradtion * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tranformFadeViewOne removeFromSuperview];
        //标记转场完成会调用 animationEnded
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    });
    
}

/**
 转场动画完成后调用

 */
-(void)animationEnded:(BOOL)transitionCompleted{
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;

}


@end
