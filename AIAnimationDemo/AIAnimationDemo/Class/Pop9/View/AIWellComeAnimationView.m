//
//  AIWellComeAnimationView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/18.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIWellComeAnimationView.h"
#import "AICircleLayer.h"

@interface AIWellComeAnimationView ()

/** 圆*/
@property(nonatomic,strong)AICircleLayer *circleLayer;
@end

@implementation AIWellComeAnimationView

#pragma mark --lazy
-(AICircleLayer *)circleLayer{
    if (!_circleLayer) {
        _circleLayer = [[AICircleLayer alloc]init];
    }
    return _circleLayer;
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
}

@end
