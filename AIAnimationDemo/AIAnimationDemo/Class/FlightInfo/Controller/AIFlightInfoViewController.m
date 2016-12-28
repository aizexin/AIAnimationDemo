//
//  AIFlightInfoViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/27.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIFlightInfoViewController.h"

@interface AIFlightInfoViewController ()

/**
 背景
 */
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

/**
 摘要
 */
@property (weak, nonatomic) IBOutlet UILabel *summary;

/**
 摘要图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *summaryIcon;
@property (weak, nonatomic) IBOutlet UILabel *flightNrLabel;
@property (weak, nonatomic) IBOutlet UILabel *gateNrLabel;

/**
 离开的地方
 */
@property (weak, nonatomic) IBOutlet UILabel *departingFromLabel;

/**
 到达的地方
 */
@property (weak, nonatomic) IBOutlet UILabel *arrivingToLabel;

/**
 飞机
 */
@property (weak, nonatomic) IBOutlet UIImageView *planeImage;

/**
 飞行状态
 */
@property (weak, nonatomic) IBOutlet UILabel *flightStatusLabel;

/**
 状态旗帜
 */
@property (weak, nonatomic) IBOutlet UIImageView *statusBannerImage;


@end

@implementation AIFlightInfoViewController

- (instancetype)init
{
    self = [[NSBundle mainBundle]loadNibNamed:@"AIFlightInfoViewController" owner:nil options:nil].lastObject;
    if (self) {
       
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)fadeImageView:(UIImageView *)imgeView toImage:(UIImage *)toImage showEffects:(BOOL)showEffects {
    [UIView transitionWithView:imgeView duration:1. options:(UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        imgeView.image = toImage;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:1. delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
//        self.snow
    } completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *imageString   = @"bg-sunny";
    UIImage *toImage        = [UIImage imageNamed:imageString];
    [self fadeImageView:self.bgImageView toImage:toImage showEffects:YES];
    
}







@end
