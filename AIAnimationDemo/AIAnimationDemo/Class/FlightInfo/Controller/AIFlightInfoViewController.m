//
//  AIFlightInfoViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/27.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIFlightInfoViewController.h"
#import "AIFlightDataModel.h"
#import "AISnowView.h"

typedef enum : NSUInteger {
    AnimationDirectionPositive = 1,
    AnimationDirectionNegative = -1,
} AnimationDirection;
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

/** 雪花*/
@property(nonatomic,strong)AISnowView *snowView;

@property(nonatomic,strong)CAEmitterLayer *emitter;
/** 发射器cell*/
@property(nonatomic,strong)CAEmitterCell *emitterCell;
/** 伦敦到巴黎*/
@property(nonatomic,strong)AIFlightDataModel *londonToParis;
/** 巴黎到罗马*/
@property(nonatomic,strong)AIFlightDataModel *parisToRome;
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
    
    self.snowView       = [[AISnowView alloc]initWithFrame: CGRectMake(-150, -100, 300, 50)];
    
    UIView *snowClipView  = [[UIView alloc]init];
    snowClipView.frame    = CGRectOffset(self.view.frame, 0, 50);
    snowClipView.clipsToBounds       = YES;
    [snowClipView addSubview:self.snowView];
    
    [self.view addSubview:self.snowView];
    AIFlightDataModel *londonToParis = [[AIFlightDataModel alloc]init];
    self.londonToParis               = londonToParis;
    londonToParis.summary            = @"01 Apr 2015 09:42";
    londonToParis.flightNr           = @"ZY 2014";
    londonToParis.gateNr             = @"T1 A33";
    londonToParis.departingFrom      = @"LGW";
    londonToParis.arrivingTo         = @"CDG";
    londonToParis.weatherImageName   = @"bg-snowy";
    londonToParis.showWeatherEffects = YES;
    londonToParis.takingOff          = YES;
    londonToParis.flightStatus       = @"Boarding";
    
    AIFlightDataModel *parisToRome = [[AIFlightDataModel alloc]init];
    self.parisToRome               = parisToRome;
    parisToRome.summary            = @"01 Apr 2015 17:05";
    parisToRome.flightNr           = @"AE 1107";
    parisToRome.gateNr             = @"045";
    parisToRome.departingFrom      = @"CDG";
    parisToRome.arrivingTo         = @"FCO";
    parisToRome.weatherImageName   = @"bg-sunny";
    parisToRome.showWeatherEffects = NO;
    parisToRome.takingOff          = NO;
    parisToRome.flightStatus       = @"Delayed";
    
    
    [self changeFlightToDta:londonToParis animated:YES];
    
    
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
 淡出改变图片

 @param imgeView 需要改变的ImageView
 @param toImage 改变成的图片
 @param showEffects 是否显示效果
 */
- (void)fadeImageView:(UIImageView *)imgeView toImage:(UIImage *)toImage showEffects:(BOOL)showEffects {
    [UIView transitionWithView:imgeView duration:1. options:(UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        imgeView.image = toImage;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:1. delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
        self.snowView.alpha = showEffects ? 1.:0;
    } completion:nil];
}

/**
 修改航班状态

 @param data 修改的数据
 @param animated 是否显示动画
 */
- (void)changeFlightToDta:(AIFlightDataModel *)data animated:(BOOL)animated {
    self.bgImageView.image  = [UIImage imageNamed:data.weatherImageName];
    if (animated) {
        [self fadeImageView:self.bgImageView toImage:[UIImage imageNamed:data.weatherImageName] showEffects:data.showWeatherEffects];
    }else {
        self.bgImageView.image = [UIImage imageNamed:data.weatherImageName];
        self.snowView.hidden   = !data.showWeatherEffects;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self changeFlightToDta:data.isTakingOff?self.parisToRome:self.londonToParis animated:YES];
    });
}

- (void)cubeTransitionLabel:(UILabel *)label text:(NSString *)text direction:(AnimationDirection)direction {
    UILabel *auxLabel = [[UILabel alloc]initWithFrame:label.frame];
    auxLabel.text     = text;
    auxLabel.font     = label.font;
    auxLabel.textAlignment      = label.textAlignment;
    auxLabel.textColor          = label.textColor;
    auxLabel.backgroundColor    = label.backgroundColor;
}








@end
