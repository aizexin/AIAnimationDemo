//
//  AIFoldContainer View.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ItemFinshBlock)(void);

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
@end
