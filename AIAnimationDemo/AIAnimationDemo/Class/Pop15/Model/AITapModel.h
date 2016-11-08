//
//  AITapModel.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AITapModel : NSObject
/** title*/
@property(nonatomic, copy)NSString *title;

/**
 是否被选中
 */
@property(nonatomic, assign,getter=isSelected)BOOL selected;


/**
 初始化

 @param title      标题
 @param isSelected 是否被选中
 */
-(instancetype)initWithTitle:(NSString*)title andIsSelected:(BOOL)isSelected;
+(instancetype)initWithTitle:(NSString*)title andIsSelected:(BOOL)isSelected;
@end
