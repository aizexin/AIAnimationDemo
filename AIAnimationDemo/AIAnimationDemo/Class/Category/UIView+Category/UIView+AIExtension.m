//
//  UIView+AIExtension.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/3.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "UIView+AIExtension.h"

@implementation UIView (AIExtension)

- (UIImage*)ai_takeSnapshotWithFrame:(CGRect)frame {

    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGContextTranslateCTM(<#CGContextRef  _Nullable c#>, <#CGFloat tx#>, <#CGFloat ty#>)

    CGContextTranslateCTM(context, frame.origin.x * -1, frame.origin.y * -1);
    // 2.将控制器view的layer渲染到上下文
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
