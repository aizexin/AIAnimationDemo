//
//  AICircleLayer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/18.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AICircleLayer.h"

@interface AICircleLayer ()
@property (strong, nonatomic) UIBezierPath *circleSmallPath;
@property (strong, nonatomic) UIBezierPath *circleBigPath;
/** 横向挤扁*/
@property (strong, nonatomic) UIBezierPath *circleVerticalSquishPath;
/** 纵向挤扁*/
@property (strong, nonatomic) UIBezierPath *circleHorizontalSquishPath;

@end
#pragma mark Cache

static UIColor* _color = nil;
static const NSTimeInterval KAnimationDuration = 0.5;
@implementation AICircleLayer

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
        
        self.path      = self.circleSmallPath.CGPath;
        //// Color Declarations
        CGFloat colorHSBA[4];
        [_color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];
        UIColor* color3 = [UIColor colorWithHue: colorHSBA[0] saturation: 1 brightness: colorHSBA[2] alpha: colorHSBA[3]];
        //        [color3 setFill];
        [self setFillColor:color3.CGColor];
        
    }
    return self;
}

#pragma mark --lazy
- (UIBezierPath *)circleSmallPath {
    if (!_circleSmallPath) {
        _circleSmallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50.0, 50.0, 0.0, 0.0)];
    }
    return _circleSmallPath;
}
- (UIBezierPath *)circleBigPath {
    if (!_circleBigPath) {
        _circleBigPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 17.5, 95.0, 95.0)];
    }
    return _circleBigPath;
}
- (UIBezierPath *)circleVerticalSquishPath {
    if (!_circleVerticalSquishPath) {
        _circleVerticalSquishPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 20.0, 95.0, 90.0)];
    }
    return _circleVerticalSquishPath;
}
- (UIBezierPath *)circleHorizontalSquishPath {
    if (!_circleHorizontalSquishPath) {
        _circleHorizontalSquishPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5.0, 20.0, 90.0, 90.0)];
    }
    return _circleHorizontalSquishPath;
}
//-(UIBezierPath *)circleSmallPath{
//    if (!_circleSmallPath) {
//        _circleSmallPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(50, 50, 20, 20)];
//    }
//    return _circleSmallPath;
//}
//-(UIBezierPath *)circleBigPath{
//    if (!_circleBigPath) {
//        _circleBigPath   = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 2.5, 95, 95)];
//    }
//    return _circleBigPath;
//}
//- (UIBezierPath *)circleVerticalSquishPath {
//    if (!_circleVerticalSquishPath) {
//        _circleVerticalSquishPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 5.0, 95.0, 90.0)];
//    }
//    return _circleVerticalSquishPath;
//}
//- (UIBezierPath *)circleHorizontalSquishPath {
//    if (!_circleHorizontalSquishPath) {
//        _circleHorizontalSquishPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5.0, 5.0, 90.0, 90.0)];
//    }
//    return _circleHorizontalSquishPath;
//}

#pragma mark  ----public
- (void)wobbleAnimation {
    //    1
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation1.fromValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    animation1.toValue = (__bridge id _Nullable)(self.circleVerticalSquishPath.CGPath);
    animation1.beginTime = 0;
    animation1.duration = KAnimationDuration;
    //    2
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation2.fromValue = (__bridge id _Nullable)(self.circleVerticalSquishPath.CGPath);
    animation2.toValue = (__bridge id _Nullable)(self.circleHorizontalSquishPath.CGPath);
    animation2.beginTime = animation1.beginTime + animation1.duration;
    animation2.duration = KAnimationDuration;
    //    3
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation3.fromValue = (__bridge id _Nullable)(self.circleHorizontalSquishPath.CGPath);
    animation3.toValue = (__bridge id _Nullable)(self.circleVerticalSquishPath.CGPath);
    animation3.beginTime = animation2.beginTime + animation2.duration;
    animation3.duration = KAnimationDuration;
    //    4
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation4.fromValue = (__bridge id _Nullable)(self.circleVerticalSquishPath.CGPath);
    animation4.toValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    animation4.beginTime = animation3.beginTime + animation3.duration;
    animation4.duration = KAnimationDuration;
    //    5
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[animation1, animation2, animation3, animation4];
    animationGroup.duration = 4 * KAnimationDuration;
    animationGroup.repeatCount = 2;
    [self addAnimation:animationGroup forKey:nil];
    
}


-(void)changeBig{
  
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.circleSmallPath.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    expandAnimation.duration = KAnimationDuration;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    [self addAnimation:expandAnimation forKey:nil];
    
}
- (void)changeSmall{
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.circleSmallPath.CGPath);
    expandAnimation.duration = KAnimationDuration;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    [self addAnimation:expandAnimation forKey:nil];
}

-(NSTimeInterval)allAnimationDuration{
    return 9 * KAnimationDuration;
}



@end
