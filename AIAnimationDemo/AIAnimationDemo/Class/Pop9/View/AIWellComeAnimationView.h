//
//  AIWellComeAnimationView.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/18.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AIWellComeAnimationView;
@protocol AIWellComeAnimationDelegate <NSObject>

-(void)wellComeAnimationCompeleted:(AIWellComeAnimationView*)wellComeAnimationView;

@end
@interface AIWellComeAnimationView : UIView
/** 父视图的frame*/
@property (assign, nonatomic) CGRect parentFrame;
/** 水波颜色*/
@property(nonatomic,strong,readonly)UIColor *animationColor;

/** 代理*/
@property(nonatomic,weak)id<AIWellComeAnimationDelegate> delegate;
@end


