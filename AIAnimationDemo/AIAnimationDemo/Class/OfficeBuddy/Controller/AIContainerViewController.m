//
//  AIContainerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/6/19.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIContainerViewController.h"

@interface AIContainerViewController ()

/**菜单 */
@property(nonatomic,weak)UIViewController   *menuViewController;
/** 中间的controller*/
@property(nonatomic,weak)UINavigationController *centerViewController;
/** 是否打开*/
@property(nonatomic,assign,getter=isOpening)BOOL opening;
@end
CGFloat menuWith                = 80.;
NSTimeInterval animationTime    = .5;
@implementation AIContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor       = [UIColor blackColor];
    [self setNeedsStatusBarAppearanceUpdate];
    //中心
    [self addChildViewController:self.centerViewController];
    [self.view addSubview:self.centerViewController.view];
    [self.centerViewController didMoveToParentViewController:self];
    //菜单
    [self addChildViewController:self.menuViewController];
    [self.view addSubview:self.menuViewController.view];
    [self.menuViewController didMoveToParentViewController:self];
    
    self.menuViewController.view.layer.anchorPoint      = CGPointMake(1., self.menuViewController.view.layer.anchorPoint.y);
    self.menuViewController.view.frame                  = CGRectMake(-menuWith, 0, menuWith, self.view.ai_height);
    
    UIPanGestureRecognizer  *panGesture                 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:panGesture];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
-(instancetype)initWithSlideMeun:(UIViewController*)slideMeun center:(UINavigationController*)center {
    self = [super init];
    if (self) {
        _menuViewController     = slideMeun;
        _centerViewController   = center;
    }
    return self;
}
#pragma mark -Action    
- (void)handleGesture:(UIPanGestureRecognizer*)pan {
    //todo
}

@end
