//
//  AILoginAnimationViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/22.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AILoginAnimationViewController.h"
#import "UIView+AISetRect.h"
#import "AITextFiled.h"
@interface AILoginAnimationViewController ()

/**
 背景图片
 */
@property(nonatomic,weak)UIImageView *bgImageView;
/** 头label*/
@property(nonatomic,weak)UILabel     *headingLabel;
/** 用户名*/
@property(nonatomic,weak)AITextFiled *userNameTextField;
/** 密码*/
@property(nonatomic,weak)AITextFiled *passWordTextField;
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

/** 菊花*/
@property(nonatomic,weak)UIActivityIndicatorView *spinner;
/** 状态*/
@property(nonatomic,weak)UIImageView *statusImageV;
/** 状态描述*/
@property(nonatomic,weak)UILabel *label;
/** 状态信息*/
@property(nonatomic,strong)NSArray *messages;
@property(nonatomic,assign)CGPoint statusPoint;
@end

@implementation AILoginAnimationViewController

#pragma mark --Lazy
-(NSArray *)messages {
    if (!_messages) {
        _messages      = @[@"Connecting ...", @"Authorizing ...", @"Sending credentials ...", @"Failed"];
    }
    return _messages;
}

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
    CABasicAnimation *flyRightAnimation  = [CABasicAnimation animationWithKeyPath:@"position.x"];
    flyRightAnimation.toValue            = [NSValue valueWithCGPoint: CGPointMake(MainSize.width * 0.5, 0)];
    flyRightAnimation.fromValue          = [NSValue valueWithCGPoint: CGPointMake(-MainSize.width * 0.5, 0)];//-@(MainSize.width * 0.5);
    flyRightAnimation.duration           = .5;
    flyRightAnimation.fillMode           = kCAFillModeBoth;
    [self.headingLabel.layer addAnimation:flyRightAnimation forKey:nil];
    flyRightAnimation.beginTime          = CACurrentMediaTime() + 0.3;
    [self.userNameTextField.layer addAnimation:flyRightAnimation forKey:nil];
    flyRightAnimation.beginTime          = CACurrentMediaTime() + 0.4;
    [self.passWordTextField.layer addAnimation:flyRightAnimation forKey:nil];
    
    //cloud
//    CABasicAnimation *fadeAnimation      = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    fadeAnimation.fromValue              = @0.;
//    fadeAnimation.toValue                = @1.;
//    fadeAnimation.duration               = .5;
//    fadeAnimation.fillMode               = kCAFillModeBackwards;
//    fadeAnimation.beginTime              = CACurrentMediaTime() + .5;
//    [self.cloud1ImageV.layer addAnimation:fadeAnimation forKey:nil];
//    fadeAnimation.beginTime              = CACurrentMediaTime() + .7;
//    [self.cloud2ImageV.layer addAnimation:fadeAnimation forKey:nil];
//    fadeAnimation.beginTime              = CACurrentMediaTime() + .9;
//    [self.cloud3ImageV.layer addAnimation:fadeAnimation forKey:nil];
//    fadeAnimation.beginTime              = CACurrentMediaTime() + 1.1;
//    [self.cloud4ImageV.layer addAnimation:fadeAnimation forKey:nil];
//    self.cloud1ImageV.alpha          = 0.;
//    self.cloud2ImageV.alpha          = 0.;
//    self.cloud3ImageV.alpha          = 0.;
//    self.cloud4ImageV.alpha          = 0.;
    //loginBtn
    self.loginBtn.ai_centerY        += 30;
    self.loginBtn.alpha              = 0;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    //cloud
//    [UIView animateWithDuration:.5 delay:.5 options:(UIViewAnimationOptionCurveLinear) animations:^{
//        self.cloud1ImageV.alpha = 1.;
//    } completion:nil];
//    [UIView animateWithDuration:.5 delay:.7 options:(UIViewAnimationOptionCurveLinear) animations:^{
//        self.cloud2ImageV.alpha = 1.;
//    } completion:nil];
//    [UIView animateWithDuration:.5 delay:.9 options:(UIViewAnimationOptionCurveLinear) animations:^{
//        self.cloud3ImageV.alpha = 1.;
//    } completion:nil];
//    [UIView animateWithDuration:.5 delay:1.1 options:(UIViewAnimationOptionCurveLinear) animations:^{
//        self.cloud4ImageV.alpha = 1.;
//    } completion:nil];
    //loginBtn
    [UIView animateWithDuration:.5 delay:.5 usingSpringWithDamping:.5 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.loginBtn.ai_centerY  -= 30;
        self.loginBtn.alpha        = 1.;
    } completion:nil];
    
    //云动画
    [self animationCloud:_cloud1ImageV];
    [self animationCloud:_cloud2ImageV];
    [self animationCloud:_cloud3ImageV];
    [self animationCloud:_cloud4ImageV];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark --UI

/**
 创建UI
 */
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
    headingLabel.ai_centerX        = self.view.ai_centerX;
    [self.view addSubview:headingLabel];
    self.headingLabel              = headingLabel;
    
    AITextFiled *userNameTextField = [[AITextFiled alloc]init];
    userNameTextField.frame        = CGRectMake(0, 149, 280, 30);
    userNameTextField.ai_centerX   = self.view.ai_centerX;
    userNameTextField.placeholder  = @"Username";
    [self.view addSubview:userNameTextField];
    self.userNameTextField         = userNameTextField;
    
    AITextFiled *passWordTextField = [[AITextFiled alloc]init];
    passWordTextField.frame        = CGRectMake(0, 194, 280, 30);
    passWordTextField.ai_centerX   = self.view.ai_centerX;
    passWordTextField.placeholder  = @"passWord";
    [self.view addSubview:passWordTextField];
    self.passWordTextField         = passWordTextField;
    
    UIButton *loginBtn             = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.loginBtn                  = loginBtn;
    loginBtn.layer.cornerRadius    = 8;
    loginBtn.backgroundColor       = [UIColor colorWithRed:161/255. green:212/255. blue:98/255. alpha:1.];
    [loginBtn setTitle:@"Log In" forState:(UIControlStateNormal)];
    loginBtn.frame                 = CGRectMake(0, 250, 234, 52);
    loginBtn.ai_centerX            = self.view.ai_centerX;
    [loginBtn addTarget:self action:@selector(onClickLogin:)forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:loginBtn];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
    self.spinner                     = spinner;
    spinner.alpha                    = 0.;
    [spinner startAnimating];
    spinner.frame                    = CGRectMake(-20, 6, 20, 20);
    [self.loginBtn addSubview:spinner];
    
    UIImageView *statusImageV        = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
    self.statusImageV                = statusImageV;
    statusImageV.center              = loginBtn.center;
    self.statusImageV.hidden         = YES;
    [self.view addSubview:statusImageV];
    
    UILabel *label                   = [[UILabel alloc]init];
    self.label                       = label;
    label.textColor                  = [UIColor colorWithRed:0.89 green:0.38 blue:0. alpha:1];
    label.textAlignment              = NSTextAlignmentCenter;
    label.font                       = [UIFont fontWithName:@"HelveticaNeue" size:18];
    label.ai_viewSize                   = self.statusImageV.ai_viewSize;
    [self.statusImageV addSubview:label];
    
    self.statusPoint                 = statusImageV.center;
}

#pragma mark --Action

/**
 点击登录按钮

 @param loginBtn 登录按钮
 */
- (void)onClickLogin:(UIButton*)loginBtn {
    [self.view endEditing:YES];
    loginBtn.enabled = NO;
    [UIView animateWithDuration:1.5 delay:0. usingSpringWithDamping:.2 initialSpringVelocity:0. options:(UIViewAnimationOptionCurveLinear) animations:^{
        CGRect loginBounds                = self.loginBtn.bounds;
        loginBounds.size.width           += 80;
        self.loginBtn.bounds              = loginBounds;
    } completion:^(BOOL finished) {
        [self showMessageWithIndex:0];
    }];
    
    [UIView animateWithDuration:.33 delay:0 usingSpringWithDamping:.7 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.loginBtn.ai_centerY         += 60;
        self.loginBtn.backgroundColor     = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1];
        self.spinner.ai_x                 = 40;
        self.spinner.alpha                = 1;
        self.spinner.ai_centerY           = self.loginBtn.ai_middleY;
    } completion:nil];
}

/**
 显示一条信息

 @param index 第几条
 */
- (void)showMessageWithIndex:(NSInteger)index {
    self.label.text  = self.messages[index];
    [UIView transitionWithView:self.statusImageV duration:.33 options:(UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionTransitionFlipFromBottom) animations:^{
        self.statusImageV.hidden = NO;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (index < (self.messages.count - 1)) {
                [self removeMessageWithIndex:index];
            }else{
                [self resetFrom];
            }
        });
    }];
}


/**
 提出一条信息

 @param index 第几条
 */
- (void)removeMessageWithIndex:(NSInteger)index {
    [UIView animateWithDuration:.33 animations:^{
        self.statusImageV.ai_centerX += MainSize.width;
    } completion:^(BOOL finished) {
        self.statusImageV.hidden      = YES;
        self.statusImageV.center      = self.statusPoint;
        [self showMessageWithIndex:index+1];
    }];
}

/**
 云动画
 */
- (void)animationCloud:(UIImageView*)cloudImageV {
    CGFloat cloudSpeed       = 60/MainSize.width;
    NSTimeInterval duration  = (MainSize.width - cloudImageV.ai_x) * cloudSpeed;
    [UIView animateWithDuration:duration animations:^{
        cloudImageV.ai_x = MainSize.width;
    } completion:^(BOOL finished) {
        cloudImageV.ai_x = -cloudImageV.ai_width;
        [self animationCloud:cloudImageV];
    }];
}

/**
 重置状态
 */
- (void)resetFrom{
    [UIView transitionWithView:self.statusImageV duration:.2 options:(UIViewAnimationOptionTransitionFlipFromTop) animations:^{
        self.statusImageV.hidden = YES;
        self.statusImageV.center = self.statusPoint;
    } completion:nil];
    
    [UIView animateWithDuration:.2 animations:^{
        self.spinner.center = CGPointMake(-20, 16);
        self.spinner.alpha  = 0.;
        self.loginBtn.backgroundColor  = [UIColor colorWithRed:0.63 green:.84 blue:.35 alpha:1];
        CGRect loginBounds             = self.loginBtn.bounds;
        loginBounds.size.width        -= 80;
        self.loginBtn.bounds           = loginBounds;
        self.loginBtn.ai_centerY      -= 60;
        self.loginBtn.enabled          = YES;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
