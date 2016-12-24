//
//  AIBlurImageViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/24.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIBlurImageViewController.h"
#import "UIImage+ImageEffects.h"
#import "UIImage+AIExtension.h"
@interface AIBlurImageViewController ()

@end

@implementation AIBlurImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bgImageView            = [[UIImageView alloc]init];
    bgImageView.frame                   = CGRectMake(0, 0, KWidth, 400);//self.view.bounds;
    bgImageView.center                  = self.view.center;
    bgImageView.image                   = [[UIImage imageNamed:@"default"]blurImage];
    [self.view addSubview:bgImageView];
    
    UIImageView *iconImageView          = [[UIImageView alloc]init];
    [self.view addSubview:iconImageView];
    iconImageView.image                 = [[UIImage imageNamed:@"default"]ai_circleImage];
    iconImageView.ai_viewSize           = CGSizeMake(120, 120);
    iconImageView.center                = self.view.center;
}


@end
