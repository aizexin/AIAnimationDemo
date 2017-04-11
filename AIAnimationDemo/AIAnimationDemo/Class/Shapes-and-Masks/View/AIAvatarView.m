//
//  AIAvatarView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/14.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIAvatarView.h"

@interface AIAvatarView ()

@property(nonatomic,strong)CALayer *photoLayer;
/** 圆*/
@property(nonatomic,weak)CAShapeLayer *circleLayer;
/** 遮罩*/
@property(nonatomic,strong)CAShapeLayer *maskLayer;
/** label*/
@property(nonatomic,weak)UILabel *label;

@end

const CGFloat lineWidth = 6.0;
const CGFloat animationDuration = 1.;
@implementation AIAvatarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.shouldTransitionToFinishedState = NO;
        //图片
        self.photoLayer             = [[CALayer alloc]init];
        //遮罩
        CAShapeLayer *maskLayer     = [[CAShapeLayer alloc]init];
        self.maskLayer              = maskLayer;
        //圆
        CAShapeLayer *circleLayer   = [[CAShapeLayer alloc]init];
        self.circleLayer            = circleLayer;
        circleLayer.fillColor       = [UIColor clearColor].CGColor;
        circleLayer.strokeColor     = [UIColor whiteColor].CGColor;
        circleLayer.lineWidth       = lineWidth;
        //label
        UILabel *label   = [[UILabel alloc]init];
        label.font       = [UIFont fontWithName:@"ArialRoundedMTBold" size:18];
        label.textAlignment  = NSTextAlignmentCenter;
        label.textColor  = [UIColor blackColor];
        self.label       = label;
        [self addSubview:label];
        
        self.image = [UIImage imageNamed:@"empty"];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.photoLayer.frame     = CGRectMake((self.bounds.size.width - self.image.size.width + lineWidth)/2,
                                           (self.bounds.size.height - self.image.size.height - lineWidth)/2,
                                           self.image.size.width, self.image.size.height);
    //圆
    self.circleLayer.path            = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    //遮罩
    self.maskLayer.path              = self.circleLayer.path;
    self.maskLayer.position          = CGPointMake(0, 10);
    //label
    self.label.frame                 = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 24);

}

-(void)didMoveToWindow {
    [super didMoveToWindow];
    [self.layer addSublayer:self.photoLayer];
    self.photoLayer.mask = self.maskLayer;
    [self.layer addSublayer:self.circleLayer];
}

//---Mark: public
-(void)setImage:(UIImage *)image {
    _image = image;
    self.photoLayer.contents  = (__bridge id _Nullable)(image.CGImage);
}
-(void)setName:(NSString *)name {
    _name = name;
    self.label.text = name;
}

- (void)bounceOffPoint:(CGPoint)point morphSize:(CGSize)morphSize{
    CGPoint originalCenter    = self.center;
    
    CGRect morphedFrame;
    if (originalCenter.x > point.x) {
        morphedFrame          = CGRectMake(0, self.bounds.size.height - morphSize.height,
                                           morphSize.width, morphSize.height);
    } else {
        morphedFrame          = CGRectMake(self.bounds.size.width - morphSize.width,
                                           self.bounds.size.height - morphSize.height ,
                                           morphSize.width, morphSize.height);
    }
    //变形
    CABasicAnimation *morphAnimation      = [CABasicAnimation animationWithKeyPath:@"path"];
    morphAnimation.duration               = animationDuration;
    morphAnimation.toValue                = (__bridge id _Nullable)([UIBezierPath bezierPathWithOvalInRect:morphedFrame].CGPath);
    morphAnimation.timingFunction         = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.circleLayer addAnimation:morphAnimation forKey:nil];
    [self.maskLayer addAnimation:morphAnimation forKey:nil];
    
    //移动位置
    AIWeakSelf
    [UIView animateWithDuration:animationDuration delay:0. usingSpringWithDamping:.7 initialSpringVelocity:0. options:(UIViewAnimationOptionCurveLinear) animations:^{
        weakSelf.center  = point;
    } completion:nil];
    
    [UIView animateWithDuration:animationDuration delay:animationDuration usingSpringWithDamping:.7 initialSpringVelocity:1. options:(UIViewAnimationOptionCurveLinear) animations:^{
        weakSelf.center  = originalCenter;
    } completion:^(BOOL finished) {
        if (!weakSelf.shouldTransitionToFinishedState) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf bounceOffPoint:point morphSize:morphSize];
            });
        }else {
            [weakSelf.layer removeAllAnimations];
            [weakSelf animateToSquare];
        }
    }];
}

- (void)animateToSquare {
    CABasicAnimation *squareAnimation      = [CABasicAnimation animationWithKeyPath:@"path"];
    squareAnimation.duration               = animationDuration;
    squareAnimation.toValue                = (__bridge id _Nullable)([UIBezierPath bezierPathWithRect:self.bounds].CGPath);
    squareAnimation.timingFunction         = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    squareAnimation.removedOnCompletion    = NO;
    squareAnimation.fillMode               = kCAFillModeForwards;
    [self.circleLayer addAnimation:squareAnimation forKey:nil];
    [self.maskLayer addAnimation:squareAnimation forKey:nil];
}
- (void)reset {
    _shouldTransitionToFinishedState = NO;
    self.image                       = [UIImage imageNamed:@"empty"];
    self.name                        = @"";
    [self.circleLayer removeAllAnimations];
    [self.maskLayer removeAllAnimations];
}

@end
