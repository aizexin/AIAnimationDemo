//
//  AIPictureCollectionViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPictureCollectionViewCell.h"


@interface AIPictureCollectionViewCell ()
/** 是否在运动*/
@property(assign,nonatomic,getter=isOnWindow)BOOL onWindow;

/**
 是否是水平
 */
@property(assign,nonatomic,getter=isHorizonting)BOOL horizonting;
/**
 一半距离
 */
@property(assign,nonatomic)CGFloat halfHight;
@end

@implementation AIPictureCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV                           = [[UIImageView alloc]init];
        self.imageV.userInteractionEnabled    = YES;
        //添加手势
        UIPanGestureRecognizer *panGest       =  [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handGesture:)];
//        [[panGest rac_gestureSignal]subscribeNext:^(id  _Nullable x) {
//            [self handGesture:x];
//        }];
        [self.imageV addGestureRecognizer:panGest];
        [self.contentView  addSubview:self.imageV];
    }
    return self;
}

-(void)layoutSubviews{
    self.imageV.frame = self.bounds;
}


#pragma mark ---Action
-(void)handGesture:(UIPanGestureRecognizer*)recognizer{
    UIWindow *lastWindow      = [[UIApplication sharedApplication].windows lastObject];
    CGPoint cellCenterPoint   = CGPointZero;
    CGPoint worldCenterPoint  = CGPointZero;
    //手势移动了多远
    CGPoint translation       = [recognizer translationInView:self.contentView];
     AILog(@"--translation--%@",NSStringFromCGPoint(translation));
    self.horizonting          = fabs(translation.x) > fabs(translation.y);
    if ( !self.isOnWindow && self.isHorizonting) {
        AILog(@"横向移动");
        self.horizonting  = YES;
        //将响应事件传到下一个
        if (self.delegate && [self.delegate respondsToSelector:@selector(pictureCollection:didTranslationPoint:)]) {
            [self.delegate pictureCollection:self didTranslationPoint:translation];
        }
    }else {
        AILog(@"竖直移动");
        cellCenterPoint   = CGPointMake(recognizer.view.center.x,
                                                translation.y + recognizer.view.center.y);
        //转回原来的坐标   不是第一次的时候
        if (self.isOnWindow) {
            cellCenterPoint         = [self.contentView convertPoint:cellCenterPoint fromView:lastWindow];
        }
        [lastWindow addSubview:recognizer.view];
        //转换为世界坐标
        worldCenterPoint            = [self.contentView convertPoint:cellCenterPoint toView:lastWindow];
        recognizer.view.center      = worldCenterPoint;
        [recognizer setTranslation:CGPointMake(0, 0) inView:self.contentView];
        self.onWindow               = YES;
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {//松手的时候执行
        //返回最后的本地viewCenter的坐标
        CGPoint endPoint =  [self.contentView convertPoint:recognizer.view.center fromView:lastWindow];
        AILog(@"--endpoint--%@",NSStringFromCGPoint(endPoint));
        //判断距离
        if (endPoint.y < 0) {//发送出去
           
            AILog(@"发出去");
            UIImageView *imageV = (UIImageView*)recognizer.view;
            if (self.delegate && [self.delegate respondsToSelector:@selector(pictureCollection:didGestureSelectedImage:andImageWorldRect:)]) {
                [self.delegate pictureCollection:self didGestureSelectedImage:imageV.image andImageWorldRect:recognizer.view.frame];
            }
            //TODO这个时候一样要返回到cell上但是动画不同
            [self.contentView addSubview:recognizer.view];
            recognizer.view.frame =  self.bounds;
            
        }else{//返回cell上
            AILog(@"返回");
            //添加动画
            CGRect worldOrginalRect              = [self.contentView convertRect:self.bounds toView:lastWindow];
//            一开始要记下frame，动画在window上做，完成后再加到contentView上
            [UIView animateWithDuration:.5 animations:^{
                recognizer.view.frame = worldOrginalRect;
            } completion:^(BOOL finished) {
                [self.contentView addSubview:recognizer.view];
                recognizer.view.frame =  self.bounds;
            }];
        }
        self.onWindow = NO;
    }
}


@end









