//
//  AIMultiplayerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/14.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIMultiplayerViewController.h"

@interface AIMultiplayerViewController ()

@end

@implementation AIMultiplayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

/**
 设置UI
 */
- (void)setUI {
    //背景
    UIImageView *bgImageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-boxingring"]];
    bgImageView.frame         = self.view.bounds;
    [self.view addSubview:bgImageView];
    //状态文字
    UILabel *statusLabel      = [[UILabel alloc]init];
    statusLabel.numberOfLines = 2;
    statusLabel.font          = [UIFont fontWithName:@"ArialRoundedMTBold" size:29];
    statusLabel.textColor     = [UIColor whiteColor];
    statusLabel.text          = @"Searching for opponents...";
    statusLabel.frame         = CGRectMake(71.5, 45.5, 232, 68);
    [self.view addSubview:statusLabel];
}

@end
