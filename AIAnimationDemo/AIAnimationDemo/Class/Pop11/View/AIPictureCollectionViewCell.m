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
/** 手势*/
@property(nonatomic,strong)UIPanGestureRecognizer *panGest;
@end

@implementation AIPictureCollectionViewCell

#pragma mark --lazy
-(UIPanGestureRecognizer *)panGest{
    if (!_panGest) {
        //添加手势
        _panGest                              =  [[UIPanGestureRecognizer alloc]init];//[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handGesture:)];
        self.panGest                          = _panGest;
        
        
    }
    return _panGest;
}
-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV                           = [[UIImageView alloc]init];
        _imageV.userInteractionEnabled    = YES;
    }
    return _imageV;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.imageV addGestureRecognizer:self.panGest];
        [self.contentView  addSubview:self.imageV];
        [[self.panGest rac_gestureSignal]subscribeNext:^(UIPanGestureRecognizer *recognizer) {
            [self handGesture:recognizer];
        }];
    }
    return self;
}

-(void)layoutSubviews{
    self.imageV.frame = self.bounds;
}


#pragma mark ---Action
-(void)handGesture:(UIPanGestureRecognizer*)recognizer{
    AILog(@"--handGesture--");
    
    UIWindow *lastWindow      = [[UIApplication sharedApplication].windows lastObject];
    //手势移动了多远
    CGPoint translation       = [recognizer translationInView:self.contentView];
     
    self.horizonting          = fabs(translation.x) > fabs(translation.y);
    if (!self.isOnWindow && self.isHorizonting) {
        //横向滑动
        [self horizontingActionWithRecognizer:recognizer];
    }else if(fabs(translation.y)>5){
        //竖直滑动
        [self verticalActionWithRecognizer:recognizer];
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.contentView];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {//松手的时候执行
        //返回最后的本地viewCenter的坐标
        CGPoint endPoint =  [self.contentView convertPoint:recognizer.view.center fromView:lastWindow];
        //判断距离
        if (endPoint.y < 0) {//发送出去
           
            [self sendImageRecognizer:recognizer];
            
        }else{//返回cell上
            [self backImageRecognizer:recognizer];
        }
        self.onWindow = NO;
    }
}

/**
 横向滑动

 @param recognizer 手势
 */
-(void)horizontingActionWithRecognizer:(UIPanGestureRecognizer*)recognizer{
    self.horizonting  = YES;
    //手势移动了多远
    CGPoint translation       = [recognizer translationInView:self.contentView];
    //将响应事件传到下一个
    if (self.delegate && [self.delegate respondsToSelector:@selector(pictureCollection:didTranslationPoint:)]) {
        [self.delegate pictureCollection:self didTranslationPoint:translation];
    }
}

/**
 竖直滑动

 @param recognizer 手势
 */
-(void)verticalActionWithRecognizer:(UIPanGestureRecognizer*)recognizer{
    CGPoint cellCenterPoint   = CGPointZero;
    CGPoint worldCenterPoint  = CGPointZero;
    //手势移动了多远
    CGPoint translation       = [recognizer translationInView:self.contentView];
    UIWindow *lastWindow      = [[UIApplication sharedApplication].windows lastObject];
    //        AILog(@"竖直移动");
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
    self.onWindow               = YES;
}

/**
 发送图片

 @param recognizer 手势
 */
-(void)sendImageRecognizer:(UIPanGestureRecognizer*)recognizer{
    AILog(@"发出去");
    UIImageView *imageV = (UIImageView*)recognizer.view;
    if (self.delegate && [self.delegate respondsToSelector:@selector(pictureCollection:didGestureSelectedImage:andImageWorldRect:)]) {
        [self.delegate pictureCollection:self didGestureSelectedImage:imageV.image andImageWorldRect:recognizer.view.frame];
    }
    //TODO这个时候一样要返回到cell上但是动画不同
    [self.contentView addSubview:recognizer.view];
    [UIView animateWithDuration:.3 animations:^{
        recognizer.view.frame = self.bounds;
    } completion:^(BOOL finished) {
        
    }];
}

/**
 返回图片

 @param recognizer 手势
 */
-(void)backImageRecognizer:(UIPanGestureRecognizer*)recognizer{
    AILog(@"返回");
    UIWindow *lastWindow      = [[UIApplication sharedApplication].windows lastObject];
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

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    __block UIView *returnView = [super hitTest:point withEvent:event];
//    [[self.panGest rac_gestureSignal]subscribeNext:^(UIPanGestureRecognizer *recognizer) {
//        UIWindow *lastWindow      = [[UIApplication sharedApplication].windows lastObject];
//        //手势移动了多远
//        CGPoint translation       = [recognizer translationInView:self.contentView];
//        
//        self.horizonting          = fabs(translation.x) > fabs(translation.y);
//        if (!self.isOnWindow && self.isHorizonting) {
//            //横向滑动
//            returnView  = self.superview;
////            [self horizontingActionWithRecognizer:recognizer];
//        }else if(fabs(translation.y)>5){
//            //竖直滑动
//            returnView = [super hitTest:point withEvent:event];
//            [self verticalActionWithRecognizer:recognizer];
//        }
//        [recognizer setTranslation:CGPointMake(0, 0) inView:self.contentView];
//        
//        if (recognizer.state == UIGestureRecognizerStateEnded) {//松手的时候执行
//            //返回最后的本地viewCenter的坐标
//            CGPoint endPoint =  [self.contentView convertPoint:recognizer.view.center fromView:lastWindow];
//            //判断距离
//            if (endPoint.y < 0) {//发送出去
//                
//                [self sendImageRecognizer:recognizer];
//                
//            }else{//返回cell上
//                [self backImageRecognizer:recognizer];
//            }
//            self.onWindow = NO;
//        }
//    }];
//    return returnView;
//
//}


@end









