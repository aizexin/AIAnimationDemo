//
//  AIFoldContainer View.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIFoldContainerView : UIView
/** 折叠个数*/
@property(nonatomic,assign)NSInteger itemCount;
/** 容器*/
@property(nonatomic,weak)UIView *contentView;
/**
 配置折叠元素
 */
- (void)configurationFoldItem ;
@end
