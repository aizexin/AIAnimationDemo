//
//  AIPlayerButton.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/29.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPlayerButton.h"

@interface AIPlayerButton ()

@property(nonatomic,strong)CAShapeLayer *layer1;
@property(nonatomic,strong)CAShapeLayer *layer2;
@property(nonatomic,strong)CAShapeLayer *layer3;

@end
@implementation AIPlayerButton

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
        
        //手势
        UITapGestureRecognizer *tap   = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
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

#pragma mark -Action 
- (void)tapClick:(UITapGestureRecognizer*)tap {
    //animation
    //2
    UIBezierPath* bezierPath2stop = [UIBezierPath bezierPath];
    [bezierPath2stop moveToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.5)];
    [bezierPath2stop addLineToPoint: CGPointMake(self.frame.size.width *0.25, self.frame.size.height *0.8)];
    bezierPath2stop.lineWidth     = 4;
    
    CABasicAnimation    *layer2changeToStop   = [CABasicAnimation animationWithKeyPath:@"path"];
    layer2changeToStop.toValue                = (__bridge id)(bezierPath2stop.CGPath);
    layer2changeToStop.fillMode               = kCAFillModeForwards;
    layer2changeToStop.removedOnCompletion    = NO;
    layer2changeToStop.duration               = .2;
    [self.layer2 addAnimation:layer2changeToStop forKey:nil];
    //3
    self.layer3.opacity           = 1.;
    
    UIBezierPath* bezierPath3stop = [UIBezierPath bezierPath];
    [bezierPath3stop moveToPoint: CGPointMake(self.frame.size.width *0.75, self.frame.size.height *0.5)];
    [bezierPath3stop addLineToPoint: CGPointMake(self.frame.size.width *0.25, self.frame.size.height *0.2)];
    bezierPath3stop.lineWidth     = 4;
    
    CABasicAnimation    *layer3changeToStop   = [CABasicAnimation animationWithKeyPath:@"path"];
    layer3changeToStop.toValue                = (__bridge id)(bezierPath3stop.CGPath);
    layer3changeToStop.fillMode               = kCAFillModeForwards;
    layer3changeToStop.removedOnCompletion    = NO;
    layer3changeToStop.duration               = .2;
    [self.layer3 addAnimation:layer3changeToStop forKey:nil];
    //回调
    if (self.onClickblock) {
        self.onClickblock(self);
    }
}

@end
