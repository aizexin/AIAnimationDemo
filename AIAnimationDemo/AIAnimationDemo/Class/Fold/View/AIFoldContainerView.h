//
//  AIFoldContainer View.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AIFoldContainerViewState_None,     // 无状态
    AIFoldContainerViewState_folding, //折叠中
    AIFoldContainerViewState_unFolding, //展开中
    AIFoldContainerViewState_finshFold, //完成折叠
    AIFoldContainerViewState_finshUnfold //完成展开
} AIFoldContainerViewState;

typedef void(^ItemFinshBlock)(NSInteger index ,AIFoldContainerViewState state);

@interface AIFoldContainerView : UIView
/** 折叠个数*/
@property(nonatomic,assign)NSInteger itemCount;
/** 折叠元素的宽度 */
@property(nonatomic,assign)CGFloat itemWidth;
/** 折叠元素的高度 */
@property(nonatomic,assign)CGFloat itemHeight;
/**单个item折叠完成的block */
@property(nonatomic,copy)ItemFinshBlock itemfinshBlock;
/** 容器*/
@property(nonatomic,weak)UIView *contentView;
/**
 配置折叠元素
 */
- (void)configurationFoldItem ;
/**
 开始折叠
 */
- (void)showFold;
/**
 开始展开
 */
- (void)showunFold;
@end
