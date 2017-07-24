//
//  AIImageGalleryViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/12.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIImageGalleryViewController.h"
#import "AIImageViewCard.h"
#import "CALayer+SetRect.h"
@interface AIImageGalleryViewController ()
@property(nonatomic,strong)NSArray *images;
@end

@implementation AIImageGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemBookmarks) target:self action:@selector(onClickRight:)];
    
    self.images     = @[
                        [[AIImageViewCard alloc]initWithImageNamed:@"Hurricane_Katia.jpg" title:@"Hurricane Katia"],
                        [[AIImageViewCard alloc]initWithImageNamed:@"Hurricane_Douglas.jpg" title:@"Hurricane Douglas"],
                        [[AIImageViewCard alloc]initWithImageNamed:@"Hurricane_Norbert.jpg" title:@"Hurricane Norbert"],
                        [[AIImageViewCard alloc]initWithImageNamed:@"Hurricane_Irene.jpg" title:@"Hurricane Irene"]
                        ];
    self.view.backgroundColor = [UIColor blackColor];
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (AIImageViewCard *image in self.images) {
        image.layer.anchorPoint  = CGPointMake(image.layer.anchorPoint.x, 0.);
        image.frame              = self.view.bounds;
        
        image.didSelectBlock = ^(AIImageViewCard *selectedImage) {
            
            for (UIView *subview in self.view.subviews) {
                if (![subview isKindOfClass:[AIImageViewCard class]]) {
                    continue;
                }
                AIImageViewCard *image = (AIImageViewCard*)subview;
                if (selectedImage == image) {
                    [UIView animateWithDuration:.33 delay:0. options:(UIViewAnimationOptionCurveEaseIn) animations:^{
                        image.layer.transform  = CATransform3DIdentity;
                    } completion:^(BOOL finished) {
                        [self.view bringSubviewToFront:image];
                    }];
                } else {
                    [UIView animateWithDuration:.33 delay:0. options:(UIViewAnimationOptionCurveEaseIn) animations:^{
                        image.alpha  = 0.;
                    } completion:^(BOOL finished) {
                        image.alpha  = 1.;
                        image.layer.transform   = CATransform3DIdentity;
                    }];
                }
            }
            self.navigationItem.title = selectedImage.title;
        };
        [self.view addSubview:image];
    }
    AIImageViewCard *imageViewCard   = [self.images lastObject];
    self.navigationItem.title        = imageViewCard.title;
    CATransform3D perspective        = CATransform3DIdentity;
    perspective.m34                  = -1./250.;
    self.view.layer.sublayerTransform = perspective;
}

#pragma mark -Action
- (void)onClickRight:(UIBarButtonItem*)item {
    CGFloat imageYOffset  = 50.;
    
    for (UIView *subview in self.view.subviews) {
        if (![subview isKindOfClass:[AIImageViewCard class]]) {
            continue;
        }
        AIImageViewCard *image = (AIImageViewCard*)subview;
        CATransform3D imageTransform  = CATransform3DIdentity;
        //1
        imageTransform                = CATransform3DTranslate(imageTransform, 0., imageYOffset, 0.);
        //2
        imageTransform                = CATransform3DScale(imageTransform, 0.95, 0.6, 1.);
        //3
        imageTransform                = CATransform3DRotate(imageTransform, M_PI_4/2.0, -1., 0., 0.);
        
        CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.fromValue           = [NSValue valueWithCATransform3D:image.layer.transform];
        animation.toValue             = [NSValue valueWithCATransform3D:imageTransform];
        animation.duration            = .33;
        [image.layer addAnimation:animation forKey:nil];
        
        image.layer.transform         = imageTransform;
        imageYOffset                 += self.view.frame.size.height / (CGFloat)self.images.count;
    }
}




@end
