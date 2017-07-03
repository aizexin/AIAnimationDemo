//
//  AIFoldRotatedView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIFoldRotatedView.h"

@interface AIFoldRotatedView ()

@property(nonatomic,weak)AIFoldRotatedView *backView;
@end
@implementation AIFoldRotatedView

- (void)addBackViewWithHeight:(CGFloat)height backgroundColor:(UIColor*)color {
    AIFoldRotatedView *view  = [[AIFoldRotatedView alloc]init];
    view.backgroundColor     = color;
    view.layer.anchorPoint   = CGPointMake(0.5, 1.);
    view.layer.transform     = [self transform3d];
    self.backView            = view;
    view.translatesAutoresizingMaskIntoConstraints  = NO;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.top.mas_equalTo(-height*0.5);
        make.height.mas_equalTo(height);
    }];
}

- (CATransform3D)transform3d {
    CATransform3D transform     = CATransform3DIdentity;
    transform.m34               = 2.5 / -2000;
    return transform;
}

@end
