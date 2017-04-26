//
//  AIDoodleViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/4/17.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDoodleViewController.h"

@interface AIDoodleViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIBezierPath *path;
/** shaplayer*/
@property(nonatomic,strong)CAShapeLayer *shapeLayer;
@end

@implementation AIDoodleViewController

-(UIBezierPath *)path {
    if (!_path) {
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}
-(CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *pan     = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(onPan:)];
    pan.delegate                    = self;
    
    [self.view addGestureRecognizer:pan];
}


-(void)onPan:(UIPanGestureRecognizer *)pan {
   CGPoint point = [pan locationInView:pan.view];
    [self.path addLineToPoint:point];
    self.shapeLayer.path              = self.path.CGPath;
    [self.view.layer addSublayer:self.shapeLayer];
}

#pragma mark -UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationInView:self.view];
    [self.path moveToPoint:point];
    return YES;
}

@end
