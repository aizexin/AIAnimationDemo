//
//  AIRWLogoLayer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/28.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIRWLogoLayer.h"

@implementation AIRWLogoLayer

- (CAShapeLayer*)logoLayer {
    CAShapeLayer *layer     = [CAShapeLayer layer];
    layer.geometryFlipped = YES;
    //the RW bezier
    UIBezierPath *bezier    = [UIBezierPath bezierPath];
    [bezier moveToPoint:CGPointMake(0, 0)];
    [bezier addCurveToPoint:CGPointMake(0., 66.97) controlPoint1:CGPointMake(0., 0.) controlPoint2:CGPointMake(0., 57.06)];
    [bezier addCurveToPoint:CGPointMake(16.0, 39.0) controlPoint1:CGPointMake(27.68, 66.97) controlPoint2:CGPointMake(42.35, 52.75)];
    [bezier addCurveToPoint:CGPointMake(26.0, 17.0) controlPoint1:CGPointMake(17.35, 35.41) controlPoint2:CGPointMake(26, 17)];
    [bezier addLineToPoint:CGPointMake(38.0, 34.0)];
    [bezier addLineToPoint:CGPointMake(49.0, 17.0)];
    [bezier addLineToPoint:CGPointMake(67.0, 51.27)];
    [bezier addLineToPoint:CGPointMake(67.0, 0.)];
    [bezier addLineToPoint:CGPointMake(0., 0.)];
    [bezier closePath];
    
    //create a shape layer
    layer.path              = bezier.CGPath;
    layer.bounds            = CGRectMake(0, 0, 70, 70);//[UIScreen mainScreen].bounds;
    return layer;
}
@end
