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

@interface AIFoldContainerView ()<AIFoldRotatedViewDelegate>

@property(nonatomic,assign)CGFloat itemHeight;
@property(nonatomic,assign)CGFloat itemWidth;

/** 折叠到的目的view*/
@property(nonatomic,weak)UIView *descView;
/**
 折叠元素数组
 */
@property(nonatomic,strong)NSMutableArray *itemArrayM;

@end

@implementation AIFoldContainerView

#pragma mark private

#pragma mark -lazy
-(NSMutableArray *)itemArrayM {
    if (!_itemArrayM) {
        _itemArrayM  = [NSMutableArray array];
    }
    return _itemArrayM;
}

#pragma mark -lifecycle
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

-(void)layoutSubviews {
    [super layoutSubviews];
    self.itemHeight = self.ai_height / self.itemCount;
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
#pragma mark -AIFoldRotatedViewDelegate
-(void)foldRotatedView:(AIFoldRotatedView *)roatatedView animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    NSInteger index    = [self.itemArrayM indexOfObject:roatatedView];
    if (index > 1) {
        self.descView      = self.itemArrayM[index-1];
        roatatedView.frame = self.descView.frame;
        [self.descView addSubview:roatatedView];
    }
    AILog(@"----%ld",index);
}


#pragma mark public
/**
 配置折叠元素
 */
- (void)configurationFoldItem {
    CGFloat itemHeight          = 100;
    for (int  i = 0; i < self.itemCount; i ++ ) {
        CGRect rect             = CGRectMake(0 , i * itemHeight, KWidth, itemHeight);
        UIImage *image          = [self ai_takeSnapshotWithFrame:rect];
        AIFoldRotatedView *rotatedView      = [[AIFoldRotatedView alloc]initWithFrame:rect Image:image];
        rotatedView.delegate    = self;
        [self addSubview:rotatedView];
        //添加到可折叠数组中
        [self.itemArrayM addObject:rotatedView];
    }
    self.contentView.alpha                  = 0.;
}

/**
 开始折叠
 */
- (void)showFold {
    //背景问题
    //翻转完成后要加到上一个view的上面
    //最后一个不翻转
    
    if (self.itemArrayM.count < 2) {//至少两个可折叠视图
        return;
    }
    
    
    for (NSInteger i = self.itemArrayM.count - 1; i > 0; i--) {
        AIFoldRotatedView *lastView   = self.itemArrayM[i];
        
        lastView.layer.position       = CGPointMake(CGRectGetMidX(lastView.frame), lastView.layer.position.y - self.itemHeight *.5);
        lastView.layer.anchorPoint    = CGPointMake(.5, 0);
        [lastView foldingAnimationMI_PWithDuration:2. delay:2. * (_itemCount -i)];
    }
}

@end
