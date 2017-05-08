//
//  AIDownloadButton.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/5/8.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDownloadButton.h"
#import "CALayer+SetRect.h"
@interface AIDownloadButton ()

/**
 背景圆
 */
@property(nonatomic,strong)CAShapeLayer *bgCircleShapeLayer;
/** 竖线*/
@property(nonatomic,strong)CAShapeLayer *pointShapeLayer;
/** 箭头*/
@property(nonatomic,strong)CAShapeLayer *arrowShapeLayer;
@end
@implementation AIDownloadButton

-(void)awakeFromNib {
    [super awakeFromNib];
    [self initUI];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI {
    //背景
    self.bgCircleShapeLayer = [CAShapeLayer layer];
    self.bgCircleShapeLayer.lineWidth   = 6.;
    self.bgCircleShapeLayer.strokeColor = [UIColor flatWhiteColorDark].CGColor;
    self.bgCircleShapeLayer.opacity     = .2;
    self.bgCircleShapeLayer.fillColor   = [UIColor flatSkyBlueColor].CGColor;
    [self.layer addSublayer:self.bgCircleShapeLayer];
    //点
    self.pointShapeLayer    = [CAShapeLayer layer];
    self.pointShapeLayer.lineWidth      = 4.;
    self.pointShapeLayer.lineCap        = kCALineCapRound;
    self.pointShapeLayer.strokeColor    = [UIColor flatWhiteColor].CGColor;
    [self.layer addSublayer:self.pointShapeLayer];
    
    //箭头
    self.arrowShapeLayer    = [CAShapeLayer layer];
    self.arrowShapeLayer.lineWidth      = 3.;
    self.arrowShapeLayer.lineCap        = kCALineCapRound;
    self.arrowShapeLayer.strokeColor    = [UIColor flatWhiteColor].CGColor;
    self.arrowShapeLayer.fillColor      = [UIColor flatWhiteColor].CGColor;
    self.arrowShapeLayer.fillColor      = [UIColor clearColor].CGColor;
    [self.layer addSublayer:self.arrowShapeLayer];
    
    UITapGestureRecognizer *tap         = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
    [self addGestureRecognizer:tap];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath    *bgCirclePath   = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.bgCircleShapeLayer.path    = bgCirclePath.CGPath;
    
    UIBezierPath    *pointPath      = [UIBezierPath bezierPath];
    [pointPath moveToPoint: CGPointMake(self.ai_middleX, self.ai_height *0.25)];
    [pointPath addLineToPoint: CGPointMake(self.ai_middleX, self.ai_height *0.75 - self.arrowShapeLayer.lineWidth)];
    self.pointShapeLayer.path       = pointPath.CGPath;
    
    UIBezierPath    *arrowPath      = [UIBezierPath bezierPath];
    [arrowPath moveToPoint: CGPointMake(self.ai_middleX * .75, self.ai_height *(0.25 + .5 * 0.6))];
    [arrowPath addLineToPoint: CGPointMake(self.ai_middleX, self.ai_height *0.75)];
    [arrowPath addLineToPoint: CGPointMake(self.ai_middleX * 1.25, self.ai_height *(0.25 + .5 * 0.6))];
    self.arrowShapeLayer.path       = arrowPath.CGPath;
    
}
#pragma mark -Action    
- (void)onTap:(UITapGestureRecognizer*)tap {
    //变为点
    UIBezierPath         *pointPath      = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ai_middleX, self.ai_height *0.5) radius:.5 startAngle:0 endAngle:2*M_PI clockwise:NO];
    CABasicAnimation    *changeToPoint   = [CABasicAnimation animationWithKeyPath:@"path"];
    changeToPoint.toValue                = (__bridge id)(pointPath.CGPath);
    changeToPoint.fillMode               = kCAFillModeForwards;
    changeToPoint.removedOnCompletion    = NO;
    changeToPoint.duration               = .2;
    [self.pointShapeLayer addAnimation:changeToPoint forKey:nil];
    //箭头变为线
   
    CABasicAnimation   *lineAniamtion  = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
    lineAniamtion.duration              = .2;
    lineAniamtion.fillMode              = kCAFillModeForwards;
    lineAniamtion.toValue               = @(self.arrowShapeLayer.y +10);
    lineAniamtion.removedOnCompletion   = NO;
    
    
    UIBezierPath         *linePath       = [UIBezierPath bezierPath];
    [linePath moveToPoint: CGPointMake(self.ai_middleX * .5, self.ai_height *(0.25 + .5 * 0.6))];
    [linePath addLineToPoint:CGPointMake(self.ai_middleX, self.ai_height *(0.25 + .5 * 0.6))];
    [linePath addLineToPoint: CGPointMake(self.ai_middleX * 1.5, self.ai_height *(0.25 + .5 * 0.6))];
    CASpringAnimation   *lineSpringAnimation    = [CASpringAnimation animationWithKeyPath:@"path"];
    lineSpringAnimation.toValue                 = (__bridge id _Nullable)(linePath.CGPath);
    lineSpringAnimation.duration                = lineSpringAnimation.settlingDuration;
    lineSpringAnimation.damping                 = 0;
    lineSpringAnimation.mass                    = 30;
    lineSpringAnimation.stiffness               = 5;
    lineSpringAnimation.initialVelocity         = 30;
    lineSpringAnimation.fillMode                = kCAFillModeForwards;
    lineSpringAnimation.beginTime               = .2;
    lineSpringAnimation.removedOnCompletion     = NO;
    
    CAAnimationGroup    *groupAnimation         = [CAAnimationGroup animation];
    groupAnimation.duration                     = 1.5;
    groupAnimation.fillMode                     = kCAFillModeForwards;
    groupAnimation.removedOnCompletion          = NO;
    groupAnimation.animations                   = @[lineAniamtion,lineSpringAnimation];
    [self.arrowShapeLayer addAnimation:groupAnimation forKey:nil];
    
}
@end
