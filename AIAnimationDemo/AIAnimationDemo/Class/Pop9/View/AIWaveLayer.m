//
//  AIWaveLayer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/21.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIWaveLayer.h"


@interface AIWaveLayer ()
@property (strong, nonatomic) UIBezierPath *wavePathPre;
@property (strong, nonatomic) UIBezierPath *wavePathStarting;
@property (strong, nonatomic) UIBezierPath *wavePathLow;
@property (strong, nonatomic) UIBezierPath *wavePathMid;
@property (strong, nonatomic) UIBezierPath *wavePathHigh;
@property (strong, nonatomic) UIBezierPath *wavePathComplete;
@end
@implementation AIWaveLayer

static const NSTimeInterval KAnimationDuration = 0.18;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.path = self.wavePathStarting.CGPath;
    }
    return self;
}

- (UIBezierPath *)wavePathPre {
    if (!_wavePathPre) {
        _wavePathPre = [[UIBezierPath alloc] init];
        [_wavePathPre moveToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathPre addLineToPoint:CGPointMake(0.0, 99.0)];
        [_wavePathPre addLineToPoint:CGPointMake(100.0, 99.0)];
        [_wavePathPre addLineToPoint:CGPointMake(100.0, 100.0)];
        [_wavePathPre addLineToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathPre closePath];
    }
    return _wavePathPre;
}

- (UIBezierPath *)wavePathStarting {
    if (!_wavePathStarting) {
        _wavePathStarting = [[UIBezierPath alloc] init];
        [_wavePathStarting moveToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathStarting addLineToPoint:CGPointMake(0.0, 80.0)];
        [_wavePathStarting addCurveToPoint:CGPointMake(100.0, 80.0) controlPoint1:CGPointMake(30.0, 70.0) controlPoint2:CGPointMake(40.0, 90.0)];
        [_wavePathStarting addLineToPoint:CGPointMake(100.0, 100.0)];
        [_wavePathStarting addLineToPoint:CGPointMake(0, 100.0)];
        [_wavePathStarting closePath];
    }
    return _wavePathStarting;
}

- (UIBezierPath *)wavePathLow {
    if (!_wavePathLow) {
        _wavePathLow = [[UIBezierPath alloc] init];
        [_wavePathLow moveToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathLow addLineToPoint:CGPointMake(0.0, 60.0)];
        [_wavePathLow addCurveToPoint:CGPointMake(100.0, 60.0) controlPoint1:CGPointMake(30.0, 65.0) controlPoint2:CGPointMake(40.0, 50.0)];
        [_wavePathLow addLineToPoint:CGPointMake(100.0, 100.0)];
        [_wavePathLow addLineToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathLow closePath];
    }
    return _wavePathLow;
}

- (UIBezierPath *)wavePathMid {
    if (!_wavePathMid) {
        _wavePathMid = [[UIBezierPath alloc] init];
        [_wavePathMid moveToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathMid addLineToPoint:CGPointMake(0.0, 40.0)];
        [_wavePathMid addCurveToPoint:CGPointMake(100.0, 40.0) controlPoint1:CGPointMake(30.0, 30.0) controlPoint2:CGPointMake(40.0, 50.0)];
        [_wavePathMid addLineToPoint:CGPointMake(100.0, 100.0)];
        [_wavePathMid addLineToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathMid closePath];
    }
    return _wavePathMid;
}

- (UIBezierPath *)wavePathHigh {
    if (!_wavePathHigh) {
        _wavePathHigh = [[UIBezierPath alloc] init];
        [_wavePathHigh moveToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathHigh addLineToPoint:CGPointMake(0.0, 20.0)];
        [_wavePathHigh addCurveToPoint:CGPointMake(100.0, 20.0) controlPoint1:CGPointMake(30.0, 25.0) controlPoint2:CGPointMake(40.0, 10.0)];
        [_wavePathHigh addLineToPoint:CGPointMake(100.0, 100.0)];
        [_wavePathHigh addLineToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathHigh closePath];
    }
    return _wavePathHigh;
}

- (UIBezierPath *)wavePathComplete {
    if (!_wavePathComplete) {
        _wavePathComplete = [[UIBezierPath alloc] init];
        [_wavePathComplete moveToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathComplete addLineToPoint:CGPointMake(0.0, -5.0)];
        [_wavePathComplete addLineToPoint:CGPointMake(100.0, -5.0)];
        [_wavePathComplete addLineToPoint:CGPointMake(100.0, 100.0)];
        [_wavePathComplete addLineToPoint:CGPointMake(0.0, 100.0)];
        [_wavePathComplete closePath];
    }
    return _wavePathComplete;
}

- (void)waveAnimate {
    //    1
    CABasicAnimation *waveAnimationPre = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationPre.fromValue = (__bridge id _Nullable)(self.wavePathPre.CGPath);
    waveAnimationPre.toValue = (__bridge id _Nullable)(self.wavePathStarting.CGPath);
    waveAnimationPre.beginTime = 0.0;
    waveAnimationPre.duration = KAnimationDuration;
    //    2
    CABasicAnimation *waveAnimationLow = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationLow.fromValue = (__bridge id _Nullable)(self.wavePathStarting.CGPath);
    waveAnimationLow.toValue = (__bridge id _Nullable)(self.wavePathLow.CGPath);
    waveAnimationLow.beginTime = waveAnimationPre.beginTime + waveAnimationPre.duration;
    waveAnimationLow.duration = KAnimationDuration;
    //    3
    CABasicAnimation *waveAnimationMid = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationMid.fromValue = (__bridge id _Nullable)(self.wavePathLow.CGPath);
    waveAnimationMid.toValue = (__bridge id _Nullable)(self.wavePathMid.CGPath);
    waveAnimationMid.beginTime = waveAnimationLow.beginTime + waveAnimationLow.duration;
    waveAnimationMid.duration = KAnimationDuration;
    //    4
    CABasicAnimation *waveAnimationHigh = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationHigh.fromValue = (__bridge id _Nullable)(self.wavePathMid.CGPath);
    waveAnimationHigh.toValue = (__bridge id _Nullable)(self.wavePathHigh.CGPath);
    waveAnimationHigh.beginTime = waveAnimationMid.beginTime + waveAnimationMid.duration;
    waveAnimationHigh.duration = KAnimationDuration;
    //    5
    CABasicAnimation *waveAnimationComplete = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationComplete.fromValue = (__bridge id _Nullable)(self.wavePathHigh.CGPath);
    waveAnimationComplete.toValue = (__bridge id _Nullable)(self.wavePathComplete.CGPath);
    waveAnimationComplete.beginTime = waveAnimationHigh.beginTime + waveAnimationHigh.duration;
    waveAnimationComplete.duration = KAnimationDuration;
    //    6
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
        animationGroup.animations = @[waveAnimationPre, waveAnimationLow, waveAnimationMid, waveAnimationHigh, waveAnimationComplete];
//    animationGroup.animations = @[waveAnimationComplete];
    animationGroup.duration = waveAnimationComplete.beginTime + waveAnimationComplete.duration;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self addAnimation:animationGroup forKey:nil];
}
-(void)setWaveColor:(UIColor *)waveColor{
    _waveColor = waveColor;
    self.fillColor = self.waveColor.CGColor;
}
@end
