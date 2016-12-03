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
@interface AILoginAnimationViewController ()<CAAnimationDelegate,UITextFieldDelegate>

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
    flyRightAnimation.delegate           = self;
    [flyRightAnimation setValue:@"form" forKey:@"name"];
    [flyRightAnimation setValue:self.headingLabel.layer forKey:@"layer"];
    flyRightAnimation.toValue            = [NSValue valueWithCGPoint: CGPointMake(MainSize.width * 0.5, 0)];
    flyRightAnimation.fromValue          = [NSValue valueWithCGPoint: CGPointMake(-MainSize.width * 0.5, 0)];//-@(MainSize.width * 0.5);
    flyRightAnimation.duration           = .5;
    flyRightAnimation.fillMode           = kCAFillModeBoth;
    [self.headingLabel.layer addAnimation:flyRightAnimation forKey:nil];
    flyRightAnimation.beginTime          = CACurrentMediaTime() + 0.3;
    [flyRightAnimation setValue:self.userNameTextField.layer forKey:@"layer"];
    [self.userNameTextField.layer addAnimation:flyRightAnimation forKey:nil];
    flyRightAnimation.beginTime          = CACurrentMediaTime() + 0.4;
    [flyRightAnimation setValue:self.passWordTextField.layer forKey:@"layer"];
    [self.passWordTextField.layer addAnimation:flyRightAnimation forKey:nil];
    
    //cloud
    CABasicAnimation *fadeAnimation      = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue              = @0.;
    fadeAnimation.toValue                = @1.;
    fadeAnimation.duration               = .5;
    fadeAnimation.fillMode               = kCAFillModeBackwards;
    fadeAnimation.beginTime              = CACurrentMediaTime() + .5;
    [self.cloud1ImageV.layer addAnimation:fadeAnimation forKey:nil];
    fadeAnimation.beginTime              = CACurrentMediaTime() + .7;
    [self.cloud2ImageV.layer addAnimation:fadeAnimation forKey:nil];
    fadeAnimation.beginTime              = CACurrentMediaTime() + .9;
    [self.cloud3ImageV.layer addAnimation:fadeAnimation forKey:nil];
    fadeAnimation.beginTime              = CACurrentMediaTime() + 1.1;
    [self.cloud4ImageV.layer addAnimation:fadeAnimation forKey:nil];

    //loginBtn
//    self.loginBtn.ai_centerY        += 30;
    self.loginBtn.alpha              = 0;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    //loginBtn
    CAAnimationGroup *groupAnimation   = [[CAAnimationGroup alloc]init];
    groupAnimation.beginTime           = CACurrentMediaTime() + .5;
    groupAnimation.duration            = .5;
    groupAnimation.fillMode            = kCAFillModeBackwards;
    groupAnimation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *scaleDownAnimation   = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleDownAnimation.fromValue           = @3.5;
    scaleDownAnimation.toValue             = @1.;
    
    CABasicAnimation *rotateAnimation      = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue              = @M_PI_4;
    rotateAnimation.toValue                = @0;
    
    CABasicAnimation *fadeAnimation        = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue                = @0.;
    fadeAnimation.toValue                  = @1.;
    
    groupAnimation.animations              = @[fadeAnimation,scaleDownAnimation,rotateAnimation];
    [self.loginBtn.layer addAnimation:groupAnimation forKey:nil];
     self.loginBtn.alpha                   = 1;
//    [UIView animateWithDuration:.5 delay:.5 usingSpringWithDamping:.5 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
//        self.loginBtn.ai_centerY  -= 30;
//        self.loginBtn.alpha        = 1.;
//    } completion:nil];
    //云动画
    [self animationCloud:_cloud1ImageV.layer];
    [self animationCloud:_cloud2ImageV.layer];
    [self animationCloud:_cloud3ImageV.layer];
    [self animationCloud:_cloud4ImageV.layer];
    
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
    userNameTextField.delegate     = self;
    userNameTextField.frame        = CGRectMake(0, 149, 280, 30);
    userNameTextField.ai_centerX   = self.view.ai_centerX;
    userNameTextField.placeholder  = @"Username";
    [self.view addSubview:userNameTextField];
    self.userNameTextField         = userNameTextField;
    
    AITextFiled *passWordTextField = [[AITextFiled alloc]init];
    passWordTextField.delegate     = self;
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
    //弹簧动画变宽
    [UIView animateWithDuration:1.5 delay:0. usingSpringWithDamping:.2 initialSpringVelocity:0. options:(UIViewAnimationOptionCurveLinear) animations:^{
        CGRect loginBounds                = self.loginBtn.bounds;
        loginBounds.size.width           += 80;
        self.loginBtn.bounds              = loginBounds;
    } completion:^(BOOL finished) {
        [self showMessageWithIndex:0];
        
    }];
    
    [UIView animateWithDuration:.33 delay:0 usingSpringWithDamping:.7 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
        self.loginBtn.ai_centerY         += 60;
        self.spinner.ai_x                 = 40;
        self.spinner.alpha                = 1;
        self.spinner.ai_centerY           = self.loginBtn.ai_middleY;
    } completion:nil];
    
    //改变颜色
    UIColor             *toColor          = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1];
    [self tintBackgroundColorWithCALayer:self.loginBtn.layer toColor:toColor];
    //改变圆角
    [self roundCornersWithCALayer:self.loginBtn.layer toRadius:25];
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
- (void)animationCloud:(CALayer*)layer {
    //1
    CGFloat cloudSpeed       = 60/MainSize.width;
    NSTimeInterval duration  = (MainSize.width - layer.frame.origin.x) * cloudSpeed;
    //2
    CABasicAnimation *moveAnimation   = [CABasicAnimation animationWithKeyPath:@"position.x"];
    [moveAnimation setValue:@"cloud" forKey:@"name"];
    [moveAnimation setValue:layer forKey:@"layer"];
    moveAnimation.delegate            = self;
    moveAnimation.duration            = duration;
    moveAnimation.fillMode            = kCAFillModeForwards;
    moveAnimation.fromValue           = @(layer.position.x);
    moveAnimation.toValue             = @(self.view.ai_width + layer.bounds.size.width * 0.5);
    [layer addAnimation:moveAnimation forKey:nil];
    layer.position                     = CGPointMake(-layer.bounds.size.width/2, layer.position.y);
}


/**
 重置状态
 */
- (void)resetFrom{
    //提示图片消失动画
    [UIView transitionWithView:self.statusImageV duration:.2 options:(UIViewAnimationOptionTransitionFlipFromTop) animations:^{
        self.statusImageV.hidden = YES;
        self.statusImageV.center = self.statusPoint;
    } completion:nil];
    
    [UIView animateWithDuration:.2 animations:^{
        self.spinner.center = CGPointMake(-20, 16);
        self.spinner.alpha  = 0.;
        CGRect loginBounds             = self.loginBtn.bounds;
        loginBounds.size.width        -= 80;
        self.loginBtn.bounds           = loginBounds;
        self.loginBtn.ai_centerY      -= 60;
        self.loginBtn.enabled          = YES;
    } completion:^(BOOL finished) {
        
        //改变颜色
        UIColor             *toColor  = [UIColor colorWithRed:161/255. green:212/255. blue:98/255. alpha:1.];
        [self tintBackgroundColorWithCALayer:self.loginBtn.layer toColor:toColor];
        //改变圆角
        [self roundCornersWithCALayer:self.loginBtn.layer toRadius:8];
    }];
}


/**
 动画来改变layer的背景颜色
 
 @param layer   改变的layer
 @param toColor 改变的颜色
 */
- (void)tintBackgroundColorWithCALayer:(CALayer*)layer toColor:(UIColor*)toColor{
    CABasicAnimation *tintAnimation    = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    tintAnimation.fromValue            = (__bridge id _Nullable)(layer.backgroundColor);
    tintAnimation.toValue              = (__bridge id _Nullable)(toColor.CGColor);
    tintAnimation.duration             = .5;
    [layer addAnimation:tintAnimation forKey:nil];
    layer.backgroundColor              = toColor.CGColor;
}

/**
 设置圆角动画

 @param layer  动画的layer
 @param radius 圆角半径
 */
- (void)roundCornersWithCALayer:(CALayer*)layer toRadius:(CGFloat)radius {
    CABasicAnimation *radiusAnimation     = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    radiusAnimation.fromValue             = @(layer.cornerRadius);
    radiusAnimation.toValue               = @(radius);
    radiusAnimation.duration              = .5;
    [layer addAnimation:radiusAnimation forKey:nil];
    layer.cornerRadius                    = radius;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark ---CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *name                         = [anim valueForKey:@"name"];
    if ([name isEqualToString:@"form"]) {
        CALayer *layer                     = [anim valueForKey:@"layer"];
        [anim setValue:nil forKey:@"layer"];
        //脉冲动画
        CASpringAnimation *pulseAnimation   = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
        pulseAnimation.damping             = 7.5;
        pulseAnimation.fromValue           = @(1.25);
        pulseAnimation.toValue             = @(1.);
        pulseAnimation.duration            = pulseAnimation.settlingDuration;
        [layer addAnimation:pulseAnimation forKey:nil];
    }
    if ([name isEqualToString:@"cloud"]) {
        CALayer *layer                     = [anim valueForKey:@"layer"];
        layer.position                     = CGPointMake(-layer.bounds.size.width/2, layer.position.y);
        [self animationCloud:layer];
    }
}

#pragma mark --UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *text = textField.text;
    if (text.length < 5) {
        CASpringAnimation *jumpAnimation   = [CASpringAnimation animationWithKeyPath:@"position.y"];
        jumpAnimation.fromValue            = @(textField.layer.position.y+1);
        jumpAnimation.toValue              = @(textField.layer.position.y);
        jumpAnimation.duration             = jumpAnimation.settlingDuration;
        jumpAnimation.initialVelocity      = 100.;
        jumpAnimation.mass                 = 10.;
        jumpAnimation.stiffness            = 1500.;
        jumpAnimation.damping              = 50.;
        [textField.layer addAnimation:jumpAnimation forKey:nil];
        
        
        textField.layer.borderWidth        = 3.;
        textField.layer.borderColor        = [UIColor clearColor].CGColor;
        CASpringAnimation *flashAniamtion  = [CASpringAnimation animationWithKeyPath:@"borderColor"];
        flashAniamtion.damping             = 7.;
        flashAniamtion.stiffness           = 200.;
        flashAniamtion.fromValue           = (__bridge id _Nullable)([UIColor colorWithRed:1. green:0.27 blue:0 alpha:1.].CGColor);
        flashAniamtion.toValue             = (__bridge id _Nullable)([UIColor whiteColor].CGColor);
        flashAniamtion.duration            = flashAniamtion.settlingDuration;
        [textField.layer addAnimation:flashAniamtion forKey:nil];
        
    }
}


@end
