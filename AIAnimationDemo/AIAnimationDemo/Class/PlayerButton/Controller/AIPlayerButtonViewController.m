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
    
}
-(void)dealloc {
    [self.loadingView stopAnimation];
}

- (void)onclickBuutton:(UIButton*)button {
    button.selected        = !button.isSelected;
}

@end
