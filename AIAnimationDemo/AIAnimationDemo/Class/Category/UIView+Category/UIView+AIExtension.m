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
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0);
    CGContextRef context        = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, frame.origin.x * -1, frame.origin.y * -1);
    [self.layer renderInContext:context];
    UIImage *image              = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}
@end
