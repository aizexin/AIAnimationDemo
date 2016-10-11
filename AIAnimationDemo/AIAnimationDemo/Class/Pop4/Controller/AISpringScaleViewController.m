//
//  AISpringScaleViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AISpringScaleViewController.h"
#import "UIFont+Fonts.h"
#import "GCD.h"
@interface AISpringScaleViewController ()
@property (nonatomic, strong) UIView *scaleView;
@end

@implementation AISpringScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(64.5, 250, 285, 170)];
    label.text     = @"P   P";
    label.font     = [UIFont systemFontOfSize:140];
    [label sizeToFit];
    label.center   = self.view.center;
    [self.view addSubview:label];
    
    // Circle
    self.scaleView                    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.scaleView.backgroundColor    = [[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1] colorWithAlphaComponent:0.95f];
    self.scaleView.layer.cornerRadius = self.scaleView.frame.size.width / 2.f;
    self.scaleView.center             = self.view.center;
    [self.view addSubview:self.scaleView];
    
    // Start animation after 1 second.
    [GCDQueue executeInMainQueue:^{
        
        [self scaleAnimation];
        
    } afterDelaySecs:1.f];
}

- (void)scaleAnimation {
    
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    
    scaleAnimation.name               = @"scaleSmallAnimation";
    scaleAnimation.delegate           = self;
    
    scaleAnimation.duration           = 0.15f;
    scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(1.25, 1.25)];\
    
    [self.scaleView pop_addAnimation:scaleAnimation forKey:nil];
}
- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished {
    
    if ([anim.name isEqualToString:@"scaleSmallAnimation"]) {
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        
        scaleAnimation.name                = @"SpringAnimation";
        scaleAnimation.delegate            = self;
        
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(-2, -2)];
        scaleAnimation.springBounciness    = 20.f;
        scaleAnimation.springSpeed         = 10.f;
        scaleAnimation.dynamicsTension     = 700.f;
        scaleAnimation.dynamicsFriction    = 7.f;
        scaleAnimation.dynamicsMass        = 3.f;
        
        [self.scaleView pop_addAnimation:scaleAnimation forKey:nil];
        
    } else if ([anim.name isEqualToString:@"SpringAnimation"]) {
        
        [self performSelector:@selector(scaleAnimation) withObject:nil afterDelay:1];
    }
}


@end
