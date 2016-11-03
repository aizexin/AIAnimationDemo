//
//  AIPictureViewerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  防QQ图片浏览
/*          简书   :http://www.jianshu.com/p/349a257eaba9       */

#import "AIPictureViewerViewController.h"
#import "AIPictureViewer.h"

@interface AIPictureViewerViewController ()<AIPictureViewerDelegate>
/** uiimageview*/
@property(nonatomic,strong)UIImageView *imageV;
@end

@implementation AIPictureViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 150, 200)];
    [self.view addSubview:self.imageV];
    AIPictureViewer *pictureV = [[AIPictureViewer alloc]init];
    pictureV.delegate         = self;
    [self.view addSubview:pictureV];

}

#pragma mark -AIPictureViewerDelegate
-(void)pictureViewer:(AIPictureViewer *)pictureViewer didGestureSelectedImage:(UIImage *)image andImageWorldRect:(CGRect)imageWorldRect{
    UIImageView *imageView                = [[UIImageView alloc]initWithImage:image];
    imageView.frame                       = imageWorldRect;
    [self.view addSubview:imageView];
    POPBasicAnimation *popAnimation       =   [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    popAnimation.toValue                  =   [NSValue valueWithCGPoint:self.imageV.center];
    popAnimation.duration                 =   0.5;
    popAnimation.timingFunction           =   [CAMediaTimingFunction functionWithName:kCAAnimationLinear];
    [imageView.layer pop_addAnimation:popAnimation forKey:nil];
    //动画完成后赋值
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(popAnimation.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [imageView removeFromSuperview];
        self.imageV.image = image;
    });
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    //    NSLog(@"pointInside----%@", [self class]);
//    return [super pointInside:point withEvent:event];
//}

@end
