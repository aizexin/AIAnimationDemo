//
//  AILoadAnimationView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AILoadAnimationView.h"
#import "InfiniteRotationView.h"
#import "UIView+AnimationProperty.h"
#import "UIView+GlowView.h"
@interface AILoadAnimationView ()

@property (nonatomic, strong)  UIView  *messageView;
/** 旋转的view*/
@property(nonatomic,weak)InfiniteRotationView *rotateView;
/** lineImage*/
@property(nonatomic,weak)UIImageView *lineImageV;
/** wordImage*/
@property(nonatomic,weak)UIImageView *wordImageV;
@end

@implementation AILoadAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor             = [UIColor clearColor];
        // 创建信息窗体view
        self.messageView                 = [[UIView alloc] init];
        [self addSubview:self.messageView];
        //旋转的view
        InfiniteRotationView *rotateView = [[InfiniteRotationView alloc]init];
        self.rotateView                  = rotateView;
        rotateView.speed                 = 0.95f;
        rotateView.clockWise             = YES;
        [self.messageView addSubview:rotateView];
        //lineImage
        UIImageView *lineImageV          = [[UIImageView alloc]init];
        lineImageV.image                 = [UIImage imageNamed:@"line"];
        self.lineImageV                  = lineImageV;
        [rotateView addSubview:lineImageV];
        //wordImage
        UIImageView *wordImageV          = [[UIImageView alloc]initWithImage:
                                            [UIImage imageNamed:@"word"]];
        wordImageV.scale                 = 0.3f;
        self.wordImageV                  = wordImageV;
        [self.messageView addSubview:wordImageV];
        
//        [self startGlow];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //窗体
    self.messageView.frame = self.bounds;
    //旋转view
    self.rotateView.frame  = self.messageView.bounds;
    //lineImageV
    self.lineImageV.frame  = CGRectMake(0, 0, 80, 80);
    self.lineImageV.center = self.messageView.center;
    //wordImageV
    self.wordImageV.center = self.messageView.center;
}

/** 中间的图片辉光效果*/
- (void)startGlow{
    [self.rotateView startRotateAnimation];
    // Start glow.
    self.wordImageV .glowRadius            = @(2.f);
    self.wordImageV .glowOpacity           = @(1.f);
    self.wordImageV .glowColor             = [[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1] colorWithAlphaComponent:0.95f];
    self.wordImageV .glowDuration          = @(1.f);
    self.wordImageV .hideDuration          = @(3.f);
    self.wordImageV .glowAnimationDuration = @(2.f);
    [self.wordImageV  createGlowLayer];
    [self.wordImageV  insertGlowLayer];
    [self.wordImageV  startGlowLoop];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.messageView.alpha = 1.f;
        self.messageView.scale = 1.f;
    }];
}
- (void)resetGlow{
    [self.rotateView reset];
    [self.wordImageV removeGlowLayer];
}

@end
