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
        UIImageView *view        = [[UIImageView alloc]initWithFrame:self.bounds];
        view.image               = [image blurImage];
        self.backView            = view;
        [self addSubview:view];
        //前景
        UIImageView *faceImageView   = [[UIImageView alloc]initWithFrame:self.bounds];
        self.faceView                = faceImageView;
        faceImageView.image          = image;
        faceImageView.contentMode    = UIViewContentModeScaleToFill;
        
        [self.backView addSubview:faceImageView];
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
- (void)foldingAnimationTiming:(NSString *)timing from:(CGFloat)from to:(CGFloat)to duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay hiden:(BOOL)hiden {
    CABasicAnimation *rotateAnimation     = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.timingFunction        = [CAMediaTimingFunction functionWithName:timing];
    rotateAnimation.fromValue             = @(from);
    rotateAnimation.toValue               = @(to);
    rotateAnimation.duration              = duration;
    rotateAnimation.delegate              = self;
    rotateAnimation.fillMode              = kCAFillModeForwards;
    rotateAnimation.removedOnCompletion   = NO;
    rotateAnimation.beginTime             = CACurrentMediaTime() + delay;
    
    [self.layer addAnimation:rotateAnimation forKey:@"rotation.x"];
//    [self.backView.layer addAnimation:rotateAnimation forKey:@"rotation.x"];
}


@end
