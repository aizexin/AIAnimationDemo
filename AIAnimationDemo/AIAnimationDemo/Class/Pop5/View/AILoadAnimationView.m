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
@end

@implementation AILoadAnimationView


- (void)show{
    [self createMessageView];
}

- (void)createMessageView {
    
    // 创建信息窗体view
    self.messageView                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.messageView.center              = self.center;
    self.messageView.layer.cornerRadius  = self.frame.size.width / 2.f;
    self.messageView.layer.masksToBounds = YES;
    self.messageView.alpha               = 0.f;
    [self addSubview:self.messageView];
    
    {
        InfiniteRotationView *rotateView = [[InfiniteRotationView alloc] initWithFrame:self.messageView.bounds];
        rotateView.speed                 = 0.95f;
        rotateView.clockWise             = YES;
        [rotateView startRotateAnimation];
        [self.messageView addSubview:rotateView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        imageView.image        = [UIImage imageNamed:@"line"];
        imageView.center       = rotateView.center;
        [rotateView addSubview:imageView];
    }
    
    UIImageView *inImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"word"]];
    inImageView.scale        = 0.3f;
    [self.messageView addSubview:inImageView];
    inImageView.center = self.messageView.center;
    
    // Start glow.
    inImageView.glowRadius            = @(2.f);
    inImageView.glowOpacity           = @(1.f);
    inImageView.glowColor             = [[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1] colorWithAlphaComponent:0.95f];
    inImageView.glowDuration          = @(1.f);
    inImageView.hideDuration          = @(3.f);
    inImageView.glowAnimationDuration = @(2.f);
    [inImageView createGlowLayer];
    [inImageView insertGlowLayer];
    [inImageView startGlowLoop];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.messageView.alpha = 1.f;
        self.messageView.scale = 1.f;
    }];
}

@end
