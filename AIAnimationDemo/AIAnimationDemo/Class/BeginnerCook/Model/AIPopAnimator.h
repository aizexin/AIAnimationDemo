//
//  AIPopAnimator.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/2.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIPopAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/** 持续时间*/
@property(nonatomic, assign)CGFloat duration;
/** 是否呈现*/
@property(nonatomic, assign)BOOL presenting;
/** 其实frame*/
@property(nonatomic, assign)CGRect originFrame;
/** 消失的时候调用*/
@property(nonatomic, copy)void(^dismissComletion)();

@end
