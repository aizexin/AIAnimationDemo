//
//  AIPictureViewerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  防QQ图片浏览

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
    /*
    UIButton *view1             = [[UIButton alloc]init];
//    [view1 addTarget:self action:@selector(onClickView1) forControlEvents:(UIControlEventTouchDown)];
    view1.userInteractionEnabled = YES;
    view1.backgroundColor     = [UIColor blueColor];
    view1.frame               = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:view1];
    RACSignal *signalView1    =  [view1 rac_signalForControlEvents:(UIControlEventTouchDown)];
    [signalView1 subscribeNext:^(id  _Nullable x) {
        [self onClickView1];
    }];
    
    
    
    AIPictureViewer *view2             = [[AIPictureViewer alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    view2.userInteractionEnabled       = YES;
    UITapGestureRecognizer *pan        = [[UITapGestureRecognizer alloc]init];//[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickView2:)];
    [view2 addGestureRecognizer:pan];
    view2.backgroundColor              = [UIColor brownColor];
    [view1 addSubview:view2];
    
    RACSignal *tapSignal               = [pan rac_gestureSignal];
    [tapSignal subscribeNext:^(id  _Nullable x) {
        [self onClickView1];
        [self onClickView2:x];
    }];
    //任意一个信号触发都可以
    [[tapSignal merge:signalView1]subscribeNext:^(id  _Nullable x) {
        AILog(@"一起");
    }];*/
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


-(void)onClickView1{
    AILog(@"点击view111111");
}
-(void)onClickView2:(UIPanGestureRecognizer *)recognizer{
    AILog(@"点击view222222");

}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    //    NSLog(@"pointInside----%@", [self class]);
//    return [super pointInside:point withEvent:event];
//}

@end
