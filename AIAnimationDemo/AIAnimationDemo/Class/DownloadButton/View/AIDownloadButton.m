//
//  AIDownloadButton.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/5/8.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDownloadButton.h"
#import "CALayer+SetRect.h"
#import "AIDownloadWaveLayer.h"
@interface AIDownloadButton ()<CAAnimationDelegate>

/**
 背景圆
 */
@property(nonatomic,strong)CAShapeLayer *bgCircleShapeLayer;
/** 竖线*/
@property(nonatomic,strong)CAShapeLayer *pointShapeLayer;
/** 箭头*/
@property(nonatomic,strong)CAShapeLayer *arrowShapeLayer;
/** 进度*/
@property(nonatomic,strong)CAShapeLayer *progressShapeLayer;
/** 波浪*/
@property(nonatomic,strong)AIDownloadWaveLayer *waveLayer;
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
    //进度
    self.progressShapeLayer             = [CAShapeLayer layer];
    self.progressShapeLayer.lineWidth   = 6.;
    self.progressShapeLayer.strokeColor = [UIColor flatWhiteColor].CGColor;
    self.progressShapeLayer.fillColor   = [UIColor clearColor].CGColor;
    
    //添加手势
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
    UIBezierPath         *pointPath      = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ai_middleX, self.ai_height *(0.25 + .5 * 0.6)) radius:.5 startAngle:0 endAngle:2*M_PI clockwise:NO];
    CABasicAnimation    *changeToPoint   = [CABasicAnimation animationWithKeyPath:@"path"];
    changeToPoint.toValue                = (__bridge id)(pointPath.CGPath);
    changeToPoint.fillMode               = kCAFillModeForwards;
    changeToPoint.removedOnCompletion    = NO;
    changeToPoint.duration               = .2;
    [self.pointShapeLayer addAnimation:changeToPoint forKey:nil];
    //箭头变为线
   
    CABasicAnimation   *lineAniamtion  = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
    lineAniamtion.duration              = .2;
    lineAniamtion.fillMode              = kCAFillModeBackwards;
    lineAniamtion.toValue               = @(self.arrowShapeLayer.y +10);
    lineAniamtion.removedOnCompletion   = NO;
    
    UIBezierPath         *linePath       = [UIBezierPath bezierPath];
    [linePath moveToPoint: CGPointMake(self.ai_middleX * .5, self.ai_height *.5 )];
    [linePath addLineToPoint:CGPointMake(self.ai_middleX, self.ai_height *.5 )];
    [linePath addLineToPoint: CGPointMake(self.ai_middleX * 1.5, self.ai_height *.5 )];
    
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
    groupAnimation.duration                     = 1;
    groupAnimation.fillMode                     = kCAFillModeForwards;
    groupAnimation.removedOnCompletion          = NO;
    groupAnimation.animations                   = @[lineAniamtion,lineSpringAnimation];
    [self.arrowShapeLayer addAnimation:groupAnimation forKey:nil];
    
    //圆点起跳
    CASpringAnimation   *pointSpringAnimation   = [CASpringAnimation animationWithKeyPath:@"position.y"];
    pointSpringAnimation.delegate               = self;
    [pointSpringAnimation setValue:@"pointLayer" forKey:@"name"];
    pointSpringAnimation.toValue                = @(-self.ai_height*.5 - self.bgCircleShapeLayer.lineWidth );
    pointSpringAnimation.duration               = pointSpringAnimation.settlingDuration;
    pointSpringAnimation.fillMode               = kCAFillModeForwards;
    pointSpringAnimation.removedOnCompletion    = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(changeToPoint.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.pointShapeLayer addAnimation:pointSpringAnimation forKey:nil];
    });
    
}
#pragma mark -CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *name = [anim valueForKey:@"name"];
    if ([name isEqualToString:@"pointLayer"]) { //完成点的动画
        UIBezierPath    *circlePath   = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ai_middleX, self.ai_middleY) radius:self.ai_width *.5 - self.progressShapeLayer.lineWidth *0.5 startAngle:-M_PI_2 endAngle:2 * M_PI -M_PI_2 clockwise:YES];
        self.progressShapeLayer.path            = circlePath.CGPath;
        [self.layer addSublayer:self.progressShapeLayer];
        //进度动画
        CABasicAnimation *progressAnimation     = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        progressAnimation.delegate              = self;
        [progressAnimation setValue:@"progress" forKey:@"name"];
        progressAnimation.fromValue             = @1;
        progressAnimation.toValue               = @0.;
        progressAnimation.duration              = 1.;
        [self.progressShapeLayer addAnimation:progressAnimation forKey:nil];
        
        self.arrowShapeLayer.opacity            = 0;
        
        self.waveLayer                          = [[AIDownloadWaveLayer alloc]init];
        self.waveLayer.onView                   = self;
        self.waveLayer.lineWidth                = 2.;
        self.waveLayer.waveColor                = [UIColor flatWhiteColor];
        [self.layer addSublayer:self.waveLayer];
        [self.waveLayer waveAnimate];
    }
    if ([name isEqualToString:@"progress"]) {
        self.waveLayer.stop = YES;
    }
}
@end
