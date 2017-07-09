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

///** 是否折叠*/
//@property(nonatomic,assign,getter=isFold)BOOL fold;

/** 折叠到的目的view*/
@property(nonatomic,weak)UIView *descView;
/**
 折叠元素数组
 */
@property(nonatomic,strong)NSMutableArray *itemArrayM;

/**
 展开时候的frame数组
 */
@property(nonatomic,strong)NSMutableArray *unfoldArrayM;
/** 当前状态*/
@property(nonatomic,assign)AIFoldContainerViewState currentState;

@end
//折叠一个所需时间
const NSTimeInterval foldDuration = 0.5;
//展开一个所需时间
const NSTimeInterval unfoldDuration = 0.5;

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
        _itemWidth = KWidth;
        UIView *contentView  = [[UIView alloc]init];
        self.contentView     = contentView;
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.top.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

#pragma mark -AIFoldRotatedViewDelegate

/**
 一个叠完成后回调

 @param roatatedView 折叠视图
 @param anim anim description
 @param flag flag description
 */
-(void)foldRotatedView:(AIFoldRotatedView *)roatatedView animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    [roatatedView.layer removeAllAnimations];
    NSInteger index    = [self.itemArrayM indexOfObject:roatatedView];
    self.descView      = self.itemArrayM[index-1];
    roatatedView.frame = self.descView.bounds;
    [self.descView addSubview:roatatedView];

}
/**
 一个将要展开回调
 
 @param roatatedView 折叠模块
 
 */
-(void)willUnfoldRotatedView:(AIFoldRotatedView *)roatatedView {
    
    NSInteger index    = [self.itemArrayM indexOfObject:roatatedView];
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo((index+1) * self.itemHeight);
    }];
    
    if (index == self.itemArrayM.count-1) {
        self.currentState             = AIFoldContainerViewState_finshUnfold;
        AILog(@"全部展开完成");
    }else {
        self.currentState             = AIFoldContainerViewState_unFolding;
    }
    if (self.itemfinshBlock) {
        self.itemfinshBlock(unfoldDuration,self.currentState);
    }
}

/**
 一个展开完成后回调
 
 @param roatatedView 折叠视图
 @param anim anim description
 @param flag flag description
 */
- (void)unfoldRotatedView:(AIFoldRotatedView *)roatatedView animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSInteger index    = [self.itemArrayM indexOfObject:roatatedView];
    
    NSValue *value     =  self.unfoldArrayM[index] ;
    roatatedView.frame = [value CGRectValue];
    [self addSubview:roatatedView];
    
    [roatatedView.layer removeAllAnimations];
}


/**
 一个将要折叠回调
 
 @param roatatedView 折叠模块
 
 */
-(void)willfoldRotatedView:(AIFoldRotatedView *)roatatedView {
    
    NSInteger index    = [self.itemArrayM indexOfObject:roatatedView];
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo((index) * self.itemHeight);
    }];
    if (index == 1) {
        self.currentState          = AIFoldContainerViewState_finshFold;
        AILog(@"全部折叠完成");
    }else {
        self.currentState          = AIFoldContainerViewState_folding;
    }
    if (self.itemfinshBlock) {
        self.itemfinshBlock(foldDuration,self.currentState);
    }
}

#pragma mark public

/**
 配置折叠元素
 */
- (void)configurationFoldItem {
    self.unfoldArrayM           = [NSMutableArray arrayWithCapacity:self.itemCount];
    for (int  i = 0; i < self.itemCount; i ++ ) {
        CGRect rect             = CGRectMake(0 , i * self.itemHeight, self.itemWidth, self.itemHeight);
        UIImage *image          = [self ai_takeSnapshotWithFrame:rect];
        AIFoldRotatedView *rotatedView      = [[AIFoldRotatedView alloc]initWithFrame:rect Image:image];
//        rotatedView.layer.anchorPoint    = CGPointMake(.5, 0);
        //测试
        rotatedView.tag         = i+100;
        rotatedView.delegate    = self;
        [self addSubview:rotatedView];
        //添加到可折叠数组中
        [self.itemArrayM addObject:rotatedView];
        //保存到展开数组中
        [self.unfoldArrayM addObject:[NSValue valueWithCGRect:rect]];
    }
    self.contentView.alpha                  = 0.;
}

/**
 开始折叠
 */
- (void)showFold {
    
    if (self.itemArrayM.count < 2) {//至少两个可折叠视图
        return;
    }
    if (self.currentState != AIFoldContainerViewState_finshUnfold &&
        self.currentState != AIFoldContainerViewState_None) {
        //只有在折叠完成和无状态的情况下才能折叠
        return;
    }
    
    for (NSInteger i = self.itemArrayM.count - 1; i > 0; i--) {
        AIFoldRotatedView *lastView   = self.itemArrayM[i];
        
        lastView.layer.position       = CGPointMake(CGRectGetMidX(lastView.frame), lastView.ai_y );
        lastView.layer.anchorPoint    = CGPointMake(.5, 0);
        [lastView foldingAnimationMI_PWithDuration:foldDuration delay:foldDuration * (_itemCount -i)];
    }
}

/**
 开始展开
 */
- (void)showunFold {
    if (self.itemArrayM.count < 2) {//至少两个可折叠视图
        return;
    }
    if (self.currentState != AIFoldContainerViewState_finshFold &&
        self.currentState != AIFoldContainerViewState_None) {
        //只有在展开完成和无状态的情况下才能折叠
        return;
    }
    
    for (NSInteger i = 1;i < self.itemArrayM.count ;i++) {
    
        AIFoldRotatedView *lastView   = self.itemArrayM[i];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(unfoldDuration *(i-1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            lastView.layer.position       = CGPointMake(CGRectGetMidX(lastView.frame),self.itemHeight +lastView.ai_y );
            lastView.layer.anchorPoint    = CGPointMake(0.5, 0);
        });
        [lastView unfoldingAnimationMI_PWithDuration:foldDuration delay:unfoldDuration * (i - 1)];
    }
}

@end
