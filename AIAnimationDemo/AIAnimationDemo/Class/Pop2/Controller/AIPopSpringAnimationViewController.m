//
//  AIPopSpringAnimationViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  弹簧动画

#import "AIPopSpringAnimationViewController.h"

@interface AIPopSpringAnimationViewController ()

@property(nonatomic,weak)UIButton *showBtn;
@end

@implementation AIPopSpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //添加view
    UIButton *showView          = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    self.showBtn = showView;
    showView.center = self.view.center;
    showView.backgroundColor    = AIRandomColor;
    showView.layer.cornerRadius = showView.frame.size.width * 0.5;
    [showView addTarget:self action:@selector(onClickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:showView];
    //弹簧动画
}

-(void)onClickBtn:(UIButton*)btn{
    //放大
    POPSpringAnimation *springAnimation = \
    [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    springAnimation.springSpeed         = 0.f;
    springAnimation.toValue             = [NSValue valueWithCGRect:
                                           CGRectMake(0, 0, 150, 150)];
    [self.showBtn pop_addAnimation:springAnimation forKey:nil];
    
    POPSpringAnimation *reduceAnimation = \
    [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    reduceAnimation.springSpeed         = 0.f;
    reduceAnimation.toValue             = [NSValue valueWithCGRect:
                                           CGRectMake(0, 0, 100, 100)];
    [self.showBtn pop_addAnimation:reduceAnimation forKey:nil];
    
}


@end
