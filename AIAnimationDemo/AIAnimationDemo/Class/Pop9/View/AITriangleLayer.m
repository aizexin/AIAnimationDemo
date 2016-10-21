//
//  AITriangleLayer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/19.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  三角形

#import "AITriangleLayer.h"
#import <UIKit/UIKit.h>

@interface AITriangleLayer ()
@property (strong, nonatomic) UIBezierPath *smallTrianglePath;
@property (strong, nonatomic) UIBezierPath *leftTrianglePath;
@property (strong, nonatomic) UIBezierPath *rightTrianglePath;
@property (strong, nonatomic) UIBezierPath *topTrianglePath;
/** 所有动画时间*/
@property (assign,nonatomic)NSTimeInterval allInterval;
@end

static UIColor* _color = nil;
static const CGFloat paddingSpace = 30.0;
@implementation AITriangleLayer


#pragma mark Initialization

+ (void)initialize{
    
    // Colors Initialization
    _color = [UIColor colorWithRed: 0.793 green: 0.2 blue: 0.757 alpha: 1];
    CGFloat colorHSBA[4];
    [_color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineCap = kCALineCapRound;
        self.lineJoin = kCALineJoinRound;
        self.lineWidth = 7.0;
        self.path       = self.smallTrianglePath.CGPath;
        // Color Declarations
        CGFloat colorHSBA[4];
        [_color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];
        UIColor* color3 = [UIColor colorWithHue: colorHSBA[0] saturation: 1 brightness: colorHSBA[2] alpha: colorHSBA[3]];
        //        [color3 setFill];
        [self setFillColor:color3.CGColor];
        self.strokeColor = color3.CGColor;
        
    }
    return self;
}

- (UIBezierPath *)smallTrianglePath {
    if (!_smallTrianglePath) {
        _smallTrianglePath = [[UIBezierPath alloc] init];
        [_smallTrianglePath moveToPoint:CGPointMake(5.0 + paddingSpace, 95.0)];
        [_smallTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
        [_smallTrianglePath addLineToPoint:CGPointMake(95.0 - paddingSpace, 95.0)];
        [_smallTrianglePath closePath];
    }
    return _smallTrianglePath;
}

- (UIBezierPath *)leftTrianglePath {
    if (!_leftTrianglePath) {
        _leftTrianglePath = [[UIBezierPath alloc] init];
        [_leftTrianglePath moveToPoint:CGPointMake(5.0, 95.0)];
        [_leftTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
        [_leftTrianglePath addLineToPoint:CGPointMake(95.0 - paddingSpace, 95.0)];
        [_leftTrianglePath closePath];
    }
    return _leftTrianglePath;
}

- (UIBezierPath *)rightTrianglePath {
    if (!_rightTrianglePath) {
        _rightTrianglePath = [[UIBezierPath alloc] init];
        [_rightTrianglePath moveToPoint:CGPointMake(5.0, 95.0)];
        [_rightTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
        [_rightTrianglePath addLineToPoint:CGPointMake(95.0, 95.0)];
        [_rightTrianglePath closePath];
    }
    return _rightTrianglePath;
}

- (UIBezierPath *)topTrianglePath {
    if (!_topTrianglePath) {
        _topTrianglePath = [[UIBezierPath alloc] init];
        [_topTrianglePath moveToPoint:CGPointMake(5.0, 95.0)];
        [_topTrianglePath addLineToPoint:CGPointMake(50.0, 12.5)];
        [_topTrianglePath addLineToPoint:CGPointMake(95.0, 95.0)];
        [_topTrianglePath closePath];
    }
    return _topTrianglePath;
}

-(void)triangleAnimate {
    //left
    CABasicAnimation *leftAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    leftAnimation.fromValue         = (__bridge id _Nullable)(self.smallTrianglePath.CGPath);
    leftAnimation.toValue           = (__bridge id _Nullable)(self.leftTrianglePath.CGPath);
    leftAnimation.beginTime         = 0.;
    leftAnimation.duration          = 0.3;
    //right
    CABasicAnimation *rightAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    rightAnimation.fromValue         = (__bridge id _Nullable)(self.leftTrianglePath.CGPath);
    rightAnimation.toValue           = (__bridge id _Nullable)(self.rightTrianglePath.CGPath);
    rightAnimation.beginTime         = leftAnimation.beginTime + leftAnimation.duration;
    rightAnimation.duration          = 0.3;
    //top
    CABasicAnimation *topAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    topAnimation.fromValue         = (__bridge id _Nullable)(self.rightTrianglePath.CGPath);
    topAnimation.toValue           = (__bridge id _Nullable)(self.topTrianglePath.CGPath);
    topAnimation.beginTime         = rightAnimation.beginTime + rightAnimation.duration;
    topAnimation.duration          = .3;
    //组合动画
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc]init];
    animationGroup.animations        = @[leftAnimation,rightAnimation, topAnimation];
    animationGroup.duration          = topAnimation.beginTime + topAnimation.duration;
    animationGroup.fillMode          = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self addAnimation:animationGroup forKey:nil];
    
    self.allInterval = animationGroup.duration;
}

@end








