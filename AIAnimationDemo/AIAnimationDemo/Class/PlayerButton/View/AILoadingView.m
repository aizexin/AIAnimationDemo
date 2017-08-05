//
//  AILoading.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/8/5.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AILoadingView.h"

@interface AILoadingView ()

@property(nonatomic,strong)CAShapeLayer *loadingLayer;
@end
@implementation AILoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath *path      = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.loadingLayer.path  = path.CGPath;
}
- (void)createUI {
    self.loadingLayer   = [CAShapeLayer layer];
    self.loadingLayer.lineWidth = 3.;
    self.loadingLayer.fillColor = [UIColor clearColor].CGColor;
    self.loadingLayer.strokeColor = [UIColor flatBlueColor].CGColor;
    [self.layer addSublayer:self.loadingLayer];
//    self.loadingLayer.lineCap = kCGLineCapRound;
}

@end
