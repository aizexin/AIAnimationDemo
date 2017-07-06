//
//  AIFoldRotatedView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIFoldRotatedView.h"
#import "UIImage+ImageEffects.h"
@interface AIFoldRotatedView ()<CAAnimationDelegate>

@property(nonatomic,weak)UIImageView *backView;
@property(nonatomic,weak)UIImageView *faceView;
@end
@implementation AIFoldRotatedView

- (instancetype)initWithFrame:(CGRect)frame Image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        //背景
        UIImageView *backView        = [[UIImageView alloc]initWithFrame:self.bounds];
        backView.image               = [image blurImage];
        self.backView                = backView;
        //前景
        UIImageView *faceImageView   = [[UIImageView alloc]initWithFrame:self.bounds];
        self.faceView                = faceImageView;
        faceImageView.image          = image;
        faceImageView.contentMode    = UIViewContentModeScaleToFill;
        
        [self addSubview:backView];
        [self addSubview:faceImageView];
        
    }
    return self;
}

/**
 折叠动画
 
 @param timing 节奏
 @param from 开始
 @param to 结束
 @param duration 持续时长
 @param delay 延时
 */
- (CABasicAnimation*)foldingAnimationTiming:(NSString *)timing from:(CGFloat)from to:(CGFloat)to duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay  {
    CABasicAnimation *rotateAnimation     = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.timingFunction        = [CAMediaTimingFunction functionWithName:timing];
    rotateAnimation.fromValue             = @(from);
    rotateAnimation.toValue               = @(to);
    rotateAnimation.duration              = duration;
    rotateAnimation.delegate              = self;
    rotateAnimation.fillMode              = kCAFillModeForwards;
    rotateAnimation.removedOnCompletion   = NO;
    rotateAnimation.beginTime             = CACurrentMediaTime() + delay;
    return rotateAnimation;
}

/**
 旋转180度

 @param duration 持续时长
 @param delay 延时
 */
- (void)foldingAnimationMI_PWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {

    CABasicAnimation *animation1          = [self foldingAnimationTiming:kCAMediaTimingFunctionEaseIn from:0 to:M_PI_2 duration:duration * .5 delay:delay ];
    [animation1 setValue:@"animation1Layer" forKey:@"name"];
    [self.layer addAnimation:animation1 forKey:@"animation1"];
}

#pragma mark -CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *name = [anim valueForKey:@"name"];
    if ([name isEqualToString:@"animation1Layer"]) {
        // 让faceview到最前面来
        [self bringSubviewToFront:self.backView];
        CABasicAnimation *animation2          = [self foldingAnimationTiming:kCAMediaTimingFunctionEaseOut from:M_PI_2 to:M_PI duration:1. delay:0 ];
        [self.layer addAnimation:animation2 forKey:nil];
        
    }else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(foldRotatedView:animationDidStop:finished:)]) {
            [self.delegate foldRotatedView:self animationDidStop:anim finished:flag];
        }else {
            AILog(@"未设置代理");
        }
    }
}


@end
