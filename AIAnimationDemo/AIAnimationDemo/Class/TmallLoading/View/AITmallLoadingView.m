//
//  AIOvalView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/6.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITmallLoadingView.h"

@interface AITmallLoadingView ()

/**
 圆
 */
@property(nonatomic,weak)UIView *ovalView;
/** 背景路径*/
@property(nonatomic,weak)CAShapeLayer *shapeLayer;
@end
@implementation AITmallLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _type = AITmallTypeBlack;
        // Used as background.
        {
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.path          = [self path].CGPath;
            
            shapeLayer.fillColor   = [UIColor clearColor].CGColor;
            shapeLayer.strokeColor = [UIColor grayColor].CGColor;
            self.shapeLayer        =  shapeLayer;
            
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
    keyAnimation.path                 = path.CGPath;
    keyAnimation.repeatCount          = MAXFLOAT;
    keyAnimation.duration             = 5.;
    keyAnimation.removedOnCompletion  = NO;
    keyAnimation.fillMode             = kCAFillModeForwards;
    [layer addAnimation:keyAnimation forKey:nil];
}
- (void)animationStrokeWithLayer:(CALayer*)layer path:(UIBezierPath *)path {
    CGFloat MAX = 0.05f;
    CGFloat GAP = 0.95;
    
    CABasicAnimation *aniStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    aniStart.fromValue         = [NSNumber numberWithFloat:0.f];
    aniStart.toValue           = [NSNumber numberWithFloat:GAP];
    
    CABasicAnimation *aniEnd   = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    aniEnd.fromValue           = [NSNumber numberWithFloat:0.f + GAP];
    aniEnd.toValue             = [NSNumber numberWithFloat:2];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration          = 5.f;
    group.repeatCount       = CGFLOAT_MAX;
    group.fillMode          = kCAFillModeForwards;
//    group.autoreverses      = YES;
    group.animations        = @[aniEnd,aniStart];
    [self.shapeLayer addAnimation:group forKey:nil];
}

- (UIBezierPath *)path {
    
    //// Bezier Drawing
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(53.31, 4.03)];
    [bezierPath addCurveToPoint: CGPointMake(50.77, 1.03) controlPoint1: CGPointMake(52.78, 2.68) controlPoint2: CGPointMake(51.92, 1.66)];
    [bezierPath addLineToPoint: CGPointMake(50.61, 0.94)];
    [bezierPath addLineToPoint: CGPointMake(50.44, 0.88)];
    [bezierPath addCurveToPoint: CGPointMake(48.25, 0.49) controlPoint1: CGPointMake(49.67, 0.62) controlPoint2: CGPointMake(48.93, 0.49)];
    [bezierPath addCurveToPoint: CGPointMake(48.06, 0.49) controlPoint1: CGPointMake(48.19, 0.49) controlPoint2: CGPointMake(48.12, 0.49)];
    [bezierPath addCurveToPoint: CGPointMake(45.72, 1.14) controlPoint1: CGPointMake(47.26, 0.52) controlPoint2: CGPointMake(46.47, 0.74)];
    [bezierPath addCurveToPoint: CGPointMake(44.34, 2) controlPoint1: CGPointMake(45.13, 1.45) controlPoint2: CGPointMake(44.68, 1.73)];
    [bezierPath addCurveToPoint: CGPointMake(43.66, 2.55) controlPoint1: CGPointMake(44.06, 2.22) controlPoint2: CGPointMake(43.84, 2.4)];
    [bezierPath addLineToPoint: CGPointMake(43.53, 2.66)];
    [bezierPath addLineToPoint: CGPointMake(43.43, 2.79)];
    [bezierPath addCurveToPoint: CGPointMake(43.14, 3.1) controlPoint1: CGPointMake(43.42, 2.79) controlPoint2: CGPointMake(43.36, 2.87)];
    [bezierPath addCurveToPoint: CGPointMake(40.96, 5.15) controlPoint1: CGPointMake(42.23, 4.01) controlPoint2: CGPointMake(41.5, 4.69)];
    [bezierPath addCurveToPoint: CGPointMake(38.76, 6.8) controlPoint1: CGPointMake(40.44, 5.59) controlPoint2: CGPointMake(39.69, 6.15)];
    [bezierPath addCurveToPoint: CGPointMake(36.23, 8.01) controlPoint1: CGPointMake(37.96, 7.36) controlPoint2: CGPointMake(37.11, 7.77)];
    [bezierPath addCurveToPoint: CGPointMake(33.19, 8.38) controlPoint1: CGPointMake(35.32, 8.26) controlPoint2: CGPointMake(34.3, 8.38)];
    [bezierPath addLineToPoint: CGPointMake(20.44, 8.38)];
    [bezierPath addCurveToPoint: CGPointMake(17.89, 8.03) controlPoint1: CGPointMake(19.58, 8.38) controlPoint2: CGPointMake(18.72, 8.26)];
    [bezierPath addCurveToPoint: CGPointMake(15.63, 7.26) controlPoint1: CGPointMake(16.96, 7.78) controlPoint2: CGPointMake(16.2, 7.52)];
    [bezierPath addCurveToPoint: CGPointMake(13.68, 5.95) controlPoint1: CGPointMake(15.28, 7.1) controlPoint2: CGPointMake(14.65, 6.74)];
    [bezierPath addCurveToPoint: CGPointMake(11.91, 4.45) controlPoint1: CGPointMake(12.6, 5.07) controlPoint2: CGPointMake(12.12, 4.65)];
    [bezierPath addCurveToPoint: CGPointMake(10.13, 2.7) controlPoint1: CGPointMake(11.59, 4.15) controlPoint2: CGPointMake(10.99, 3.56)];
    [bezierPath addCurveToPoint: CGPointMake(7.64, 0.99) controlPoint1: CGPointMake(9.6, 2.07) controlPoint2: CGPointMake(8.78, 1.51)];
    [bezierPath addCurveToPoint: CGPointMake(5.32, 0.47) controlPoint1: CGPointMake(6.9, 0.64) controlPoint2: CGPointMake(6.12, 0.47)];
    [bezierPath addCurveToPoint: CGPointMake(3.08, 0.93) controlPoint1: CGPointMake(4.57, 0.47) controlPoint2: CGPointMake(3.82, 0.62)];
    [bezierPath addLineToPoint: CGPointMake(2.94, 0.98)];
    [bezierPath addLineToPoint: CGPointMake(2.81, 1.06)];
    [bezierPath addCurveToPoint: CGPointMake(0.33, 4.08) controlPoint1: CGPointMake(1.69, 1.73) controlPoint2: CGPointMake(0.85, 2.75)];
    [bezierPath addCurveToPoint: CGPointMake(-0.36, 8.42) controlPoint1: CGPointMake(-0.14, 5.27) controlPoint2: CGPointMake(-0.36, 6.69)];
    [bezierPath addLineToPoint: CGPointMake(-0.36, 21.6)];
    [bezierPath addLineToPoint: CGPointMake(-0.36, 21.64)];
    [bezierPath addCurveToPoint: CGPointMake(1.27, 25.5) controlPoint1: CGPointMake(-0.26, 23.37) controlPoint2: CGPointMake(0.27, 24.64)];
    [bezierPath addCurveToPoint: CGPointMake(5.19, 26.99) controlPoint1: CGPointMake(2.23, 26.35) controlPoint2: CGPointMake(3.55, 26.85)];
    [bezierPath addLineToPoint: CGPointMake(5.29, 27)];
    [bezierPath addLineToPoint: CGPointMake(5.39, 27)];
    [bezierPath addCurveToPoint: CGPointMake(5.65, 26.99) controlPoint1: CGPointMake(5.51, 27) controlPoint2: CGPointMake(5.59, 27)];
    [bezierPath addCurveToPoint: CGPointMake(5.72, 26.99) controlPoint1: CGPointMake(5.68, 26.99) controlPoint2: CGPointMake(5.7, 26.99)];
    [bezierPath addCurveToPoint: CGPointMake(5.81, 27) controlPoint1: CGPointMake(5.74, 26.99) controlPoint2: CGPointMake(5.77, 26.99)];
    [bezierPath addLineToPoint: CGPointMake(5.87, 27)];
    [bezierPath addLineToPoint: CGPointMake(47.79, 27)];
    [bezierPath addLineToPoint: CGPointMake(47.85, 27)];
    [bezierPath addCurveToPoint: CGPointMake(47.96, 26.99) controlPoint1: CGPointMake(47.9, 26.99) controlPoint2: CGPointMake(47.93, 26.99)];
    [bezierPath addCurveToPoint: CGPointMake(48.05, 27) controlPoint1: CGPointMake(47.98, 26.99) controlPoint2: CGPointMake(48.01, 26.99)];
    [bezierPath addCurveToPoint: CGPointMake(48.3, 27) controlPoint1: CGPointMake(48.12, 27) controlPoint2: CGPointMake(48.2, 27)];
    [bezierPath addLineToPoint: CGPointMake(48.33, 27)];
    [bezierPath addLineToPoint: CGPointMake(48.41, 27)];
    [bezierPath addLineToPoint: CGPointMake(48.5, 26.99)];
    [bezierPath addCurveToPoint: CGPointMake(52.47, 25.47) controlPoint1: CGPointMake(50.2, 26.85) controlPoint2: CGPointMake(51.53, 26.34)];
    [bezierPath addCurveToPoint: CGPointMake(54, 21.65) controlPoint1: CGPointMake(53.39, 24.6) controlPoint2: CGPointMake(53.89, 23.35)];
    [bezierPath addLineToPoint: CGPointMake(54, 21.6)];
    [bezierPath addLineToPoint: CGPointMake(54, 8.42)];
    [bezierPath addCurveToPoint: CGPointMake(53.31, 4.03) controlPoint1: CGPointMake(54, 6.65) controlPoint2: CGPointMake(53.77, 5.22)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(52.11, 8.57)];
    [bezierPath addLineToPoint: CGPointMake(52.11, 21.56)];
    [bezierPath addCurveToPoint: CGPointMake(51.08, 24.39) controlPoint1: CGPointMake(52.03, 22.87) controlPoint2: CGPointMake(51.69, 23.81)];
    [bezierPath addCurveToPoint: CGPointMake(48.32, 25.4) controlPoint1: CGPointMake(50.46, 24.96) controlPoint2: CGPointMake(49.54, 25.29)];
    [bezierPath addCurveToPoint: CGPointMake(48.3, 25.4) controlPoint1: CGPointMake(48.31, 25.4) controlPoint2: CGPointMake(48.31, 25.4)];
    [bezierPath addCurveToPoint: CGPointMake(47.96, 25.39) controlPoint1: CGPointMake(48.17, 25.4) controlPoint2: CGPointMake(48.08, 25.39)];
    [bezierPath addCurveToPoint: CGPointMake(47.73, 25.4) controlPoint1: CGPointMake(47.9, 25.39) controlPoint2: CGPointMake(47.83, 25.39)];
    [bezierPath addLineToPoint: CGPointMake(5.94, 25.4)];
    [bezierPath addCurveToPoint: CGPointMake(5.72, 25.39) controlPoint1: CGPointMake(5.84, 25.39) controlPoint2: CGPointMake(5.78, 25.39)];
    [bezierPath addCurveToPoint: CGPointMake(5.38, 25.4) controlPoint1: CGPointMake(5.61, 25.39) controlPoint2: CGPointMake(5.54, 25.39)];
    [bezierPath addCurveToPoint: CGPointMake(2.62, 24.39) controlPoint1: CGPointMake(4.19, 25.29) controlPoint2: CGPointMake(3.27, 24.96)];
    [bezierPath addCurveToPoint: CGPointMake(1.52, 21.56) controlPoint1: CGPointMake(1.97, 23.81) controlPoint2: CGPointMake(1.6, 22.87)];
    [bezierPath addLineToPoint: CGPointMake(1.52, 8.42)];
    [bezierPath addCurveToPoint: CGPointMake(3.89, 2.37) controlPoint1: CGPointMake(1.52, 5.33) controlPoint2: CGPointMake(2.31, 3.31)];
    [bezierPath addCurveToPoint: CGPointMake(5.32, 2.08) controlPoint1: CGPointMake(4.38, 2.17) controlPoint2: CGPointMake(4.85, 2.08)];
    [bezierPath addCurveToPoint: CGPointMake(6.74, 2.4) controlPoint1: CGPointMake(5.8, 2.08) controlPoint2: CGPointMake(6.28, 2.18)];
    [bezierPath addCurveToPoint: CGPointMake(8.64, 3.68) controlPoint1: CGPointMake(7.65, 2.82) controlPoint2: CGPointMake(8.28, 3.25)];
    [bezierPath addCurveToPoint: CGPointMake(10.51, 5.52) controlPoint1: CGPointMake(9.55, 4.59) controlPoint2: CGPointMake(10.17, 5.2)];
    [bezierPath addCurveToPoint: CGPointMake(12.38, 7.11) controlPoint1: CGPointMake(10.84, 5.84) controlPoint2: CGPointMake(11.47, 6.37)];
    [bezierPath addCurveToPoint: CGPointMake(14.75, 8.68) controlPoint1: CGPointMake(13.29, 7.85) controlPoint2: CGPointMake(14.08, 8.37)];
    [bezierPath addCurveToPoint: CGPointMake(17.3, 9.56) controlPoint1: CGPointMake(15.42, 8.98) controlPoint2: CGPointMake(16.27, 9.27)];
    [bezierPath addCurveToPoint: CGPointMake(20.44, 9.99) controlPoint1: CGPointMake(18.33, 9.84) controlPoint2: CGPointMake(19.37, 9.99)];
    [bezierPath addLineToPoint: CGPointMake(33.19, 9.99)];
    [bezierPath addCurveToPoint: CGPointMake(36.81, 9.53) controlPoint1: CGPointMake(34.5, 9.99) controlPoint2: CGPointMake(35.7, 9.84)];
    [bezierPath addCurveToPoint: CGPointMake(39.95, 8.05) controlPoint1: CGPointMake(37.92, 9.23) controlPoint2: CGPointMake(38.97, 8.73)];
    [bezierPath addCurveToPoint: CGPointMake(42.3, 6.28) controlPoint1: CGPointMake(40.94, 7.36) controlPoint2: CGPointMake(41.72, 6.77)];
    [bezierPath addCurveToPoint: CGPointMake(44.58, 4.14) controlPoint1: CGPointMake(42.87, 5.79) controlPoint2: CGPointMake(43.63, 5.08)];
    [bezierPath addCurveToPoint: CGPointMake(45, 3.68) controlPoint1: CGPointMake(44.78, 3.94) controlPoint2: CGPointMake(44.92, 3.78)];
    [bezierPath addCurveToPoint: CGPointMake(45.62, 3.18) controlPoint1: CGPointMake(45.15, 3.55) controlPoint2: CGPointMake(45.36, 3.38)];
    [bezierPath addCurveToPoint: CGPointMake(46.72, 2.5) controlPoint1: CGPointMake(45.88, 2.98) controlPoint2: CGPointMake(46.24, 2.75)];
    [bezierPath addCurveToPoint: CGPointMake(48.14, 2.09) controlPoint1: CGPointMake(47.19, 2.25) controlPoint2: CGPointMake(47.67, 2.11)];
    [bezierPath addCurveToPoint: CGPointMake(48.25, 2.09) controlPoint1: CGPointMake(48.18, 2.09) controlPoint2: CGPointMake(48.21, 2.09)];
    [bezierPath addCurveToPoint: CGPointMake(49.74, 2.37) controlPoint1: CGPointMake(48.7, 2.09) controlPoint2: CGPointMake(49.19, 2.19)];
    [bezierPath addCurveToPoint: CGPointMake(52.11, 8.42) controlPoint1: CGPointMake(51.32, 3.25) controlPoint2: CGPointMake(52.11, 5.26)];
    [bezierPath addLineToPoint: CGPointMake(52.11, 8.57)];
    [bezierPath closePath];
    bezierPath.usesEvenOddFillRule = YES;
    
//    [fillColor setFill];
    [bezierPath fill];
    
    return bezierPath;
}

#pragma mark --public
- (void)startAnimation {
    switch (_type) {
        case AITmallTypeBlack:
            [self animationWithLayer:_ovalView.layer path:[self path]];
            break;
        case AITmallTypeLight:
            [self animationWithLayer:_ovalView.layer path:[self path]];
            break;
        default:
            break;
    }
}
-(void)setType:(AITmallType)type {
    _type = type;
    switch (type) {
        case AITmallTypeBlack:
            self.shapeLayer.strokeColor = [UIColor grayColor].CGColor;
//            self.ovalView.hidden        = NO;
            break;
        case AITmallTypeLight:
            self.shapeLayer.strokeColor   = [UIColor lightGrayColor].CGColor;
            self.ovalView.backgroundColor = self.backgroundColor;
//            self.ovalView.hidden        = YES;
            break;
        default:
            break;
    }
}
@end
