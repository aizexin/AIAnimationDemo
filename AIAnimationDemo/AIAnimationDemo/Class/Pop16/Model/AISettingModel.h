//
//  AISettingModel.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^optionBlock)(void);

@interface AISettingModel : NSObject

/** 标签*/
@property (nonatomic,copy) NSString *title;
/** 图片名字*/
@property (nonatomic,copy) NSString *icon;
/**
 *  目标控制器
 */
@property (nonatomic, assign) Class destVC;
/** block*/
@property (nonatomic,copy) optionBlock block;
/** 辅助视图*/
@property(nonatomic,strong)UIView *accessibilityView;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc andAccessibilityView:(UIView*)accessibilityView;
@end
