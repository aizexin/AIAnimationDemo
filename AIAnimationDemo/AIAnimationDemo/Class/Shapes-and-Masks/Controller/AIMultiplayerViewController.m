//
//  AIMultiplayerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/14.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIMultiplayerViewController.h"
#import "AIAvatarView.h"
@interface AIMultiplayerViewController ()

@end

@implementation AIMultiplayerViewController


#pragma mark --lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
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
    //me
    AIAvatarView *myAvatarView  = [[AIAvatarView alloc]init];
    myAvatarView.frame          = CGRectMake(261, 202.5, 90, 90);
    [self.view addSubview:myAvatarView];
    //对手
    AIAvatarView *opponentAvatarView    = [[AIAvatarView alloc]init];
    opponentAvatarView.frame            = CGRectMake(23, 202.5, 90, 90);
    [self.view addSubview:opponentAvatarView];
    //搜索按钮
    UIButton *searchAgainBtn            = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [searchAgainBtn setTitle:@"search Again" forState:(UIControlStateNormal)];
    searchAgainBtn.frame                = CGRectMake(27.5, 577, 320, 55);
    searchAgainBtn.titleLabel.font      = [UIFont fontWithName:@"ArialRoundedMTBold" size:31];
    [searchAgainBtn setTitleColor:[UIColor colorWithRed:0.90196f green:0.81961f blue:0.20392f alpha:1.00000f] forState:(UIControlStateNormal)];
    [self.view addSubview:searchAgainBtn];
    //vs
    UILabel *vsLabel          = [[UILabel alloc]init];
    vsLabel.textColor         = [UIColor whiteColor];
    vsLabel.frame             = CGRectMake(159.5, 227, 58, 43);
    vsLabel.text              = @"vs.";
    vsLabel.font              = [UIFont fontWithName:@"ArialRoundedMTBold" size:36];
    [self.view addSubview:vsLabel];
}

@end
