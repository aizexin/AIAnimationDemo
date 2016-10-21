//
//  AIWaveLayer.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/21.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface AIWaveLayer : CAShapeLayer

/** 波浪颜色*/
@property(nonatomic,strong)UIColor *waveColor;
- (void)waveAnimate;
@end
