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

/**
 我的头像
 */
@property(nonatomic,weak)AIAvatarView *myAvatarView;
/** 对手头像*/
@property(nonatomic,weak)AIAvatarView *opponentAvatarView;
@end

@implementation AIMultiplayerViewController


#pragma mark --lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self searchForOpponent];
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
 搜索对手
 */
- (void)searchForOpponent {
    CGSize avatarSize      = self.myAvatarView.frame.size;
    CGFloat bounceXOffset  = avatarSize.width/1.9;
    CGSize morphSize       = CGSizeMake(avatarSize.width * 0.5, avatarSize.height *1.1);
    
    CGPoint rightBouncePoint  = CGPointMake(KWidth * .5 + bounceXOffset, self.myAvatarView.center.y);
    CGPoint leftBouncePoint   = CGPointMake(KWidth * .5 - bounceXOffset, self.myAvatarView.center.y);
    [self.myAvatarView bounceOffPoint:rightBouncePoint morphSize:morphSize];
    [self.opponentAvatarView bounceOffPoint:leftBouncePoint morphSize:morphSize];
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
    self.myAvatarView           = myAvatarView;
    myAvatarView.frame          = CGRectMake(261, 202.5, 90, 90);
    myAvatarView.image          = [UIImage imageNamed:@"avatar-1"];
    [self.view addSubview:myAvatarView];
    //对手
    AIAvatarView *opponentAvatarView    = [[AIAvatarView alloc]init];
    self.opponentAvatarView             = opponentAvatarView;
    opponentAvatarView.frame            = CGRectMake(23, 202.5, 90, 90);
//    opponentAvatarView.image            = [UIImage imageNamed:@"empty"];
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
