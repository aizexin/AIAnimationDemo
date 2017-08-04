//
//  AIPlayerButton.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/29.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPlayerButton.h"

//@interface UIControl (XY)
//@property (nonatomic, assign) NSTimeInterval uxy_acceptEventInterval;   // 可以用这个给重复点击加间隔
//@end
//@implementation UIControl (XY)
//+ (void)load
//{
//        Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
//        Method b = class_getInstanceMethod(self, @selector(__uxy_sendAction:to:forEvent:));
//        method_exchangeImplementations(a, b);
//}
//@end
//static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
//- (NSTimeInterval)uxy_acceptEventInterval
//{
//        return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
//}
//- (void)setUxy_acceptEventInterval:(NSTimeInterval)uxy_acceptEventInterval
//{
//        objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(uxy_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
@interface AIPlayerButton ()

@property(nonatomic,strong)CAShapeLayer *layer1;
@property(nonatomic,strong)CAShapeLayer *layer2;
@property(nonatomic,strong)CAShapeLayer *layer3;

@end

@implementation AIPlayerButton

+(void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__ai__sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}
- (void)__ai__sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    AILog(@"-----");
    if (self.isSelected) {
        [self changeToPlayingAnimation];
    } else {
        [self changeToStopAnimation];
    }
    [self __ai__sendAction:action to:target forEvent:event];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer1               = [CAShapeLayer layer];
        self.layer1.strokeColor   = [UIColor blackColor].CGColor;
        self.layer1.lineCap       = kCALineCapRound;
        self.layer1.lineWidth     = 4;
        
        self.layer2               = [CAShapeLayer layer];
        self.layer2.strokeColor   = [UIColor blackColor].CGColor;
        self.layer2.lineCap       = kCALineCapRound;
        self.layer2.lineWidth     = 4;
        
        self.layer3               = [CAShapeLayer layer];
        self.layer3.strokeColor   = [UIColor blackColor].CGColor;
        self.layer3.lineCap       = kCALineCapRound;
        self.layer3.lineWidth     = 4;
        self.layer3.opacity       = 0.;
        
        [self.layer addSublayer:self.layer1];
        [self.layer addSublayer:self.layer2];
        [self.layer addSublayer:self.layer3];

    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath* bezierPath1 = [UIBezierPath bezierPath];
    [bezierPath1 moveToPoint: CGPointMake(self.frame.size.width *0.25, self.frame.size.height *0.2)];
    [bezierPath1 addLineToPoint: CGPointMake(self.frame.size.width *0.25, self.frame.size.height *0.8)];
    bezierPath1.lineWidth     = 4;
    self.layer1.path          = bezierPath1.CGPath;
    
    UIBezierPath* bezierPath2 = [UIBezierPath bezierPath];
    [bezierPath2 moveToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.2)];
    [bezierPath2 addLineToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.8)];
    bezierPath2.lineWidth     = 4;
    self.layer2.path          = bezierPath2.CGPath;
    
    UIBezierPath* bezierPath3 = [UIBezierPath bezierPath];
    [bezierPath3 moveToPoint: CGPointMake(self.frame.size.width *0.25, self.frame.size.height *0.2)];
    [bezierPath3 addLineToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.2)];
    bezierPath3.lineWidth     = 4;
    self.layer3.path          = bezierPath3.CGPath;
}


/**
 path动画

 @param path 变为的path
 @param duration 持续时间
 @return 返回动画
 */
- (CABasicAnimation*)animationToPath:(UIBezierPath* )path duration:(NSTimeInterval)duration {
    CABasicAnimation    *pathAnimation   = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.toValue                = (__bridge id)(path.CGPath);
    pathAnimation.fillMode               = kCAFillModeForwards;
    pathAnimation.removedOnCompletion    = NO;
    pathAnimation.duration               = duration;
    return pathAnimation;
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
    opacityAnimation.duration                    = .2;
    [layer pop_addAnimation:opacityAnimation forKey:nil];
}
- (UIBezierPath *)bezierPath2stop {
    //2
    UIBezierPath* bezierPath2stop = [UIBezierPath bezierPath];
    [bezierPath2stop moveToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.5)];
    [bezierPath2stop addLineToPoint: CGPointMake(self.frame.size.width *0.25, self.frame.size.height *0.8)];
    bezierPath2stop.lineWidth     = 4;
    return bezierPath2stop;
}
- (UIBezierPath *)bezierPath2Playing {
    //2
    UIBezierPath* bezierPath2 = [UIBezierPath bezierPath];
    [bezierPath2 moveToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.2)];
    [bezierPath2 addLineToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.8)];
    bezierPath2.lineWidth     = 4;
    return bezierPath2;
}
- (UIBezierPath *) bezierPath3stop{
    UIBezierPath* bezierPath3stop = [UIBezierPath bezierPath];
    [bezierPath3stop moveToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.5)];
    [bezierPath3stop addLineToPoint: CGPointMake(self.frame.size.width *0.25, self.frame.size.height *0.2)];
    bezierPath3stop.lineWidth     = 4;
    return bezierPath3stop;
}
- (UIBezierPath *) bezierPath3Playing{
    UIBezierPath* bezierPath3 = [UIBezierPath bezierPath];
    [bezierPath3 moveToPoint: CGPointMake(self.frame.size.width *0.25, self.frame.size.height *0.2)];
    [bezierPath3 addLineToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.2)];
    bezierPath3.lineWidth     = 4;
    return bezierPath3;
}

/**
 变为暂停
 */
- (void)changeToStopAnimation {
    //2
    CABasicAnimation *layer2changeToStop        = [self animationToPath:[self bezierPath2stop] duration:.2];
    [self.layer2 addAnimation:layer2changeToStop forKey:nil];
    //3
    [self opacityAnimationWithLayer:self.layer3 fromValue:0. toValue:1.];
    
    CABasicAnimation *layer3changeToStop        = [self animationToPath:[self bezierPath3stop] duration:.2];
    [self.layer3 addAnimation:layer3changeToStop forKey:nil];
}
- (void)changeToPlayingAnimation {
    //2
    CABasicAnimation *layer2changeToPlaying     = [self animationToPath:[self bezierPath2Playing] duration:.2];
    [self.layer2 addAnimation:layer2changeToPlaying forKey:nil];
    //3
    [self opacityAnimationWithLayer:self.layer3 fromValue:1. toValue:0.];
    
    CABasicAnimation *layer3changeToStop        = [self animationToPath:[self bezierPath3Playing] duration:.2];
    [self.layer3 addAnimation:layer3changeToStop forKey:nil];
    
}


@end
