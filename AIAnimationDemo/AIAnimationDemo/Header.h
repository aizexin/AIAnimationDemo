//
//  Header.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#ifndef Header_h
#define Header_h


#endif /* Header_h */
/**
 *  如果是OC中的全部写在这里边，如果是C语言或者其他，就写在外边
 */
#ifdef __OBJC__
#ifdef DEBUG//调试阶段的log
#define AILog(...) NSLog(__VA_ARGS__)
#else
#define AILog(...)
#endif
#import <POP.h>
#import <ReactiveObjC.h>
#import <Masonry.h>
#import "UIView+AISetRect.h"
#import "single.h"
#import "UIColor+AIExtension.h"
#define MainSize [UIScreen mainScreen].bounds.size
//导航栏高度
#define AINavgationBarH 64
#define AITabbarH 49
// 颜色
#define AIColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define AIRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//----------------------Bugly------------------
#define AIBuglyAppID @"e34658fb95"
#define AIBuglyAPPKey @"16fe690d-55ee-4388-aa27-7fcd8ae5bc91"
#endif
