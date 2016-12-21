//
//  AITextView.h
//  AISchoolDiscipline
//
//  Created by 艾泽鑫 on 2016/12/20.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AITextView : UITextView
/**
 *  占位文字
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 *  占位文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;
/**
 最大高度  默认100
 */
@property (nonatomic,assign)CGFloat maxHeight;
/** 到父类的上下间距总和*/
@property(nonatomic, assign)CGFloat distanceToSuperView;
@end
