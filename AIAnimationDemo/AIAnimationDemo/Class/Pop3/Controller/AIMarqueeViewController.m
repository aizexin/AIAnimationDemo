//
//  AIMarqueeViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/29.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  跑马灯效果

#import "AIMarqueeViewController.h"
#import "DrawMarqueeView.h"
@interface AIMarqueeViewController ()<DrawMarqueeViewDelegate>

@end

@implementation AIMarqueeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawMarqueeView *drawMarqueeView  = [[DrawMarqueeView alloc] initWithFrame:CGRectMake(0, 0, 250.f, 20)];
    drawMarqueeView.layer.borderWidth = 0.5f;
    drawMarqueeView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.25].CGColor;
    drawMarqueeView.speed             = 0.5f;
    drawMarqueeView.delegate          = self;
    drawMarqueeView.marqueeDirection  = kDrawMarqueeLeft;
    drawMarqueeView.center            = self.view.center;
    [self.view addSubview:drawMarqueeView];
    UILabel *label                    = [[UILabel alloc]init];
    //宽度应该根据text的长度计算
    label.frame                       = CGRectMake(0, 0, 200, 20);
    label.text                        = @"12345678901234567890123456789012345678901234567890";
    label.textColor                   = [UIColor blueColor];
    [drawMarqueeView addContentView:label];
    [drawMarqueeView startAnimation];
    
}

//- (void)drawMarqueeView:(DrawMarqueeView *)drawMarqueeView animationDidStopFinished:(BOOL)finished {
//    
//    [drawMarqueeView stopAnimation];
//}


@end
