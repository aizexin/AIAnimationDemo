//
//  AIMenuItem.m
//  AIAnimationDemo
//
//  Created by sober on 2017/5/31.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIMenuItem.h"
@interface AIMenuItem()

/**标题 */
@property(nonatomic,copy)NSString *title;
/**符号 */
@property(nonatomic,copy)NSString *symbol;
/**
 颜色
 */
@property(nonatomic,strong)UIColor  *color;
@end

@implementation AIMenuItem

-(instancetype)initWithSymbol:(NSString*)symbol Color:(UIColor*)color title:(NSString*)title {
    self = [super init];
    if (self) {
        _symbol = symbol;
        _color  = color;
        _title  = title;
    }
    return self;
}
+(NSArray *)menuColors {
     NSArray *   menuColors = @[
                        [UIColor colorWithRed:249/255. green:84/255. blue:7/255. alpha:1.],
                        [UIColor colorWithRed:69/255. green:59/255. blue:55/255. alpha:1.],
                        [UIColor colorWithRed:249/255. green:194/255. blue:7/255. alpha:1.],
                        [UIColor colorWithRed:32/255. green:188/255. blue:32/255. alpha:1.],
                        [UIColor colorWithRed:207/255. green:34/255. blue:156/255. alpha:1.],
                        [UIColor colorWithRed:14/255. green:88/255. blue:149/255. alpha:1.],
                        [UIColor colorWithRed:15/255. green:193/255. blue:231/255. alpha:1.],
                        ];
    return menuColors;
}
+ (NSArray<AIMenuItem *>*)shareMenuItems {
    NSArray * items = @[
                        [[AIMenuItem alloc]initWithSymbol:@"☎︎" Color:[AIMenuItem menuColors][0] title:@"Phone book"],
                        [[AIMenuItem alloc]initWithSymbol:@"✉︎" Color:[AIMenuItem menuColors][1] title:@"Email directory"],
                        [[AIMenuItem alloc]initWithSymbol:@"♻︎" Color:[AIMenuItem menuColors][0] title:@"Company recycle policy"],
                        [[AIMenuItem alloc]initWithSymbol:@"♞" Color:[AIMenuItem menuColors][0] title:@"Games and fun"],
                        [[AIMenuItem alloc]initWithSymbol:@"✾" Color:[AIMenuItem menuColors][0] title:@"Training programs"],
                        [[AIMenuItem alloc]initWithSymbol:@"✈︎" Color:[AIMenuItem menuColors][0] title:@"Travel"],
                        [[AIMenuItem alloc]initWithSymbol:@"🃖" Color:[AIMenuItem menuColors][0] title:@"Etc."],
                        ];
    return items;
}



@end
