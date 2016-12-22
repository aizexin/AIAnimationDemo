//
//  AIIrregularityView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/22.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIIrregularityView.h"

@interface AIIrregularityView ()

/**
 图片
 */
@property(nonatomic,strong)CALayer *imageLayer;
/** 遮罩*/
@property(nonatomic,strong)CAShapeLayer *maskLayer;
/** 边缘*/
@property(nonatomic,strong)CAShapeLayer *shapeLayer;
@end

@implementation AIIrregularityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图片
        self.imageLayer             = [[CALayer alloc]init];
        //遮罩
        CAShapeLayer *maskLayer     = [[CAShapeLayer alloc]init];
        self.maskLayer              = maskLayer;
        //图形
        self.shapeLayer    = [[CAShapeLayer alloc]init];
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageLayer.frame = self.bounds;
//    self.maskLayer.path   = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
}

-(void)didMoveToWindow {
    [super didMoveToWindow];
    [self.layer addSublayer:self.imageLayer];
//    self.imageLayer.mask = self.maskLayer;
    self.layer.mask      = self.maskLayer;
//    [self.layer addSublayer:self.shapeLayer];
}

//判断点是否在响应范围
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden == NO && self.shapePath) {
        
        if ( [self.shapePath containsPoint:point] ) {
            return YES;
        }
        return NO;
    }else {
        return [super pointInside:point withEvent:event];
    }
}

#pragma mark --public
-(void)setImage:(UIImage *)image {
    _image = image;
    self.imageLayer.contents = (__bridge id _Nullable)(image.CGImage);
}
-(void)setShapePath:(UIBezierPath *)shapePath {
    _shapePath = shapePath;
    self.maskLayer.path   = shapePath.CGPath;
    self.shapePath.CGPath = shapePath.CGPath;
}

@end
