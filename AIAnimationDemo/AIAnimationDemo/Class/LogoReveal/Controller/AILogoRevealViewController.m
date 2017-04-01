//
//  AILogoRevealViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/23.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AILogoRevealViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AIRWLogoLayer.h"
#import "AIRevealAnimator.h"
#import "AILogoDetailViewController.h"
@interface AILogoRevealViewController ()<UINavigationControllerDelegate>


/** 动画*/
@property(nonatomic,strong)AIRevealAnimator *transition;
@end

@implementation AILogoRevealViewController

#pragma mark -lazy
-(CAShapeLayer *)logo {
    if (!_logo) {
        _logo = [[AIRWLogoLayer alloc]logoLayer];
    }
    return _logo;
}
-(AIRevealAnimator *)transition {
    if (_transition) {
        _transition = [[AIRevealAnimator alloc]init];
    }
    return _transition;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title      = @"Start";
    self.view.backgroundColor   = [UIColor blackColor];
    self.navigationController.delegate  = self;
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //添加手势
    UITapGestureRecognizer *tap     = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTap)];
    [self.view addGestureRecognizer:tap];
    //添加layer
    self.logo.position              = CGPointMake(self.view.layer.bounds.size.width * .5, self.view.layer.bounds.size.height *.5 - 30);
    self.logo.fillColor             = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:self.logo];
}

#pragma mark -Action 
- (void)didTap {
    AILogoDetailViewController *detailVC     = [[AILogoDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    self.transition.operation   = operation;
    return _transition;
    
}

@end
