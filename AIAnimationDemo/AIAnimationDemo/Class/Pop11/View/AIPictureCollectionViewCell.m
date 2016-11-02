//
//  AIPictureCollectionViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPictureCollectionViewCell.h"
CGFloat const gestureMinimumTranslation = 20.0;

typedef enum :NSInteger {
    kPictureMoveDirectionNone,
    kPictureMoveDirectionUp,
    kPictureMoveDirectionDown,
    kPictureMoveDirectionRight,
    kPictureMoveDirectionLeft
} PictureMoveDirection;
@interface AIPictureCollectionViewCell ()<UIGestureRecognizerDelegate>
/** 是否在运动*/
@property(assign,nonatomic,getter=isOnWindow)BOOL onWindow;
@property(assign,nonatomic)PictureMoveDirection direction;

/** 手势*/
@property(nonatomic,strong)UIPanGestureRecognizer *panGest;
/** 滑动手势*/
@property(nonatomic,strong)UISwipeGestureRecognizer *swipeGest;
/** 手势*/
@property(nonatomic,strong)UIGestureRecognizer *recognizer;
@end

@implementation AIPictureCollectionViewCell

#pragma mark --lazy
-(UIPanGestureRecognizer *)panGest{
    if (!_panGest) {
        //添加手势
        _panGest                              =  [[UIPanGestureRecognizer alloc]init];//[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handGesture:)];
        _panGest.delegate                     = self;
    }
    return _panGest;
}
-(UISwipeGestureRecognizer *)swipeGest{
    if (!_swipeGest) {
        _swipeGest                  = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGest:)];
        _swipeGest.direction        = UISwipeGestureRecognizerDirectionUp;
        _swipeGest.numberOfTouchesRequired  = 1;
        _swipeGest.delegate         = self;
    }
    return _swipeGest;
}
-(UIGestureRecognizer *)recognizer{
    if (!_recognizer) {
        _recognizer                 = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(recognizerAction)];
        _recognizer.delegate        = self;
    }
    return _recognizer;
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
        [self.contentView  addSubview:self.imageV];
        [self.imageV addGestureRecognizer:self.recognizer];
        [self.imageV addGestureRecognizer:self.panGest];
//        [self.imageV addGestureRecognizer:self.swipeGest];
//        self.panGest.enabled = NO;
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
    
    UIWindow *lastWindow      = [[UIApplication sharedApplication].windows lastObject];
    //--判断方向
    //到了拖拽手势
    CGPoint translation                = [recognizer translationInView:self.contentView];
    if (recognizer.state ==UIGestureRecognizerStateBegan)
    {
        self.direction = kPictureMoveDirectionNone;
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged && self.direction == kPictureMoveDirectionNone)
    {
        self.direction = [self determinePictureDirectionIfNeeded:translation];

        // ok, now initiate movement in the direction indicated by the user's gesture
        switch (self.direction) {
            case kPictureMoveDirectionDown:
//                NSLog(@"Start moving down");
            case kPictureMoveDirectionUp:
//                NSLog(@"Start moving up");
               
                break;
            case kPictureMoveDirectionRight:
                NSLog(@"Start moving right");
                break;
            case kPictureMoveDirectionLeft:
                NSLog(@"Start moving left");
                break;
            default:
                break;
        }
    }
    if (self.direction == kPictureMoveDirectionUp||
        self.direction == kPictureMoveDirectionDown) {
        //竖直滑动
        [self verticalActionWithRecognizer:recognizer];
    }

    
    
    //---end
    
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded ) {//松手的时候执行
        if (self.direction == kPictureMoveDirectionUp ||
            self.direction == kPictureMoveDirectionDown) {
            //返回最后的本地viewCenter的坐标
            CGPoint endPoint =  [self.contentView convertPoint:recognizer.view.center fromView:lastWindow];
            //判断距离
            if (endPoint.y < 0 && self.isOnWindow) {//发送出去
                
                [self sendImageRecognizer:recognizer];
                
            }else {//返回cell上
                [self backImageRecognizer:recognizer];
            }
        }
        self.onWindow = NO;
    }
}

-(void)swipeGest:(UISwipeGestureRecognizer*)swipe{
    AILog(@"竖直滑动");
//    self.swipeGest.enabled = NO;
//    self.panGest.enabled   = YES;
}
-(void)recognizerAction{
    
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
//        self.panGest.enabled   = NO;
//        self.swipeGest.enabled = YES;

    }];
}

/**
 返回图片

 @param recognizer 手势
 */
-(void)backImageRecognizer:(UIPanGestureRecognizer*)recognizer{
    AILog(@"返回");
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
//        self.panGest.enabled   = NO;
//        self.swipeGest.enabled = YES;
    }];
}

#pragma mark --UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    AILog(@"1----：%@",[gestureRecognizer class]);
//    AILog(@"2----：%@",[otherGestureRecognizer class]);
//    UIScrollViewPanGestureRecognizer *pan;
    return YES;
}

// This method will determine whether the direction of the user's swipe

/**
 判断pan手势的方向

 @param translation 移动的距离

 @return 方向
 */
- (PictureMoveDirection)determinePictureDirectionIfNeeded:(CGPoint)translation
{
    if (self.direction != kPictureMoveDirectionNone)
        return self.direction;
    // determine if horizontal swipe only if you meet some minimum velocity
    if (fabs(translation.x) > gestureMinimumTranslation)
    {
        BOOL gestureHorizontal = NO;
        if (translation.y ==0.0)
            gestureHorizontal = YES;
        else
            gestureHorizontal = (fabs(translation.x / translation.y) >5.0);
        if (gestureHorizontal)
        {
            if (translation.x >0.0)
                return kPictureMoveDirectionRight;
            else
                return kPictureMoveDirectionLeft;
        }
    }
    // determine if vertical swipe only if you meet some minimum velocity
    else if (fabs(translation.y) > gestureMinimumTranslation)
    {
        BOOL gestureVertical = NO;
        if (translation.x ==0.0)
            gestureVertical = YES;
        else
            gestureVertical = (fabs(translation.y / translation.x) >5.0);
        if (gestureVertical)
        {
            if (translation.y >0.0)
                return kPictureMoveDirectionDown;
            else
                return kPictureMoveDirectionUp;
        }
    }
    return self.direction;
}



@end









