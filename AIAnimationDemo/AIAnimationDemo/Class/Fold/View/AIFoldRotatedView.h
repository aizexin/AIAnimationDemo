//
//  AIFoldRotatedView.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AIFoldRotatedView;
@protocol AIFoldRotatedViewDelegate<NSObject>

/**
 折叠完成后回调

 @param roatatedView 折叠控件
 @param anim anim description
 @param flag flag description
 */
- (void)foldRotatedView:(AIFoldRotatedView*)roatatedView animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;

@end
@interface AIFoldRotatedView : UIView

/** 代理*/
@property(nonatomic,weak)id<AIFoldRotatedViewDelegate> delegate;
/**
 初始化

 @param frame frame
 @param image 图片
 @return 实体
 */
- (instancetype)initWithFrame:(CGRect)frame Image:(UIImage *)image;
/**
 折叠动画
 
 @param timing 节奏
 @param from 开始
 @param to 结束
 @param duration 持续时长
 @param delay 延时
 @param hiden 是否隐藏contentView
 */
//- (void)foldingAnimationTiming:(NSString *)timing from:(CGFloat)from to:(CGFloat)to duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay hiden:(BOOL)hiden;
/**
 旋转180度
 
 @param duration 持续时长
 @param delay 延时
 */
- (void)foldingAnimationMI_PWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay;
@end
