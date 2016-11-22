//
//  AILoginAnimationViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/22.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AILoginAnimationViewController.h"
#import "UIView+SetRect.h"

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
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
    
    //前景
    UILabel *headingLabel          = [[UILabel alloc]init];
    headingLabel.text              = @"Bahama Login";
    headingLabel.textColor         = [UIColor whiteColor];
    headingLabel.font              = [UIFont fontWithName:@"Helvetica Neue" size:30.0];
    headingLabel.textAlignment     = NSTextAlignmentCenter;
    headingLabel.frame             = CGRectMake(80.5, 87.5, 214.5, 34);
    headingLabel.centerX           = self.view.centerX;
    [self.view addSubview:headingLabel];
    self.HeadingLabel              = headingLabel;
    
    UITextField *userNameTextField = [[UITextField alloc]init];
    userNameTextField.layer.cornerRadius = 8;
    userNameTextField.backgroundColor    = [UIColor whiteColor];
    userNameTextField.frame        = CGRectMake(0, 149, 280, 30);
    userNameTextField.centerX      = self.view.centerX;
    userNameTextField.placeholder  = @"Username";
    [self.view addSubview:userNameTextField];
    self.userNameTextField         = userNameTextField;
    
    UITextField *passWordTextField = [[UITextField alloc]init];
    passWordTextField.layer.cornerRadius = 8;
    passWordTextField.backgroundColor    = [UIColor whiteColor];
    passWordTextField.frame        = CGRectMake(0, 194, 280, 30);
    passWordTextField.centerX      = self.view.centerX;
    passWordTextField.placeholder  = @"passWord";
    [self.view addSubview:passWordTextField];
    self.passWordTextField         = passWordTextField;
    
    UIButton *loginBtn             = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.loginBtn                  = loginBtn;
    loginBtn.layer.cornerRadius    = 8;
    loginBtn.backgroundColor       = [UIColor colorWithRed:161/255. green:212/255. blue:98/255. alpha:1.];
    [loginBtn setTitle:@"Log In" forState:(UIControlStateNormal)];
    loginBtn.frame                 = CGRectMake(0, 250, 234, 52);
    loginBtn.centerX               = self.view.centerX;
    [self.view addSubview:loginBtn];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
