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

/** 是否折叠*/
@property(nonatomic,assign,getter=isFold)BOOL fold;

/** 折叠到的目的view*/
@property(nonatomic,weak)UIView *descView;
/**
 折叠元素数组
 */
@property(nonatomic,strong)NSMutableArray *itemArrayM;

@end
//折叠一个所需时间
const NSTimeInterval foldDuration = 0.5;

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
 一个折叠模块完成后回调

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
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(roatatedView.mas_bottom);
    }];
    
    AIFoldContainerViewState state  = AIFoldContainerViewState_None;
    if (index == 1) {
        self.fold      = YES;
        state          = AIFoldContainerViewState_finshFold;
        AILog(@"全部折叠完成");
    }else {
        state          = AIFoldContainerViewState_folding;
    }
    if (self.itemfinshBlock) {
        self.itemfinshBlock(index,state);
    }
    AILog(@"----%ld",index);
}

/**
 一个模块展开后回调

 @param roatatedView 折叠模块
 @param anim anim description
 @param flag flag description
 */
-(void)unfoldRotatedView:(AIFoldRotatedView *)roatatedView animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [roatatedView.layer removeAllAnimations];
//    [roatatedView removeFromSuperview];
    [self addSubview:roatatedView];
    roatatedView.ai_y = CGRectGetMaxY(self.descView.frame);
    
    NSInteger index   = [self.itemArrayM indexOfObject:roatatedView];
    if (index + 1 >= self.itemArrayM.count) {
        self.descView     = self.itemArrayM[index];
    }else {
        self.descView     = self.itemArrayM[index+1];
    }
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(roatatedView.mas_bottom);
    }];
    AIFoldContainerViewState state  = AIFoldContainerViewState_None;
    
    if (index == self.itemArrayM.count-1) {
        state             = AIFoldContainerViewState_finshUnfold;
        AILog(@"全部展开完成");
    }else {
        state             = AIFoldContainerViewState_unFolding;
    }
    if (self.itemfinshBlock) {
        self.itemfinshBlock(index,state);
    }
    AILog(@"====%ld",index);
}

#pragma mark public

/**
 配置折叠元素
 */
- (void)configurationFoldItem {
    for (int  i = 0; i < self.itemCount; i ++ ) {
        CGRect rect             = CGRectMake(0 , i * self.itemHeight, self.itemWidth, self.itemHeight);
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
    
    if (self.itemArrayM.count < 2) {//至少两个可折叠视图
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
    
    for (NSInteger i = 1;i < self.itemArrayM.count ;i++) {
        AIFoldRotatedView *lastView   = self.itemArrayM[i];
        lastView.layer.position       = CGPointMake(CGRectGetMidX(lastView.frame), lastView.ai_y + self.itemHeight);
        lastView.layer.anchorPoint    = CGPointMake(0.5, 0);
        [lastView unfoldingAnimationMI_PWithDuration:foldDuration delay:foldDuration * (i - 1)];
    }
}

@end
