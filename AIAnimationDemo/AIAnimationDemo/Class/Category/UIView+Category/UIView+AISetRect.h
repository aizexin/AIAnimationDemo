//
//  UIView+AISetRect.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/24.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  UIScreen width.
 */
#define  KWidth   [UIScreen mainScreen].bounds.size.width

/**
 *  UIScreen height.
 */
#define  KHeight  [UIScreen mainScreen].bounds.size.height

/**
 *  Status bar height.
 */
#define  StatusBarHeight      20.f

/**
 *  Navigation bar height.
 */
#define  NavigationBarHeight  44.f

/**
 *  Tabbar height.
 */
#define  TabbarHeight         49.f

/**
 *  Status bar & navigation bar height.
 */
#define  StatusBarAndNavigationBarHeight   (20.f + 44.f)

/**
 *  iPhone4 or iPhone4s
 */
#define  iPhone4_4s     (Width == 320.f && Height == 480.f ? YES : NO)

/**
 *  iPhone5 or iPhone5s
 */
#define  iPhone5_5s     (Width == 320.f && Height == 568.f ? YES : NO)

/**
 *  iPhone6 or iPhone6s
 */
#define  iPhone6_6s     (Width == 375.f && Height == 667.f ? YES : NO)

/**
 *  iPhone6Plus or iPhone6sPlus
 */
#define  iPhone6_6sPlus (Width == 414.f && Height == 736.f ? YES : NO)

#define KStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
@interface UIView(AISetRect)


/*----------------------
 * Absolute coordinate *
 ----------------------*/

@property (nonatomic) CGPoint ai_viewOrigin;
@property (nonatomic) CGSize  ai_viewSize;

@property (nonatomic) CGFloat ai_x;
@property (nonatomic) CGFloat ai_y;
@property (nonatomic) CGFloat ai_width;
@property (nonatomic) CGFloat ai_height;

@property (nonatomic) CGFloat ai_top;
@property (nonatomic) CGFloat ai_bottom;
@property (nonatomic) CGFloat ai_left;
@property (nonatomic) CGFloat ai_right;

@property (nonatomic) CGFloat ai_centerX;
@property (nonatomic) CGFloat ai_centerY;

/*----------------------
 * Relative coordinate *
 ----------------------*/

@property (nonatomic, readonly) CGFloat ai_middleX;
@property (nonatomic, readonly) CGFloat ai_middleY;
@property (nonatomic, readonly) CGPoint ai_middlePoint;

@end
