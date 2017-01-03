//
//  AISnowView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/2.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AISnowView.h"

@interface AISnowView ()

@property(nonatomic,strong)CAEmitterLayer *emitter;
/** 发射器cell*/
@property(nonatomic,strong)CAEmitterCell *emitterCell;
@end

@implementation AISnowView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.emitter     = [[CAEmitterLayer alloc]init];
        self.emitterCell = [CAEmitterCell emitterCell];
        self.emitter.emitterPosition = CGPointMake(self.bounds.size.width * .5, 0);
        self.emitter.emitterSize     = self.bounds.size;
        self.emitter.emitterShape    = kCAEmitterLayerRectangle;
        self.emitterCell.contents        = (__bridge id _Nullable)([UIImage imageNamed:@"flake.png"].CGImage);
        self.emitterCell.birthRate       = 200;
        self.emitterCell.lifetime        = 3.5;
        self.emitterCell.color           = [UIColor whiteColor].CGColor;
        self.emitterCell.redRange        = 0.;
        self.emitterCell.blueRange       = .1;
        self.emitterCell.greenRange      = 0.;
        self.emitterCell.velocity        = 10.;
        self.emitterCell.velocityRange   = 350;
        self.emitterCell.emissionRange   = M_PI_2;
        self.emitterCell.emissionLongitude  = -M_PI;
        self.emitterCell.yAcceleration   = 70;
        self.emitterCell.xAcceleration   = 0;
        self.emitterCell.scale           = .33;
        self.emitterCell.scaleRange      = 1.25;
        self.emitterCell.scaleSpeed      = -.25;
        self.emitterCell.alphaRange      = .5;
        self.emitterCell.alphaSpeed      = -.15;
        
        self.emitter.emitterCells    = @[self.emitterCell];
        [self.layer addSublayer:self.emitter];
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
}
+(Class)layerClass {
    return CAEmitterLayer.self;
}


@end
