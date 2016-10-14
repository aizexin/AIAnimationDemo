//
//  AICAGradientLayerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/13.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AICAGradientLayerViewController.h"
#import "CAGradientMaskView.h"
@interface AICAGradientLayerViewController ()
@property (nonatomic, strong) NSArray   *images;
@property (nonatomic)         NSInteger  count;

@property (nonatomic, strong) CAGradientMaskView *tranformFadeViewOne;
@property (nonatomic, strong) CAGradientMaskView *tranformFadeViewTwo;
@end

@implementation AICAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tranformFadeViewOne               = [[CAGradientMaskView alloc] initWithFrame:self.view.bounds];
    self.tranformFadeViewOne.contentMode   = UIViewContentModeScaleAspectFill;
    self.tranformFadeViewOne.fadeDuradtion = 4.f;
    self.tranformFadeViewOne.image         = [UIImage imageNamed:@"1"];//[self currentImage];
    [self.view addSubview:self.tranformFadeViewOne];
    [self.tranformFadeViewOne fadeAnimated:YES];
}

- (UIImage *)currentImage {
    
    self.count = ++self.count % self.images.count;
    
    return self.images[self.count];
}

@end
