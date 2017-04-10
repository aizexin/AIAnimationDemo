//
//  AISlideToRevealViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/23.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AISlideToRevealViewController.h"
#import "AIAnimationMaskLabel.h"
#import <MLTransition.h>
@interface AISlideToRevealViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet AIAnimationMaskLabel *maskLabel;

@end

@implementation AISlideToRevealViewController
- (instancetype)init {
    self = [[NSBundle mainBundle]loadNibNamed:@"AISlideToRevealViewController" owner:nil options:nil].lastObject;
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *date                    = [NSDate date];
    NSDateFormatter *dateFormatter  = [[NSDateFormatter alloc]init];
     dateFormatter.dateFormat       = @"HH:mm";
    self.timeLabel.text             = [dateFormatter stringFromDate:date];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didSlide)];
    swipe.direction                 = UISwipeGestureRecognizerDirectionRight;
    [self.maskLabel addGestureRecognizer:swipe];
    
    self.maskLabel.disableMLTransition = YES;

}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark -Action 
- (void)didSlide {
    UIImageView *imageView          = [[UIImageView alloc]init];
    imageView.image                 = [UIImage imageNamed:@"meme"];
    imageView.ai_viewSize           = CGSizeMake(200, 200);
    imageView.center                = self.view.center;
    imageView.ai_centerX            = self.view.ai_centerX + KWidth;
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:.33 delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
        self.timeLabel.ai_centerY    -= 200.;
        self.maskLabel.ai_centerY    += 200.;
        imageView.ai_centerX         -= KWidth;
    } completion:^(BOOL finished) {
        
    }];
    [UIView animateWithDuration:.33 delay:1.0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
        self.timeLabel.ai_centerY    += 200.;
        self.maskLabel.ai_centerY    -= 200.;
        imageView.ai_centerX         += KWidth;
    } completion:^(BOOL finished) {
        
    }];
}



@end
