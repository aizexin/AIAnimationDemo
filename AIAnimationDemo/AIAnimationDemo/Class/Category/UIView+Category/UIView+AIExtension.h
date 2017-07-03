//
//  UIView+AIExtension.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AIExtension)

/**
 截图

 @param frame frame
 @return 返回image
 */
- (UIImage*)ai_takeSnapshotWithFrame:(CGRect)frame ;
@end
