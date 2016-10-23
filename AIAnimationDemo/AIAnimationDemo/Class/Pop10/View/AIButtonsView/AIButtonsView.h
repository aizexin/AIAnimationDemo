//
//  AIButtonsView.h
//  按钮viewDemo
//
//  Created by 艾泽鑫 on 16/9/22.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIButtonsView : UIView
/** btn的个数*/
@property(nonatomic, assign)NSInteger btnCount;
/** 目前被选中的个数*/
@property(nonatomic, assign)NSInteger selectedCount;
/** 通过个数计算大小*/
+(CGSize)sizeWithBtnCount:(NSInteger)btnCount;
@end
