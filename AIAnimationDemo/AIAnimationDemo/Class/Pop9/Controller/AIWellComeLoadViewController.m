//
//  AIWillComeLoadViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/17.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  wellcome动画

#import "AIWellComeLoadViewController.h"
#import "AIWellComeAnimationView.h"
#import "UIView+SetRect.h"
@interface AIWellComeLoadViewController ()<AIWellComeAnimationDelegate>
/** 动画view*/
@property(nonatomic,weak)AIWellComeAnimationView *wellComeAnimationView;
@end

@implementation AIWellComeLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

-(void)setUI{
    AIWellComeAnimationView *wellComeAnimationView = [[AIWellComeAnimationView alloc]init];
    self.wellComeAnimationView                     = wellComeAnimationView;
    wellComeAnimationView.delegate                 = self;
    wellComeAnimationView.parentFrame              = self.view.frame;
    wellComeAnimationView.viewSize                 = CGSizeMake(100, 100);
    wellComeAnimationView.center                   = self.view.center;
    [self.view addSubview:wellComeAnimationView];
}

-(void)wellComeAnimationCompeleted:(AIWellComeAnimationView *)wellComeAnimationView{
    [self.wellComeAnimationView removeFromSuperview];
    self.view.backgroundColor                      = self.wellComeAnimationView.animationColor;
    // 2
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:50.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Welcome";
    label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25);
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0);
        
    } completion:^(BOOL finished) {
    }];
}


@end
