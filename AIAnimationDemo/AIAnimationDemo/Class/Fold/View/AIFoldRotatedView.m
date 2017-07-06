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
        backView.hidden              = YES;
        self.backView                = backView;
        //前景
        UIImageView *faceImageView   = [[UIImageView alloc]initWithFrame:self.bounds];
        self.faceView                = faceImageView;
        faceImageView.image          = image;
        faceImageView.contentMode    = UIViewContentModeScaleToFill;
        
        [faceImageView addSubview:backView];
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
 @param hiden 是否隐藏contentView
 */
- (CABasicAnimation*)foldingAnimationTiming:(NSString *)timing from:(CGFloat)from to:(CGFloat)to duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay hiden:(BOOL)hiden {
    CABasicAnimation *rotateAnimation     = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.timingFunction        = [CAMediaTimingFunction functionWithName:timing];
    rotateAnimation.fromValue             = @(from);
    rotateAnimation.toValue               = @(to);
    rotateAnimation.duration              = duration;
    rotateAnimation.delegate              = self;
    rotateAnimation.fillMode              = kCAFillModeForwards;
    rotateAnimation.removedOnCompletion   = NO;
    rotateAnimation.beginTime             = CACurrentMediaTime() + delay;
//    self.backView.hidden                  = hiden ;
    return rotateAnimation;
}

/**
 旋转180度

 @param duration 持续时长
 @param delay 延时
 */
- (void)foldingAnimationMI_PWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
//    CAAnimationGroup *group               = [CAAnimationGroup animation];
//    group.duration                        = duration;
//    group.beginTime                       = CACurrentMediaTime() + delay;
//    group.removedOnCompletion             = NO;
//    group.fillMode                        = kCAFillModeForwards;
//    group.delegate                        = self;
    CABasicAnimation *animation1          = [self foldingAnimationTiming:kCAMediaTimingFunctionEaseIn from:0 to:M_PI_2 duration:duration * .5 delay:delay hiden:YES];
    [animation1 setValue:@"animation1Layer" forKey:@"name"];
    [self.layer addAnimation:animation1 forKey:@"animation1"];
    
  
   
//    group.animations                      = @[animation1,animation2];
//    [self.layer addAnimation:group forKey:@"group"];
}

#pragma mark -CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *name = [anim valueForKey:@"name"];
    if ([name isEqualToString:@"animation1Layer"]) {
        self.backView.hidden                  = NO;
        CABasicAnimation *animation2          = [self foldingAnimationTiming:kCAMediaTimingFunctionEaseOut from:M_PI_2 to:M_PI duration:1. delay:0 hiden:NO];
        [self.layer addAnimation:animation2 forKey:nil];
        
    }
}


@end
