//
//  AIBaiduHUD.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AIBaiduHUD;

@protocol AIBaiduHudDelegate <NSObject>
/** 点击取消按钮后*/
- (void)baiduHud:(AIBaiduHUD*)baiduHud DidClickCancelButton:(UIButton*)cancelButton;

@end
@interface AIBaiduHUD : UIView

/** 代理*/
@property(nonatomic,weak)id<AIBaiduHudDelegate> delegate;

/** 显示*/
+(void)show;
/** 消失*/
+(void)dissmis;

singleton_h(AIBaiduHUD)
@end
