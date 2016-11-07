//
//  AIBezierPathViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/7.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  心电图

#import "AIBezierPathViewController.h"
#import "UIView+SetRect.h"
@interface AIBezierPathViewController ()

@end

@implementation AIBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor blackColor];
    
    // Used as background.
    {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame         = CGRectMake(0, 0, 600, 300);
        shapeLayer.path          = [self path].CGPath;
        
        shapeLayer.fillColor   = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth   = 0.5f;
        shapeLayer.opacity     = 0.5f;
        shapeLayer.position    = self.view.middlePoint;
        [shapeLayer setTransform:CATransform3DMakeScale(1, 1, 1.f)];
        
        [self.view.layer addSublayer:shapeLayer];
    }
    // Red line animation.
    {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame         = CGRectMake(0, 0, 600, 300);
        shapeLayer.path          = [self path].CGPath;
        shapeLayer.strokeEnd     = 0.f;
        
        shapeLayer.fillColor     = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor   = [UIColor redColor].CGColor;
        shapeLayer.lineWidth     = 2.f;
        shapeLayer.position      = self.view.middlePoint;
        shapeLayer.shadowColor   = [UIColor redColor].CGColor;
        shapeLayer.shadowOpacity = 1.f;
        shapeLayer.shadowRadius  = 4.f;
        shapeLayer.lineCap       = kCALineCapRound;
        [shapeLayer setTransform:CATransform3DMakeScale(1, 1, 1.f)];
        [self.view.layer addSublayer:shapeLayer];
        
        CGFloat MAX = 0.98f;
        CGFloat GAP = 0.02;
        
        CABasicAnimation *aniStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        aniStart.fromValue         = [NSNumber numberWithFloat:0.f];
        aniStart.toValue           = [NSNumber numberWithFloat:MAX];
        
        CABasicAnimation *aniEnd   = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        aniEnd.fromValue           = [NSNumber numberWithFloat:0.f + GAP];
        aniEnd.toValue             = [NSNumber numberWithFloat:MAX + GAP];
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.duration          = 4.f;
        group.repeatCount       = CGFLOAT_MAX;
        group.autoreverses      = YES;
        group.animations        = @[aniStart];
        
        [shapeLayer addAnimation:group forKey:nil];
    }
}
- (UIBezierPath *)path {
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint   : CGPointMake(0, 150)];
    [bezierPath addLineToPoint: CGPointMake(68, 150)];
    [bezierPath addLineToPoint: CGPointMake(83, 107)];
    [bezierPath addLineToPoint: CGPointMake(96, 206)];
    [bezierPath addLineToPoint: CGPointMake(102, 150)];
    [bezierPath addLineToPoint: CGPointMake(116, 150)];
    [bezierPath addLineToPoint: CGPointMake(127, 82)];
    [bezierPath addLineToPoint: CGPointMake(143, 213)];
    [bezierPath addLineToPoint: CGPointMake(160, 150)];
    [bezierPath addLineToPoint: CGPointMake(179, 150)];
    [bezierPath addLineToPoint: CGPointMake(183, 135)];
    [bezierPath addLineToPoint: CGPointMake(192, 169)];
    [bezierPath addLineToPoint: CGPointMake(199, 150)];
    [bezierPath addLineToPoint: CGPointMake(210, 177)];
    [bezierPath addLineToPoint: CGPointMake(227, 70)];
    [bezierPath addLineToPoint: CGPointMake(230, 210)];
    [bezierPath addLineToPoint: CGPointMake(249, 135)];
    [bezierPath addLineToPoint: CGPointMake(257, 150)];
    [bezierPath addLineToPoint: CGPointMake(360, 150)];
    [bezierPath addLineToPoint: CGPointMake(372, 124)];
    [bezierPath addLineToPoint: CGPointMake(395, 197)];
    [bezierPath addLineToPoint: CGPointMake(408, 82)];
    [bezierPath addLineToPoint: CGPointMake(416, 150)];
    [bezierPath addLineToPoint: CGPointMake(424, 135)];
    [bezierPath addLineToPoint: CGPointMake(448, 224)];
    [bezierPath addLineToPoint: CGPointMake(456, 107)];
    [bezierPath addLineToPoint: CGPointMake(463, 150)];
    [bezierPath addLineToPoint: CGPointMake(600, 150)];
    
    return bezierPath;
}


@end
