//
//  AILoading.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/8/5.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AILoadingView : UIView

/**
 开始动画
 */
- (void)starAnimation;

/**
 停止动画
 */
- (void)stopAnimation;
/** 一次动画所持续时长 默认2秒*/
@property(nonatomic,assign)NSTimeInterval duration;
/** 线条颜色*/
@property (nonatomic, strong) UIColor *strokeColor;
@end
