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
@property(nonatomic,copy)IBInspectable NSString *text;

@end
@implementation AIAnimationMaskLabel

-(CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.startPoint    = CGPointMake(0., .5);
        _gradientLayer.endPoint      = CGPointMake(1., .5);
        
        NSArray *colors    =  @[
                               (__bridge id)[UIColor yellowColor].CGColor,
                               (__bridge id)[UIColor greenColor].CGColor,
                               (__bridge id)[UIColor orangeColor].CGColor,
                               (__bridge id)[UIColor cyanColor].CGColor,
                               (__bridge id)[UIColor redColor].CGColor,
                               (__bridge id)[UIColor yellowColor].CGColor
                               ];
        _gradientLayer.colors        = colors;
        
        NSArray *locations = @[@0.65, @0.8, @0.85, @0.9, @0.95,@1.];
        _gradientLayer.locations     = locations;
    }
    return _gradientLayer;
}
-(void)setText:(NSString *)text {
    _text = text;
    [self setNeedsDisplay];
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    [_text drawInRect:self.bounds withAttributes:self.textAttributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

//    UIImageView *imageView  = [[UIImageView alloc]init];
//    imageView.image         = image;
//    imageView.frame         = self.bounds;
//    [self addSubview:imageView];
    
    CALayer *maskLayer      = [CALayer layer];
    maskLayer.backgroundColor   = [UIColor clearColor].CGColor;
    maskLayer.frame         = CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
    maskLayer.contents      = (__bridge id _Nullable)(image.CGImage);
    
    self.gradientLayer.mask = maskLayer;
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

-(void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = CGRectMake(-self.bounds.size.width,
                                          self.bounds.origin.y,
                                          3 * self.bounds.size.width,
                                          self.bounds.size.height);
}
-(void)didMoveToWindow {
    [super didMoveToWindow];
    
    [self.layer addSublayer:self.gradientLayer];
    CABasicAnimation *gradientAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    gradientAnimation.fromValue         = @[@0.0, @0.0,@0.0, @0.0,@0.0, @0.0, @0.25];
    gradientAnimation.toValue           = @[@0.65, @0.8, @0.85, @0.9, @0.95,@1.];
    gradientAnimation.duration          = 3.;
    gradientAnimation.repeatCount       = INFINITY;
    [self.gradientLayer addAnimation:gradientAnimation forKey:nil];
}

@end
