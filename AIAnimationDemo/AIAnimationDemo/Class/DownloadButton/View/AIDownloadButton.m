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
#import "GCD.h"
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
/** 文件大小*/
@property(nonatomic,weak)UILabel *progressLabel;

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
    UILabel *progressLabel              = [[UILabel alloc]init];
    progressLabel.textAlignment         = NSTextAlignmentCenter;
    progressLabel.textColor             = [UIColor flatWhiteColor];
    progressLabel.font                  = [UIFont systemFontOfSize:13];
    progressLabel.alpha                 = 0.;
    progressLabel.text                  = @"23131MB";
    self.progressLabel                  = progressLabel;
    [self addSubview:progressLabel];
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
    self.progressShapeLayer.strokeStart = 1;
    self.progressShapeLayer.lineWidth   = 6.;
    self.progressShapeLayer.lineCap     = kCALineCapRound;
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
    
    [self.progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-self.ai_height *.25);
    }];
    UIBezierPath    *circlePath   = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ai_middleX, self.ai_middleY) radius:self.ai_width *.5  startAngle:-M_PI_2 endAngle:2 * M_PI -M_PI_2 clockwise:YES];
    self.progressShapeLayer.path            = circlePath.CGPath;

}
#pragma mark -Action    
- (void)onTap:(UITapGestureRecognizer*)tap {
    if (self.isSelected) {
        return;
    }
    self.selected                        = YES;
    
    //变为点
    UIBezierPath         *pointPath      = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ai_middleX, self.ai_middleY + 1) radius:.5 startAngle:0 endAngle:2*M_PI clockwise:NO];
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
    pointSpringAnimation.toValue                = @(-self.ai_height*.5 - self.bgCircleShapeLayer.lineWidth + self.pointShapeLayer.lineWidth );
    pointSpringAnimation.duration               = pointSpringAnimation.settlingDuration;
    pointSpringAnimation.fillMode               = kCAFillModeForwards;
    pointSpringAnimation.removedOnCompletion    = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(changeToPoint.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.pointShapeLayer addAnimation:pointSpringAnimation forKey:nil];
    });
    
}

/**
 恢复原样
 */
-(void)resume {
    [self.pointShapeLayer removeAllAnimations];
    [self scaleAnimationWithLayer:self.progressLabel.layer fromValue:1. toValue:.1];
    [self opacityAnimationWithLayer:self.progressLabel.layer fromValue:1. toValue:0];
    self.progressShapeLayer.strokeStart     = 1;
    self.progress                           = 0.;
    self.pointShapeLayer.opacity            = 1.;
    self.selected                           = NO;
    //进度消失
    POPBasicAnimation   *progressAnimation  = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerLineWidth];
    progressAnimation.toValue               = @0.;
    progressAnimation.duration              = .3;
    [self.progressShapeLayer pop_addAnimation:progressAnimation forKey:nil];
    //点变成竖线
    UIBezierPath    *pointPath      = [UIBezierPath bezierPath];
    [pointPath moveToPoint: CGPointMake(self.ai_middleX, self.ai_height *0.25)];
    [pointPath addLineToPoint: CGPointMake(self.ai_middleX, self.ai_height *0.75 - self.arrowShapeLayer.lineWidth)];
    CABasicAnimation    *pointToLineAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pointToLineAnimation.toValue              = (__bridge id _Nullable)(pointPath.CGPath);
    pointToLineAnimation.duration             = .3;
    pointToLineAnimation.removedOnCompletion  = NO;
    pointToLineAnimation.fillMode             = kCAFillModeForwards;
    [self.pointShapeLayer addAnimation:pointToLineAnimation forKey:nil];
    
    [self.waveLayer removeFromSuperlayer];
    //箭头
    self.arrowShapeLayer.opacity    = 1.;
    UIBezierPath    *arrowPath      = [UIBezierPath bezierPath];
    [arrowPath moveToPoint: CGPointMake(self.ai_middleX * .75, self.ai_height *(0.25 + .5 * 0.6))];
    [arrowPath addLineToPoint: CGPointMake(self.ai_middleX, self.ai_height *0.75)];
    [arrowPath addLineToPoint: CGPointMake(self.ai_middleX * 1.25, self.ai_height *(0.25 + .5 * 0.6))];
    CABasicAnimation    *arrowAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    arrowAnimation.toValue              = (__bridge id _Nullable)(arrowPath.CGPath);
    arrowAnimation.duration             = .3;
    arrowAnimation.removedOnCompletion  = NO;
    arrowAnimation.fillMode             = kCAFillModeForwards;
    [self.arrowShapeLayer addAnimation:arrowAnimation forKey:nil];
    
}
#pragma mark -CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *name = [anim valueForKey:@"name"];
    if ([name isEqualToString:@"pointLayer"]) { //完成点的动画
        [self.layer addSublayer:self.progressShapeLayer];

        if (self.block) {
            self.block();
        }
//        CABasicAnimation *progressAnimation     = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
//        progressAnimation.delegate              = self;
//        [progressAnimation setValue:@"progress" forKey:@"name"];
//        progressAnimation.fromValue             = @1;
//        progressAnimation.toValue               = @0.;
//        progressAnimation.duration              = 1.;
//        [self.progressShapeLayer addAnimation:progressAnimation forKey:nil];
        
        [self opacityAnimationWithLayer:self.pointShapeLayer fromValue:1. toValue:0.];
        [self opacityAnimationWithLayer:self.arrowShapeLayer fromValue:1. toValue:0.];
        self.progressShapeLayer.lineWidth       = 6.;
        
//        self.arrowShapeLayer.opacity            = 0;
        
        self.waveLayer                          = [[AIDownloadWaveLayer alloc]init];
        self.waveLayer.onView                   = self;
        self.waveLayer.lineWidth                = 3.;
        self.waveLayer.waveColor                = [UIColor flatWhiteColor];
        [self.layer addSublayer:self.waveLayer];
        [self.waveLayer waveAnimate];
        //文件大小
      
        [self scaleAnimationWithLayer:self.progressLabel.layer fromValue:.1 toValue:1.];
        
        [self opacityAnimationWithLayer:self.progressLabel.layer fromValue:0. toValue:1.];
    }

}

/**
 缩放动画

 @param layer 所要缩放的layer
 @param from 从多少比例开始
 @param to 到多少比例
 */
- (void)scaleAnimationWithLayer:(CALayer*)layer fromValue:(CGFloat)from toValue:(CGFloat)to {
    //文件大小
    POPBasicAnimation   *scaleAnimation          = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.fromValue                     = [NSValue valueWithCGPoint:CGPointMake(from, from)];
    scaleAnimation.toValue                       = [NSValue valueWithCGPoint:CGPointMake(to, to)];
    scaleAnimation.duration                      = .3;
    [layer pop_addAnimation:scaleAnimation forKey:nil];
}

/**
 不透明度动画

 @param layer 要执行动画的layer
 @param from 从多少开始
 @param to 到多少
 */
- (void)opacityAnimationWithLayer:(CALayer*)layer fromValue:(CGFloat)from toValue:(CGFloat)to {
    POPBasicAnimation *opacityAnimation          = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue                     = @(to);
    opacityAnimation.fromValue                   = @(from);
    opacityAnimation.duration                    = .3;
    [layer pop_addAnimation:opacityAnimation forKey:nil];
}

#pragma mark -public
-(void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.progressShapeLayer.strokeStart   = 1-progress;
    if (progress >= 1) {
        self.waveLayer.stop = YES;
        [self scaleAnimationWithLayer:self.progressLabel.layer fromValue:1. toValue:.1];
        
        [self opacityAnimationWithLayer:self.progressLabel.layer fromValue:1. toValue:0.];
    } else {
    }
}
-(void)setText:(NSString *)text {
    _text     = text;
    self.progressLabel.text = text;
}

@end
