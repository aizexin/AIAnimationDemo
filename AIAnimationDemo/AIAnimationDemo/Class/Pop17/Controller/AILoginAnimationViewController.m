//
//  AILoginAnimationViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/22.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AILoginAnimationViewController.h"

@interface AILoginAnimationViewController ()

/**
 背景图片
 */
@property(nonatomic,weak)UIImageView *bgImageView;
/** 头label*/
@property(nonatomic,weak)UILabel     *HeadingLabel;
/** 用户名*/
@property(nonatomic,weak)UITextField *userNameTextField;
/** 密码*/
@property(nonatomic,weak)UITextField *passWordTextField;
/** 登录按钮*/
@property(nonatomic,weak)UIButton    *loginBtn;

/** 云1*/
@property(nonatomic,weak)UIImageView *cloud1ImageV;
/** 云2*/
@property(nonatomic,weak)UIImageView *cloud2ImageV;
/** 云3*/
@property(nonatomic,weak)UIImageView *cloud3ImageV;
/** 云4*/
@property(nonatomic,weak)UIImageView *cloud4ImageV;
@end

@implementation AILoginAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

#pragma mark --UI
- (void)setUpUI{
    UIImageView *bgImageView       = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny"]];
    self.bgImageView               = bgImageView;
    self.bgImageView.frame         = self.view.bounds;
    [self.view addSubview:bgImageView];
    
    UIImageView *cloud1ImageV      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny-cloud-1"]];
    self.cloud1ImageV              = cloud1ImageV;
    self.cloud1ImageV.frame        = CGRectMake(-120, 131, 159, 50);
    [self.view addSubview:cloud1ImageV];
    
    UIImageView *cloud2ImageV      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny-cloud-2"]];
    self.cloud2ImageV              = cloud2ImageV;
    self.cloud2ImageV.frame        = CGRectMake(217, 155, 158, 49);
    [self.view addSubview:cloud2ImageV];
    
    UIImageView *cloud3ImageV      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny-cloud-3"]];
    self.cloud3ImageV              = cloud3ImageV;
    self.cloud3ImageV.frame        = CGRectMake(252, 369, 74, 35);
    [self.view addSubview:cloud3ImageV];
    
    UIImageView *cloud4ImageV      = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-sunny-cloud-4"]];
    self.cloud4ImageV              = cloud4ImageV;
    self.cloud4ImageV.frame        = CGRectMake(20, 397.5, 115, 50);
    [self.view addSubview:cloud4ImageV];
}

@end
