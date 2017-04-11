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
    //添加返回按钮
    [self addbackBtn];
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
        
        [self planeDepart];
        
        [self fadeImageView:self.bgImageView toImage:[UIImage imageNamed:data.weatherImageName] showEffects:data.showWeatherEffects];
        AnimationDirection direction = data.isTakingOff ? AnimationDirectionPositive : AnimationDirectionNegative;
        [self cubeTransitionLabel:self.flightNrLabel text:data.flightNr direction:direction];
        [self cubeTransitionLabel:self.gateNrLabel text:data.gateNr direction:direction];
        
        [self moveLabel:self.departingFromLabel text:data.departingFrom offset:CGPointMake(80, 0)];
        [self moveLabel:self.arrivingToLabel text:data.arrivingTo offset:CGPointMake(0, 80)];
        
        [self cubeTransitionLabel:self.flightStatusLabel text:data.flightStatus direction:direction];
        
        [self summarySwitchToString:data.summary];
    }else {
        self.bgImageView.image = [UIImage imageNamed:data.weatherImageName];
        self.snowView.hidden   = !data.showWeatherEffects;
        
        self.flightNrLabel.text     = data.flightNr;
        self.gateNrLabel.text       = data.gateNr;
        
        self.departingFromLabel.text  = data.departingFrom;
        self.arrivingToLabel.text     = data.arrivingTo;
        self.flightStatusLabel.text   = data.flightStatus;
        
        self.departingFromLabel.text  = data.departingFrom;
        self.arrivingToLabel.text     = data.arrivingTo;
        
        self.summary.text       = data.summary;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self changeFlightToDta:data.isTakingOff?self.parisToRome:self.londonToParis animated:animated];
    });
}

/**
 3d效果旋转改变label

 @param label 旋转的label
 @param text 改变的文字
 @param direction 方向
 */
- (void)cubeTransitionLabel:(UILabel *)label text:(NSString *)text direction:(AnimationDirection)direction {
    UILabel *auxLabel = [[UILabel alloc]initWithFrame:label.frame];
    auxLabel.text     = text;
    auxLabel.font     = label.font;
    auxLabel.textAlignment      = label.textAlignment;
    auxLabel.textColor          = label.textColor;
    auxLabel.backgroundColor    = label.backgroundColor;
    
    CGFloat auxLabelOffset      = label.frame.size.height * 0.5 * (NSInteger)(direction);
    auxLabel.transform          = CGAffineTransformConcat(CGAffineTransformMakeScale(1., .1),
                                                          CGAffineTransformMakeScale(0, auxLabelOffset));
    [label.superview addSubview:auxLabel];
    
    [UIView animateWithDuration:.5 delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
        auxLabel.transform      = CGAffineTransformIdentity;
        label.transform         = CGAffineTransformConcat(CGAffineTransformMakeScale(1., .1),
                                                          CGAffineTransformMakeTranslation(1., -auxLabelOffset));
    } completion:^(BOOL finished) {
        label.text              = auxLabel.text;
        label.transform         = CGAffineTransformIdentity;
        [auxLabel removeFromSuperview];
    }];
}

/**
 移动变换label

 @param label 变换的label
 @param text 变换的值
 @param offset 偏移量
 */
- (void)moveLabel:(UILabel*)label text:(NSString*)text offset:(CGPoint)offset {
    UILabel *auxLabel   = [[UILabel alloc]initWithFrame:label.frame];
    auxLabel.text       = text;
    auxLabel.font       = label.font;
    auxLabel.textAlignment      = label.textAlignment;
    auxLabel.textColor          = label.textColor;
    auxLabel.backgroundColor    = [UIColor clearColor];
    
    auxLabel.transform  = CGAffineTransformMakeTranslation(offset.x, offset.y);
    auxLabel.alpha      = 0;
    [self.view addSubview:auxLabel];
    
    [UIView animateWithDuration:.5 delay:0. options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        label.transform = CGAffineTransformMakeTranslation(offset.x, offset.y);
        label.alpha     = 0.;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:.25 delay:.1 options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        auxLabel.transform   = CGAffineTransformIdentity;
        auxLabel.alpha       = 1.;
    } completion:^(BOOL finished) {
        [auxLabel removeFromSuperview];
        label.text           = text;
        label.alpha          = 1.;
        label.transform      = CGAffineTransformIdentity;
    }];
}

/**
 飞机离开
 */
- (void)planeDepart {
    CGPoint originalCenter = self.planeImage.center;
    [UIView animateKeyframesWithDuration:1.5 delay:0 options:(UIViewKeyframeAnimationOptionAllowUserInteraction) animations:^{
        //add keyframes
        [UIView addKeyframeWithRelativeStartTime:0. relativeDuration:.25 animations:^{
            self.planeImage.ai_centerX += 80;
            self.planeImage.ai_centerY -= 10;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.1 relativeDuration:.4 animations:^{
            self.planeImage.transform   = CGAffineTransformRotate(CGAffineTransformIdentity, -M_PI/8);
        }];
        [UIView addKeyframeWithRelativeStartTime:.25 relativeDuration:.25 animations:^{
            self.planeImage.ai_centerX += 100;
            self.planeImage.ai_centerY -= 50;
            self.planeImage.alpha       = 0;
        }];
        [UIView addKeyframeWithRelativeStartTime:.51 relativeDuration:.01 animations:^{
            self.planeImage.transform   = CGAffineTransformIdentity;
            self.planeImage.center      = CGPointMake(0., originalCenter.y);
        }];
        [UIView addKeyframeWithRelativeStartTime:.55 relativeDuration:.45 animations:^{
            self.planeImage.alpha       = 1.;
            self.planeImage.center      = originalCenter;
        }];
        
    } completion:^(BOOL finished) {
        
    }];
}

/**
 改变摘要

 @param string 改变的字符串
 */
- (void)summarySwitchToString:(NSString*)string {
    [UIView animateKeyframesWithDuration:1.5 delay:0 options:(UIViewKeyframeAnimationOptionBeginFromCurrentState) animations:^{
       
        [UIView addKeyframeWithRelativeStartTime:.0 relativeDuration:.5 animations:^{
            self.summary.ai_y -= 10;
            self.summary.alpha = 0.;
        }];
        [UIView addKeyframeWithRelativeStartTime:.5 relativeDuration:.5 animations:^{
            self.summary.ai_y += 10;
            self.summary.alpha = 1;
        }];
        
    } completion:^(BOOL finished) {
        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.summary.text = string;
    });
}






@end
