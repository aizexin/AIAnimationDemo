//
//  AICAGradientLayerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/13.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AICAGradientLayerViewController.h"
#import "CAGradientMaskView.h"
#import "AIGradientLayerNavgationDelegate.h"
#import "AIPush2ViewController.h"
@interface AICAGradientLayerViewController ()
//@property (nonatomic, strong) NSArray   *images;
//@property (nonatomic)         NSInteger  count;

@property (nonatomic, strong) CAGradientMaskView *tranformFadeViewOne;
//@property (nonatomic, strong) CAGradientMaskView *tranformFadeViewTwo;
@end

@implementation AICAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tranformFadeViewOne               = [[CAGradientMaskView alloc] initWithFrame:self.view.bounds];
//    self.tranformFadeViewOne.contentMode   = UIViewContentModeScaleAspectFill;
//    self.tranformFadeViewOne.fadeDuradtion = 4.f;
//    self.tranformFadeViewOne.image         = [UIImage imageNamed:@"1"];//[self currentImage];
//    [self.view addSubview:self.tranformFadeViewOne];
//    [self.tranformFadeViewOne fadeAnimated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.backgroundColor    = [UIColor orangeColor];
    [btn setTitle:@"点我push" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(onClickPush) forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame     = CGRectMake(0, 0, 100, 50);
    btn.center    = self.view.center;
    [self.view addSubview:btn];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 150, 200)];
    imageView.image        = [UIImage imageNamed:@"1"];
    [self.view addSubview:imageView];
}




/**
 点击事件
 */
-(void)onClickPush{
    
    self.lastScreenImage                          = [self screenShot];
    AIGradientLayerNavgationDelegate *navDelegate = [[AIGradientLayerNavgationDelegate alloc]init];
    self.navigationController.delegate            = navDelegate;
    AIPush2ViewController *pushVC                 = [[AIPush2ViewController alloc]init];
    [self.navigationController pushViewController:pushVC animated:YES];
}

/**
 截全屏

 @return 全屏图片
 */
-(UIImage *)screenShot{
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, YES, 0);
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
