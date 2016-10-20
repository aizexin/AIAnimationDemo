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
#import "InfiniteRotationView.h"
@interface AIWellComeAnimationView ()


/** 圆*/
@property(nonatomic,strong)AICircleLayer *circleLayer;
/** 三角形*/
@property(nonatomic,strong)AITriangleLayer *triangleLayer;
/** 旋转的view*/
@property(nonatomic,strong)InfiniteRotationView *infiniteView;
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
-(InfiniteRotationView *)infiniteView{
    if (!_infiniteView) {
        _infiniteView = [[InfiniteRotationView alloc]init];
    }
    return _infiniteView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加旋转view
        [self addSubview:self.infiniteView];
        //圆圈动画
        [self addCirCleLayer];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.infiniteView.frame = self.bounds;
}
//添加圆圈动画
-(void)addCirCleLayer{
    [self.infiniteView.layer addSublayer:self.circleLayer];
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
    [self.infiniteView.layer addSublayer:self.triangleLayer ];
    //三角形动画
    [self.triangleLayer triangleAnimate];
    //进行旋转动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.triangleLayer.allInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self rotationAnimation];
    });
}

/** 旋转动画*/
-(void)rotationAnimation{
    self.infiniteView.speed = 0.6;
    [self.infiniteView startRotateAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.infiniteView reset];
    });
}

@end
