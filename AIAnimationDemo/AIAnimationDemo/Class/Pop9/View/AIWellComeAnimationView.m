//
//  AIWellComeAnimationView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/18.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIWellComeAnimationView.h"
#import "AICircleLayer.h"
#import "AITriangleLayer.h"
@interface AIWellComeAnimationView ()

/** 圆*/
@property(nonatomic,strong)AICircleLayer *circleLayer;
/** 三角形*/
@property(nonatomic,strong)AITriangleLayer *triangleLayer;
@end

@implementation AIWellComeAnimationView

#pragma mark --lazy
-(AICircleLayer *)circleLayer{
    if (!_circleLayer) {
        _circleLayer = [[AICircleLayer alloc]init];
    }
    return _circleLayer;
}
-(AITriangleLayer *)triangleLayer{
    if (!_triangleLayer) {
        _triangleLayer = [[AITriangleLayer alloc]init];
    }
    return _triangleLayer;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //圆圈动画
        [self addCirCleLayer];
    }
    return self;
}
//添加圆圈动画
-(void)addCirCleLayer{
    [self.layer addSublayer:self.circleLayer];
    //变大动画
    [self.circleLayer changeBig];
    //摇晃动画
    [self.circleLayer wobbleAnimation];
    //进行三角动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addTriangleLayer];
    });
}
/** 添加三角形动画*/
-(void)addTriangleLayer{
    [self.layer addSublayer:self.triangleLayer ];
    //三角形动画
    [self.triangleLayer triangleAnimate];
}

@end
