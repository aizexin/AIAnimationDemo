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
        [self.layer addSublayer:self.circleLayer];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.circleLayer changeBig];
        });
    }
    return self;
}

@end
