//
//  AIAnimationMaskLabel.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/23.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIAnimationMaskLabel.h"

@interface AIAnimationMaskLabel ()

@property(nonatomic,strong)CAGradientLayer *gradientLayer;
/** 文字*/
@property(nonatomic,strong)NSDictionary *textAttributes;
@property(nonatomic,copy)NSString *text;
@end
@implementation AIAnimationMaskLabel

-(CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.startPoint    = CGPointMake(0., .5);
        _gradientLayer.endPoint      = CGPointMake(1., .5);
        
        NSArray *colors    =  @[
                               (__bridge id)[UIColor blackColor].CGColor,
                               (__bridge id)[UIColor whiteColor].CGColor,
                               (__bridge id)[UIColor blackColor].CGColor
                               ];
        _gradientLayer.colors        = colors;
        
        NSArray *locations = @[@.25,@.5,@.75];
        _gradientLayer.locations     = locations;
    }
    return _gradientLayer;
}
-(void)setText:(NSString *)text {
    [self setNeedsDisplay];
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    [_text drawInRect:self.bounds withAttributes:self.textAttributes];
    UIGraphicsEndImageContext();
    
    CALayer *maskLayer      = [CALayer layer];
    maskLayer.backgroundColor   = [UIColor clearColor].CGColor;
//    maskLayer
}

-(NSDictionary *)textAttributes {
    if (!_textAttributes) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
        style.alignment                = NSTextAlignmentCenter;
        _textAttributes             = @
        {NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Thin" size:28.0],
            NSParagraphStyleAttributeName:style};
    }
    return _textAttributes;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        UIImage *image = UIGraphicsBeginImageContextWithOptions(<#CGSize size#>, <#BOOL opaque#>, <#CGFloat scale#>)
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}
-(void)didMoveToWindow {
    [super didMoveToWindow];
    [self.layer addSublayer:self.gradientLayer];
    CABasicAnimation *gradientAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    gradientAnimation.fromValue         = @[@0.0, @0.0, @0.25];
    gradientAnimation.toValue           = @[@.75,@1.,@1.];
    gradientAnimation.duration          = 3.;
    gradientAnimation.repeatCount       = INFINITY;
    [self.gradientLayer addAnimation:gradientAnimation forKey:nil];
}

@end
