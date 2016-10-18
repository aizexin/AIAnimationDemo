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
@property (strong, nonatomic) UIBezierPath *circleVerticalSquishPath;
@property (strong, nonatomic) UIBezierPath *circleHorizontalSquishPath;

@end
#pragma mark Cache

static UIColor* _color = nil;
static const NSTimeInterval KAnimationDuration = 0.3;
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
-(UIBezierPath *)circleSmallPath{
    if (!_circleSmallPath) {
        _circleSmallPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(50, 50, 20, 20)];
    }
    return _circleSmallPath;
}
-(UIBezierPath *)circleBigPath{
    if (!_circleBigPath) {
        _circleBigPath   = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 2.5, 95, 95)];
    }
    return _circleBigPath;
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

@end
