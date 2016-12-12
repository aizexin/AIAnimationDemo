//
//  AITmallLoadingViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/6.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITmallLoadingViewController.h"
#import "AITmallLoadingView.h"
@interface AITmallLoadingViewController ()

@end

@implementation AITmallLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AITmallLoadingView *loadingView = [[AITmallLoadingView alloc]init];
//    loadingView.type                = AITmallTypeLight;
    [self.view addSubview:loadingView];
    loadingView.ai_viewSize         = CGSizeMake(54, 27);
    loadingView.center              = self.view.center;
    [loadingView startAnimation];
}




@end
