//
//  AITriangleLayer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/19.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  三角形

#import "AITriangleLayer.h"
#import <UIKit/UIKit.h>

@interface AITriangleLayer ()
@property (strong, nonatomic) UIBezierPath *smallTrianglePath;
@property (strong, nonatomic) UIBezierPath *leftTrianglePath;
@property (strong, nonatomic) UIBezierPath *rightTrianglePath;
@property (strong, nonatomic) UIBezierPath *topTrianglePath;
@end

static UIColor* _color = nil;
static const CGFloat paddingSpace = 30.0;
@implementation AITriangleLayer


#pragma mark Initialization

+ (void)initialize{
    
    // Colors Initialization
    _color = [UIColor colorWithRed: 0.793 green: 0.2 blue: 0.757 alpha: 1];
    CGFloat colorHSBA[4];
    [_color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineCap = kCALineCapRound;
        self.lineJoin = kCALineJoinRound;
        self.lineWidth = 7.0;
        self.path       = self.smallTrianglePath.CGPath;
        // Color Declarations
        CGFloat colorHSBA[4];
        [_color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];
        UIColor* color3 = [UIColor colorWithHue: colorHSBA[0] saturation: 1 brightness: colorHSBA[2] alpha: colorHSBA[3]];
        //        [color3 setFill];
        [self setFillColor:color3.CGColor];
        self.strokeColor = color3.CGColor;
        
    }
    return self;
}

-(UIBezierPath *)smallTrianglePath{
    if (!_smallTrianglePath) {
        _smallTrianglePath = [UIBezierPath bezierPath];
        [_smallTrianglePath moveToPoint: CGPointMake(47.5, 11.5)];
        [_smallTrianglePath addLineToPoint: CGPointMake(20.5, 74.5)];
        [_smallTrianglePath addLineToPoint: CGPointMake(76.5, 74.5)];
        [_smallTrianglePath addLineToPoint: CGPointMake(47.5, 11.5)];
    }
    return _smallTrianglePath;
}

@end
