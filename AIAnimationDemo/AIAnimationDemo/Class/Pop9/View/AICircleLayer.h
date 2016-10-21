//
//  AICircleLayer.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/18.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface AICircleLayer : CAShapeLayer

@property(nonatomic,assign,readonly)NSTimeInterval allAnimationDuration;

/** 放大*/
-(void)changeBig;
/** 变小*/
- (void)changeSmall;
/** 摇晃动画*/
- (void)wobbleAnimation;
@end
