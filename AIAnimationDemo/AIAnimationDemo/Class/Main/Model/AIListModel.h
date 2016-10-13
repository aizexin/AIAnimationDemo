//
//  AIListModel.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIListModel : NSObject
/** title*/
@property(nonatomic, copy)NSString *title;
@property (nonatomic, strong, readonly) NSMutableAttributedString *titleString;
/** 跳转的VC*/
@property(nonatomic,strong)Class targetVC;
/** 第几个*/
@property(nonatomic,assign)NSInteger index;

/** 创建富文本*/
- (void)createAttributedString ;
-(instancetype)initWithTitle:(NSString *)title andTargetVC:(Class )targetVC;
+(instancetype)initWithTitle:(NSString *)title andTargetVC:(Class )targetVC;
@end
