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
/** 滑动手势*/
@property(nonatomic,strong)UISwipeGestureRecognizer *swipeGest;
@end

@implementation AIPictureCollectionViewCell

#pragma mark --lazy
-(UIPanGestureRecognizer *)panGest{
    if (!_panGest) {
        //添加手势
        _panGest                              =  [[UIPanGestureRecognizer alloc]init];//[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handGesture:)];
    }
    return _panGest;
}
-(UISwipeGestureRecognizer *)swipeGest{
    if (!_swipeGest) {
        _swipeGest                  = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGest:)];
        _swipeGest.direction        = UISwipeGestureRecognizerDirectionUp;
        _swipeGest.numberOfTouchesRequired  = 1;
    }
    return _swipeGest;
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
//        [self.imageV addGestureRecognizer:self.panGest];
        [self.contentView  addSubview:self.imageV];
        [self.imageV addGestureRecognizer:self.swipeGest];
        
//        [[self.panGest rac_gestureSignal]subscribeNext:^(UIPanGestureRecognizer *recognizer) {
//            [self handGesture:recognizer];
//        }];
    }
    return self;
}

-(void)layoutSubviews{
    self.imageV.frame = self.bounds;
}


#pragma mark ---Action
-(void)handGesture:(UIPanGestureRecognizer*)recognizer{
    
    UIWindow *lastWindow      = [[UIApplication sharedApplication].windows lastObject];
    
    //竖直滑动
    [self verticalActionWithRecognizer:recognizer];
    
    if (recognizer.state == UIGestureRecognizerStateEnded ) {//松手的时候执行
        //返回最后的本地viewCenter的坐标
        CGPoint endPoint =  [self.contentView convertPoint:recognizer.view.center fromView:lastWindow];
        //判断距离
        if (endPoint.y < 0 && self.isOnWindow) {//发送出去
           
            [self sendImageRecognizer:recognizer];
            
        }else {//返回cell上
            [self backImageRecognizer:recognizer];
        }
        self.onWindow = NO;
    }
}

-(void)swipeGest:(UISwipeGestureRecognizer*)swipe{
    AILog(@"竖直滑动");
    //再添加拖拽手势
    [self.imageV addGestureRecognizer:self.panGest];
//    拖拽手势失败再执行滑动手势
//    [self.swipeGest requireGestureRecognizerToFail:self.panGest];
    [[self.panGest rac_gestureSignal]subscribeNext:^(id  _Nullable x) {
        //竖直滑动
        [self handGesture:x];
    }];
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
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.contentView];
}

/**
 发送图片

 @param recognizer 手势
 */
-(void)sendImageRecognizer:(UIPanGestureRecognizer*)recognizer{
    AILog(@"发出去");
    UIImageView *imageV = (UIImageView*)recognizer.view;
    __weak typeof(self) weakSelf = self;
    if (self.delegate && [self.delegate respondsToSelector:@selector(pictureCollection:didGestureSelectedImage:andImageWorldRect:)]) {
        [self.delegate pictureCollection:self didGestureSelectedImage:imageV.image andImageWorldRect:recognizer.view.frame];
    }
    //TODO这个时候一样要返回到cell上但是动画不同
    [self.contentView addSubview:imageV];
    [UIView animateWithDuration:.3 animations:^{
        imageV.frame = weakSelf.bounds;
    } completion:^(BOOL finished) {
        //移除拖拽手势
        [weakSelf.imageV removeGestureRecognizer:weakSelf.panGest];
        self.panGest = nil;
    }];
}

/**
 返回图片

 @param recognizer 手势
 */
-(void)backImageRecognizer:(UIPanGestureRecognizer*)recognizer{
    AILog(@"返回");
    AILog(@"--%@",NSStringFromCGRect(recognizer.view.frame));
    __weak typeof(self) weakSelf = self;
    UIWindow *lastWindow      = [[UIApplication sharedApplication].windows lastObject];
    //添加动画
    CGRect worldOrginalRect              = [self.contentView convertRect:self.bounds toView:lastWindow];
    //            一开始要记下frame，动画在window上做，完成后再加到contentView上
    [UIView animateWithDuration:.5 animations:^{
        recognizer.view.frame = worldOrginalRect;
    } completion:^(BOOL finished) {
        [weakSelf.contentView addSubview:recognizer.view];
        recognizer.view.frame =  self.bounds;
        //移除拖拽手势
        [weakSelf.imageV removeGestureRecognizer:self.panGest];
        self.panGest = nil;
    }];
}


@end









