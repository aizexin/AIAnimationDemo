//
//  AIOvalView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/6.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITmallLoadingView.h"

@interface AITmallLoadingView ()<CAAnimationDelegate>

/**
 圆
 */
@property(nonatomic,weak)UIView *ovalView;
@end
@implementation AITmallLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Used as background.
        {
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.path          = [self path].CGPath;
            
            shapeLayer.fillColor   = [UIColor clearColor].CGColor;
            shapeLayer.strokeColor = [UIColor grayColor].CGColor;
            
            
            [self.layer addSublayer:shapeLayer];
        }
        UIView *ovalView         = [[UIView alloc]init];
        ovalView.backgroundColor = [UIColor blackColor];
        ovalView.ai_viewSize     = CGSizeMake(5, 5);
        ovalView.layer.cornerRadius = ovalView.ai_width * .5;
        ovalView.center          = CGPointMake(13.5, 2.5);
        self.ovalView            = ovalView;
        [self addSubview:ovalView];
    }
    return self;
}

- (void)animationWithLayer:(CALayer*)layer path:(UIBezierPath *)path {
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyAnimation setValue:layer forKey:@"layer"];
    keyAnimation.delegate             = self;
    keyAnimation.path                 = path.CGPath;
    keyAnimation.duration             = 5.;
    keyAnimation.removedOnCompletion  = NO;
    keyAnimation.fillMode             = kCAFillModeForwards;
    [layer addAnimation:keyAnimation forKey:nil];
}

- (UIBezierPath *)path {
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(13.5, 2.5)];
    [bezierPath addCurveToPoint: CGPointMake(16.5, 9.5) controlPoint1: CGPointMake(14.78, 3.97) controlPoint2: CGPointMake(16.07, 7.72)];
    [bezierPath addCurveToPoint: CGPointMake(24.5, 16.5) controlPoint1: CGPointMake(17.25, 12.58) controlPoint2: CGPointMake(21.3, 15.38)];
    [bezierPath addCurveToPoint: CGPointMake(54.5, 16.5) controlPoint1: CGPointMake(29.75, 18.33) controlPoint2: CGPointMake(54.5, 16.5)];
    [bezierPath addCurveToPoint: CGPointMake(60.5, 7.5) controlPoint1: CGPointMake(54.5, 16.5) controlPoint2: CGPointMake(61.14, 10.05)];
    [bezierPath addCurveToPoint: CGPointMake(64.5, 2.5) controlPoint1: CGPointMake(59.67, 4.19) controlPoint2: CGPointMake(63.55, 3.29)];
    [bezierPath addCurveToPoint: CGPointMake(74.5, 7.5) controlPoint1: CGPointMake(67.67, -0.12) controlPoint2: CGPointMake(74.5, 7.5)];
    [bezierPath addCurveToPoint: CGPointMake(74.5, 34.5) controlPoint1: CGPointMake(74.5, 7.5) controlPoint2: CGPointMake(86.5, 34.5)];
    [bezierPath addCurveToPoint: CGPointMake(2.5, 34.5) controlPoint1: CGPointMake(62.5, 34.5) controlPoint2: CGPointMake(2.5, 34.5)];
    [bezierPath addCurveToPoint: CGPointMake(9.5, 2.5) controlPoint1: CGPointMake(2.5, 34.5) controlPoint2: CGPointMake(-5.5, 2.5)];
    [bezierPath addCurveToPoint: CGPointMake(13.5, 2.5) controlPoint1: CGPointMake(15.03, 2.5) controlPoint2: CGPointMake(12.75, 1.64)];
    [bezierPath closePath];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    return bezierPath;
}
#pragma mark --CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CALayer *layer = [anim valueForKey:@"layer"];
    [self animationWithLayer:layer path:[self path]];
}
#pragma mark --public
- (void)startAnimation {
    [self animationWithLayer:_ovalView.layer path:[self path]];
}
@end
