//
//  AIDownloadWaveLayer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/5/9.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//
//正弦函数: y =Asin（ωx+φ）+C
//A 表示振幅，也就是使用这个变量来调整波浪的高度
//ω表示周期，也就是使用这个变量来调整在屏幕内显示的波浪的数量
//φ表示波浪横向的偏移，也就是使用这个变量来调整波浪的流动
//C表示波浪纵向的位置，也就是使用这个变量来调整波浪在屏幕中竖直的位置。



#import "AIDownloadWaveLayer.h"
#import "CALayer+SetRect.h"
@interface AIDownloadWaveLayer ()<CAAnimationDelegate>
@property (strong, nonatomic) UIBezierPath *wavePathStarting;
@property (strong, nonatomic) UIBezierPath *wavePath1;
@property (strong, nonatomic) UIBezierPath *wavePath2;
@property (strong, nonatomic) UIBezierPath *wavePath3;
@property (strong, nonatomic) UIBezierPath *wavePath4;
@property (strong, nonatomic) UIBezierPath *wavePathComplete;
@property(nonatomic,assign)NSTimeInterval allAnimationDuration;
/** 振幅*/
@property(nonatomic,assign)CGFloat amplitude_A;
/** 周期*/
@property(nonatomic,assign)CGFloat cycle_ω;
/** 偏移量*/
@property(nonatomic,assign)CGFloat offset_φ;

@end
@implementation AIDownloadWaveLayer

static const NSTimeInterval KAnimationDuration = 0.3;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor clearColor].CGColor;
        self.lineCap   = kCALineCapRound;
        self.lineJoin  = kCALineJoinRound;
        _amplitude_A   = 3.;
        _cycle_ω       = .3;
    }
    return self;
}

-(void)setOnView:(UIView *)onView {
    _onView    = onView;
    CGFloat y;
    _wavePathStarting = [UIBezierPath bezierPath];
    [_wavePathStarting moveToPoint:CGPointMake(onView.ai_middleX *.5, onView.ai_middleY)];
    for (float x = 0.0f; x<onView.ai_width *.5; x++) {
        y        = self.amplitude_A * sin(_cycle_ω*x);
        [_wavePathStarting addLineToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
    }
    self.path = self.wavePathStarting.CGPath;
    
    _wavePath1 = [UIBezierPath bezierPath];
    for (float x = 0.0f; x<onView.ai_width *.5; x++) {
        y        = self.amplitude_A * sin(_cycle_ω*x + M_PI_2*1);
        if (x == 0) {
            [_wavePath1 moveToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
        }else {
            [_wavePath1 addLineToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
        }
    }
    
    _wavePath2 = [UIBezierPath bezierPath];
    for (float x = 0.0f; x<onView.ai_width *.5; x++) {
        y        = self.amplitude_A * sin(_cycle_ω*x + M_PI_2*2);
        if (x == 0) {
            [_wavePath2 moveToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
        }else {
        [_wavePath2 addLineToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
        }
    }
    _wavePath3 = [UIBezierPath bezierPath];
    for (float x = 0.0f; x<onView.ai_width *.5; x++) {
        y        = self.amplitude_A * sin(_cycle_ω*x + M_PI_2*3);
        if (x == 0) {
            [_wavePath3 moveToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
        }else {
        [_wavePath3 addLineToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
        }
    }
    
    _wavePath4 = [UIBezierPath bezierPath];
    
    for (float x = 0.0f; x<onView.ai_width *.5; x++) {
        y        = self.amplitude_A * sin(_cycle_ω*x + M_PI_2*4);
        if (x == 0) {
            [_wavePath4 moveToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
        }else {
        [_wavePath4 addLineToPoint:CGPointMake(x + onView.ai_middleX *.5, y+onView.ai_middleY )];
        }
    }
    _wavePathComplete = [UIBezierPath bezierPath];
    [_wavePathComplete moveToPoint:CGPointMake(onView.ai_middleX *.7, onView.ai_middleY)];
    [_wavePathComplete addLineToPoint:CGPointMake(onView.ai_middleX*.9, onView.ai_middleY *1.25)];
    [_wavePathComplete addLineToPoint:CGPointMake(onView.ai_middleX *1.3, onView.ai_height *0.35)];
    
}



- (void)waveAnimate {
    [self waveAnimateWithLayer:self];
}
- (void)waveAnimateWithLayer:(CALayer*)layer {
    //    1
    CABasicAnimation *waveAnimationStart = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationStart.fromValue = (__bridge id _Nullable)(self.wavePathStarting.CGPath);
    waveAnimationStart.toValue = (__bridge id _Nullable)(self.wavePath1.CGPath);
    waveAnimationStart.beginTime = 0.0;
    waveAnimationStart.duration = KAnimationDuration;
    //    2
    CABasicAnimation *waveAnimation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimation1.fromValue = (__bridge id _Nullable)(self.wavePath1.CGPath);
    waveAnimation1.toValue = (__bridge id _Nullable)(self.wavePath2.CGPath);
    waveAnimation1.beginTime = waveAnimationStart.beginTime + waveAnimationStart.duration;
    waveAnimation1.duration = KAnimationDuration;
    //    3
    CABasicAnimation *waveAnimation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimation2.fromValue = (__bridge id _Nullable)(self.wavePath2.CGPath);
    waveAnimation2.toValue = (__bridge id _Nullable)(self.wavePath3.CGPath);
    waveAnimation2.duration = KAnimationDuration;
    waveAnimation2.beginTime = waveAnimation1.beginTime + waveAnimation1.duration;
    //    4
    CABasicAnimation *waveAnimationLow = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationLow.fromValue = (__bridge id _Nullable)(self.wavePath3.CGPath);
    waveAnimationLow.toValue = (__bridge id _Nullable)(self.wavePath4.CGPath);
    waveAnimationLow.duration = KAnimationDuration;
    waveAnimationLow.beginTime = waveAnimation2.beginTime + waveAnimation2.duration;
    //    5
    CABasicAnimation *waveAnimationCompelted = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationCompelted.fromValue = (__bridge id _Nullable)(self.wavePath4.CGPath);
    waveAnimationCompelted.toValue = (__bridge id _Nullable)(self.wavePathStarting.CGPath);
    waveAnimationCompelted.duration = KAnimationDuration;
    waveAnimationCompelted.beginTime = waveAnimationLow.beginTime + waveAnimationLow.duration;
    //    6
    CAAnimationGroup *animationGroup      = [[CAAnimationGroup alloc] init];
    animationGroup.delegate               = self;
    [animationGroup setValue:@"group" forKey:@"name"];
    animationGroup.animations             = \
  @[waveAnimationStart,waveAnimation1,waveAnimation2,waveAnimationLow];
    animationGroup.duration               = waveAnimationLow.beginTime + waveAnimationLow.duration;
    animationGroup.fillMode               = kCAFillModeForwards;
    animationGroup.removedOnCompletion    = NO;
    [layer addAnimation:animationGroup forKey:nil];
    
    self.allAnimationDuration             = animationGroup.duration;
    
}

-(void)setWaveColor:(UIColor *)waveColor{
    _waveColor = waveColor;
    self.strokeColor = self.waveColor.CGColor;
}

#pragma mark -CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *name  = [anim valueForKey:@"name"];
    if ([name isEqualToString:@"group"] ) {
        if (self.isStop) {
            CABasicAnimation *waveAnimationCompelted = [CABasicAnimation animationWithKeyPath:@"path"];
            waveAnimationCompelted.fromValue = (__bridge id _Nullable)(self.wavePathStarting.CGPath);
            waveAnimationCompelted.toValue = (__bridge id _Nullable)(self.wavePathComplete.CGPath);
            waveAnimationCompelted.duration = KAnimationDuration;
            waveAnimationCompelted.fillMode = kCAFillModeForwards;
            waveAnimationCompelted.removedOnCompletion = NO;
            [self addAnimation:waveAnimationCompelted forKey:nil];
        }else {
            [self waveAnimateWithLayer:self];
        }
    }
}

@end
