//
//  AIFoldContainer View.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIFoldContainerView.h"
#import "UIView+AIExtension.h"
#import "AIFoldRotatedView.h"

@interface AIFoldContainerView ()

@property(nonatomic,assign)CGFloat itemHeight;
@property(nonatomic,assign)CGFloat itemWidth;

@end

@implementation AIFoldContainerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _itemCount = 1;
        UIView *contentView  = [[UIView alloc]init];
        self.contentView     = contentView;
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.top.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

/**
 配置折叠元素
 */
- (void)configurationFoldItem {
    CGFloat itemHeight          = 100;
    for (int  i = 0; i < self.itemCount; i ++ ) {
        CGRect rect             = CGRectMake(0 , i * itemHeight, KWidth, itemHeight);
        UIImage *image          = [self ai_takeSnapshotWithFrame:rect];
        AIFoldRotatedView *rotatedView = [[AIFoldRotatedView alloc]initWithFrame:rect Image:image];
        [self addSubview:rotatedView];
    }
    for (UIView *itemView in self.subviews) {
        if ([itemView isKindOfClass:[AIFoldRotatedView class]]) {
            itemView.layer.anchorPoint  = CGPointMake(0.5, 0.);
            itemView.layer.transform    = CATransform3DIdentity;
            itemView.layer.transform    = [self transform3d];
            itemView.layer.position     = CGPointMake(CGRectGetMidX(itemView.frame), itemView.layer.position.y - itemHeight *.5);
        }
    }
    self.contentView.alpha                  = 0.;
}
//- (CAShapeLayer *)maskWithRect:(CGRect)rect {
//    CAShapeLayer *layerMask = [CAShapeLayer layer];
//    UIRectCorner corners    =  12;
//    
//    layerMask.path = [UIBezierPath bezierPathWithRoundedRect:rect
//                                           byRoundingCorners:corners
//                                                 cornerRadii:CGSizeMake(5, 5)].CGPath;
//    return layerMask;
//}
- (CATransform3D)transform3d {
    CATransform3D transform     = CATransform3DIdentity;
    transform.m34               = 2.5 / -2000;
    CATransform3D transform3d   = CATransform3DRotate(transform, M_PI_4, 1., 0., 0.);
    return transform3d;
}
#pragma mark public


@end
