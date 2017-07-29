//
//  AIPlayerButton.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/29.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPlayerButton.h"

@implementation AIPlayerButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
        replicatorLayer.bounds = self.frame;
        replicatorLayer.position = self.center;
        [self.layer addSublayer:replicatorLayer];
        //
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = [UIColor redColor].CGColor;
        layer.cornerRadius = 20;
        layer.bounds = CGRectMake(0, 0, 40, 40);
        layer.position = CGPointMake(50, self.center.y);
        [replicatorLayer addSublayer:layer];
        layer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
        //
        CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        basicAni.fromValue = @(1);
        basicAni.toValue = @(0.1);
        basicAni.duration = 0.75;
        basicAni.repeatCount = NSIntegerMax;
        [layer addAnimation:basicAni forKey:@"layerPosition"];
        
        replicatorLayer.instanceCount = 15;
        replicatorLayer.preservesDepth = YES;
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, M_PI * 2 / 15.0, 0, 0, 1);
        replicatorLayer.instanceTransform = transform;
        replicatorLayer.instanceDelay = 0.05;
        replicatorLayer.instanceAlphaOffset = -1.0 / 15.0;
        
    }
    return self;
}


@end
