//
//  AIFoldRotatedView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIFoldRotatedView.h"
#import "UIImage+ImageEffects.h"
@interface AIFoldRotatedView ()

@property(nonatomic,weak)UIImageView *backView;
@property(nonatomic,weak)UIImageView *faceView;
@end
@implementation AIFoldRotatedView

- (instancetype)initWithRect:(CGRect)rect Image:(UIImage *)image
{
    self = [super initWithFrame:rect];
    if (self) {
        UIImageView *faceImageView   = [[UIImageView alloc]initWithFrame:self.bounds];
        self.faceView                = faceImageView;
        faceImageView.image          = image;
//        faceImageView.layer.anchorPoint  = CGPointMake(0.5, 0.);
////        faceImageView.layer.transform    = [self transform3d];
//        faceImageView.layer.mask         = [self maskWithRect:rect];
//        faceImageView.layer.position     = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
        faceImageView.contentMode        = UIViewContentModeScaleAspectFill;
        
        [self addBackViewWithImage:image];
        [self.backView addSubview:faceImageView];
        
        [faceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(0);
            make.top.bottom.mas_equalTo(0);
        }];
    }
    return self;
}


- (void)addBackViewWithImage:(UIImage*)image {
    UIImageView *view        = [[UIImageView alloc]init];
    view.image               = [image blurImage];
//    view.layer.anchorPoint   = CGPointMake(0.5, 1.);
//    view.layer.transform     = [self transform3d];
    self.backView            = view;
    view.translatesAutoresizingMaskIntoConstraints  = NO;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
    }];
}



@end
