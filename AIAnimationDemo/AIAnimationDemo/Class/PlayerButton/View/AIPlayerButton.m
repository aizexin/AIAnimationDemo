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
}

@end
