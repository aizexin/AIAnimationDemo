//
//  AIMenuItem.h
//  AIAnimationDemo
//
//  Created by sober on 2017/5/31.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIMenuItem : NSObject
@property(nonatomic,strong)NSArray *menuColors;
/**符号 */
@property(nonatomic,copy)NSString *symbol;
/** 颜色 */
@property(nonatomic,strong)UIColor  *color;
/**标题 */
@property(nonatomic,copy)NSString *title;
+ (instancetype)shareItems;
- (NSArray<AIMenuItem *>*)shareMenuItems;
-(instancetype)initWithSymbol:(NSString*)symbol Color:(UIColor*)color title:(NSString*)title;
@end
