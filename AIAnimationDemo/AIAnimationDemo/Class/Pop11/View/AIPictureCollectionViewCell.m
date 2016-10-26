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
    UIWindow *lastWindow = [[UIApplication sharedApplication].windows lastObject];
    //手势移动了多远
    CGPoint translation       = [recognizer translationInView:self.contentView];
    CGPoint cellCenterPoint   = CGPointMake(recognizer.view.center.x,
                                            translation.y + recognizer.view.center.y);
    //转回原来的坐标   不是第一次的时候
    if (self.isOnWindow) {
        cellCenterPoint         = [self.contentView convertPoint:cellCenterPoint fromView:lastWindow];
    }
    [lastWindow addSubview:recognizer.view];
    //转换为世界坐标
    CGPoint worldCenterPoint = [self.contentView convertPoint:cellCenterPoint toView:lastWindow];
    recognizer.view.center    = worldCenterPoint;
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.contentView];
    self.onWindow = YES;
    if (recognizer.state == UIGestureRecognizerStateEnded) {//松手的时候执行
        //获得加速度
        CGPoint velocity = [recognizer velocityInView:self];
        //添加pop动画
        POPDecayAnimation *decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        decayAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        [recognizer.view.layer pop_addAnimation:decayAnimation forKey:nil];
    }
    
    
}


@end









