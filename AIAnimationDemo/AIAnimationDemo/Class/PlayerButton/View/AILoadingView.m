//
//  AILoading.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/8/5.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AILoadingView.h"

@interface AILoadingView ()

@property(nonatomic,strong)CAShapeLayer *loadingLayer;
@end
@implementation AILoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath *path      = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.loadingLayer.path  = path.CGPath;
}
- (void)createUI {
    self.loadingLayer             = [CAShapeLayer layer];
    self.loadingLayer.lineWidth   = 3.;
    self.loadingLayer.fillColor   = [UIColor clearColor].CGColor;
    self.loadingLayer.strokeColor = [UIColor flatBlueColor].CGColor;
    [self.layer addSublayer:self.loadingLayer];
    self.loadingLayer.lineCap     = kCALineCapRound;
    
    [self loadingAnimation];
}
- (void)loadingAnimation {
//    NSArray *arrayTo  = @[@0,@.3,@.6];
    CAAnimationGroup *strokeAniamtionGroup = [CAAnimationGroup animation];
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue         = @0;
    strokeStartAnimation.toValue           = @1.;
    strokeStartAnimation.timingFunction    = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *strokeEndAnimation   = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue           = @.0;
    strokeEndAnimation.toValue             = @1.;
    strokeEndAnimation.duration            = 1.;
    
    strokeAniamtionGroup.duration          = 2.;
//    strokeAniamtionGroup.repeatDuration    = 5.;
    strokeAniamtionGroup.repeatCount       = MAXFLOAT;
    strokeAniamtionGroup.animations        = @[strokeEndAnimation,strokeStartAnimation];
    [self.loadingLayer addAnimation:strokeAniamtionGroup forKey:nil];
}

@end
