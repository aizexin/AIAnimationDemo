//
//  AIShimmerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/13.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  facebook辉光动画

#import "AIShimmerViewController.h"
#import "UIFont+Fonts.h"
#import "FBShimmeringView.h"
@interface AIShimmerViewController ()

@end

@implementation AIShimmerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor flatBlackColor];
    
    UILabel *headlinelabel      = [UILabel new];
    headlinelabel.font          = [UIFont fontWithName:@"ArialRoundedMTBold" size:40];
    headlinelabel.textAlignment = NSTextAlignmentCenter;
    headlinelabel.textColor     = [UIColor flatWhiteColor];
    headlinelabel.text          = @"辉光效果";
    [headlinelabel sizeToFit];
    [self.view addSubview:headlinelabel];
    
    FBShimmeringView *shimmeringView           = [[FBShimmeringView alloc] initWithFrame:headlinelabel.bounds];
    shimmeringView.shimmering                  = YES;
    shimmeringView.shimmeringBeginFadeDuration = 0.4;
    shimmeringView.shimmeringOpacity           = 0.1f;
    shimmeringView.shimmeringAnimationOpacity  = 1.f;
    [self.view addSubview:shimmeringView];
    shimmeringView.center                      = self.view.center;
    shimmeringView.contentView = headlinelabel;
}



@end
