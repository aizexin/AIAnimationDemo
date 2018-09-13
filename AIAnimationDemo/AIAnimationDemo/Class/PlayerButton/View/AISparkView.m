//
//  AISparkView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2018/8/17.
//  Copyright © 2018年 艾泽鑫. All rights reserved.
//

#import "AISparkView.h"

@interface AISparkView() <CAAnimationDelegate>
@property(nonatomic, strong)CAShapeLayer *progressLayer;
@property(nonatomic, strong)CAEmitterLayer *emitter;
@property(nonatomic, strong)CAEmitterCell *cell;
/** 半径*/
@property(nonatomic,assign)CGFloat radius;
@end

@implementation AISparkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.lineWidth = 4;
        self.progressLayer.strokeColor = [UIColor blackColor].CGColor;
        self.progressLayer.fillColor   = [UIColor clearColor].CGColor;
        [self.layer addSublayer:self.progressLayer];
        
        self.emitter        = [CAEmitterLayer layer];
        self.emitter.emitterSize = CGSizeMake(4, 4);
        self.emitter.frame  = CGRectMake(0, 0, 4, 4);
//        self.emitter.preservesDepth = YES;
        
        self.cell           = [[CAEmitterCell alloc]init];
        _cell.contents      = (__bridge id _Nullable)([UIImage imageNamed:@"flake.png"].CGImage);
        _cell.birthRate     = 60;
        _cell.scale         = 0.15;
        _cell.lifetime      = .5;
        _cell.color         = [UIColor blackColor].CGColor;
        _cell.alphaSpeed    = -0.3;
        _cell.velocity      = -35;
        _cell.velocityRange = -15;
        _cell.xAcceleration = -M_PI;
        _cell.emissionRange = 4.0 / (2*M_PI);
        
        _emitter.emitterCells = @[_cell];
        
        [self.layer addSublayer:_emitter];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.progressLayer.path  = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ai_middleX, self.ai_middleY) radius:self.ai_width *.5  startAngle:-M_PI_2 endAngle:2 * M_PI -M_PI_2 clockwise:YES].CGPath;
    _emitter.emitterPosition = CGPointMake(_emitter.frame.size.width * 0.5, _emitter.frame.size.height * 0.5);
}

- (void)beginAnimationWithDuration:(CGFloat)duration {
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue         = @0.;
    strokeStartAnimation.toValue           = @1.;
    strokeStartAnimation.duration          = duration;
    strokeStartAnimation.fillMode          = kCAFillModeForwards;
    strokeStartAnimation.removedOnCompletion = NO;
    strokeStartAnimation.delegate          = self;
    [strokeStartAnimation setValue:@"strokeStartAnimation" forKey:@"strokeStartAnimation_key"];
    [self.progressLayer addAnimation:strokeStartAnimation forKey:@"strokeStartAnimation"];
    
    //发射器动画
    CAKeyframeAnimation *emitterAnimation   = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    emitterAnimation.path                   = [UIBezierPath
                                               bezierPathWithArcCenter:CGPointMake(self.ai_middleX, self.ai_middleY)
                                                                radius:self.ai_width *.5
                                                            startAngle:-M_PI_2 + ((32*M_PI)/360.0)
                                                              endAngle:2 * M_PI -M_PI_2
                                                             clockwise:YES].CGPath;
    emitterAnimation.calculationMode        = kCAAnimationPaced;
    //旋转
    CABasicAnimation    *emitterOrientationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    emitterOrientationAnimation.fromValue  = @0.;
    emitterOrientationAnimation.toValue    = @(M_PI *2);
    
    CAAnimationGroup *emitterAnimationGroup = [CAAnimationGroup animation];
    emitterAnimationGroup.duration          = duration;
    emitterAnimationGroup.animations        = @[emitterAnimation,emitterOrientationAnimation];
    emitterAnimationGroup.fillMode          = kCAFillModeForwards;
    [self.emitter addAnimation:emitterAnimationGroup forKey:nil];
}

//MARK: <CAAnimationDelegate>
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *name = [anim valueForKey:@"strokeStartAnimation_key"];
    if ([name isEqualToString:@"strokeStartAnimation"]) {
        self.emitter.hidden  = YES;
    }
}
@end
