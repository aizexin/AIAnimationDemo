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
#import "AIRectangleLayer.h"
#import "AIWaveLayer.h"
@interface AIWellComeAnimationView ()


/** 圆*/
@property(nonatomic,strong)AICircleLayer *circleLayer;
/** 三角形*/
@property(nonatomic,strong)AITriangleLayer *triangleLayer;
/** 旋转的view*/
@property(nonatomic,strong)InfiniteRotationView *infiniteView;
/** 矩形*/
@property(nonatomic,strong)AIRectangleLayer *rectangLayer;
/** 波浪*/
@property(nonatomic,strong)AIWaveLayer *waveLayer;
/** 水波颜色*/
@property(nonatomic,strong)UIColor *animationColor;
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
        _infiniteView.layer.anchorPoint = CGPointMake(0.5, 0.65);
    }
    return _infiniteView;
}
-(AIRectangleLayer *)rectangLayer{
    if (!_rectangLayer) {
        _rectangLayer = [[AIRectangleLayer alloc]init];
    }
    return _rectangLayer;
}
-(AIWaveLayer *)waveLayer{
    if (!_waveLayer) {
        _waveLayer = [[AIWaveLayer alloc]init];
        _waveLayer.waveColor = self.animationColor;
    }
    return _waveLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.animationColor = [UIColor colorWithRed:74/255. green:223/255. blue:177/255. alpha:1.];
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
        [self.circleLayer changeSmall];
    });
}

/** 旋转动画*/
-(void)rotationAnimation{
    self.infiniteView.speed = 0.3;
    [self.infiniteView startRotateAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.infiniteView reset];
        //添加矩形动画
        [self addRectangLayer];
        
    });
}
/** 添加矩形*/
-(void)addRectangLayer{
    [self.layer addSublayer:self.rectangLayer];
    [self.rectangLayer strokeChangeWithColor:self.animationColor];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.rectangLayer.allAnimationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //波浪动画
        [self addWaveLayer];
    });
}
/** 波浪动画*/
-(void)addWaveLayer{
    [self.layer addSublayer:self.waveLayer];
    [self.waveLayer waveAnimate];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.waveLayer.allAnimationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self expandView];
    });
}
/** 最后放大*/
- (void)expandView {
    self.backgroundColor = _animationColor;
    self.layer.sublayers = nil;
    //放大
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = self.parentFrame;
    } completion:^(BOOL finished) {
        if (_delegate && [_delegate respondsToSelector:@selector(wellComeAnimationCompeleted:)]) {
            [_delegate wellComeAnimationCompeleted:self];
        }
    }];
}
@end
