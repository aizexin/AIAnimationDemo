//
//  AIRectangleLayer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/21.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  矩形动画

#import "AIRectangleLayer.h"
#import <UIKit/UIKit.h>

@interface AIRectangleLayer ()
@property (strong, nonatomic) UIBezierPath *rectangleFullPath;
@property(nonatomic,assign)NSTimeInterval allAnimationDuration;
@end
static const CGFloat KLineWidth = 5.0;
@implementation AIRectangleLayer


- (instancetype)init {
    if (self == [super init]) {
        self.fillColor        = [UIColor clearColor].CGColor;
        self.lineWidth        = KLineWidth;
        self.path             = self.rectangleFullPath.CGPath;
        _allAnimationDuration = 0.4;
    }
    return self;
}

- (UIBezierPath *)rectangleFullPath {
    if (!_rectangleFullPath) {
        _rectangleFullPath = [[UIBezierPath alloc] init];
        [_rectangleFullPath moveToPoint:CGPointMake(0.0, 100.0)];
        [_rectangleFullPath addLineToPoint:CGPointMake(0.0, -KLineWidth)];
        [_rectangleFullPath addLineToPoint:CGPointMake(100.0, -KLineWidth)];
        [_rectangleFullPath addLineToPoint:CGPointMake(100.0, 100.0)];
        [_rectangleFullPath addLineToPoint:CGPointMake(-KLineWidth / 2, 100.0)];
        [_rectangleFullPath closePath];
    }
    return _rectangleFullPath;
}
- (void)strokeChangeWithColor:(UIColor *)color {
    self.strokeColor = color.CGColor;
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.fromValue = @0.0;
    strokeAnimation.toValue = @1.0;
    strokeAnimation.duration = self.allAnimationDuration;
    [self addAnimation:strokeAnimation forKey:nil];
}
@end
