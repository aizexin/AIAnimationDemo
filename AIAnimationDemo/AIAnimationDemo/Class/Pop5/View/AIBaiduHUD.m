//
//  AIBaiduHUD.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIBaiduHUD.h"
#import "AILoadAnimationView.h"
@interface AIBaiduHUD ()

/** 提示label*/
@property(nonatomic,weak)UILabel *tipsLable;
/** 动画这块view*/
@property(nonatomic,weak)AILoadAnimationView *animationView;
/** 取消按钮*/
@property(nonatomic,weak)UIButton *cancelButton;
@end

@implementation AIBaiduHUD


/**
 创建
 */
-(void)createHub{
    //提示label
    UILabel *tipsLabel = [[UILabel alloc]init];
    self.tipsLable     = tipsLabel;
    [self addSubview:tipsLabel];
    //动画view
    AILoadAnimationView *animationView = [[AILoadAnimationView alloc]init];
    self.animationView    = animationView;
    [self addSubview:animationView];
    //取消按钮
    UIButton *cancelButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.cancelButton      = cancelButton;
    [self addSubview:cancelButton];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //动画view
    CGFloat animationViewW   = 100;
    CGFloat animationViewH   = 100;
    CGFloat animationViewX   = 0;
    CGFloat animationViewY   = 0;
    self.animationView.frame = CGRectMake(animationViewX,
                                          animationViewY,
                                          animationViewW,
                                          animationViewH);
    //label
    CGFloat tipsLabelX       = CGRectGetMaxX(self.animationView.frame);
    CGFloat tipsLabelY       = 0;
    CGFloat tipsLabelW       = 200;
    CGFloat tipsLabelH       = 100;
    self.tipsLable.frame     = CGRectMake(tipsLabelX,
                                          tipsLabelY,
                                          tipsLabelW,
                                          tipsLabelH);
    //取消按钮
}

@end
