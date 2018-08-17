//
//  AIPlayerButtonViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/28.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPlayerButtonViewController.h"
#import "AIPlayerButton.h"
#import "AILoadingView.h"
#import "AIAnimationDemo-Swift.h"
#import "AISparkView.h"

@interface AIPlayerButtonViewController ()
@property(nonatomic,weak)AILoadingView *loadingView;
@end

@implementation AIPlayerButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AIPlayerButton *button = [[AIPlayerButton alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
    button.strokeColor     = [UIColor flatBlueColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(onclickBuutton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    AILoadingView *loadingView  = [[AILoadingView alloc]initWithFrame:CGRectMake(100, 200, 30, 30)];
    self.loadingView            = loadingView;
    loadingView.strokeColor     = [UIColor flatBlueColor];

    [loadingView starAnimation];
    [self.view addSubview:loadingView];
    
    AIWaveView *waveView   = [[AIWaveView alloc]initWithFrame:CGRectMake(100, 300, 30, 30)];
    [self.view addSubview:waveView];
    
    AILoadingPointView *loadingPointView  = [[AILoadingPointView alloc]initWithFrame:CGRectMake(100, 400, 200, 60)];
    [self.view addSubview:loadingPointView];
    
    AISparkView *sparkView  = [[AISparkView alloc]initWithFrame:CGRectMake(100, 500, 60, 60)];
    [sparkView beginAnimationWithDuration:6];
    [self.view addSubview:sparkView];
    
}
-(void)dealloc {
    [self.loadingView stopAnimation];
}

- (void)onclickBuutton:(UIButton*)button {
    button.selected        = !button.isSelected;
}

@end
