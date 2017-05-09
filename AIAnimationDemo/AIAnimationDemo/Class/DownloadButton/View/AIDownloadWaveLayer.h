//
//  AIDownloadWaveLayer.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/5/9.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface AIDownloadWaveLayer : CAShapeLayer
/** 波浪颜色*/
@property(nonatomic,strong)UIColor *waveColor;
/** frame*/
@property(nonatomic, weak)UIView *onView;
/** 是否停止*/
@property(nonatomic, assign,getter=isStop)BOOL stop;
/** 动画时间*/
@property(nonatomic,assign,readonly)NSTimeInterval allAnimationDuration;
- (void)waveAnimate;

@end
