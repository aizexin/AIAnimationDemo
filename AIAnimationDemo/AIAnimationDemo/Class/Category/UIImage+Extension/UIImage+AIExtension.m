//
//  UIImage+AIExtension.m
//  CKD
//
//  Created by 艾泽鑫 on 2016/11/30.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import "UIImage+AIExtension.h"

@implementation UIImage (AIExtension)
- (instancetype)ai_circleImage{
    
    //开启上下文
    UIGraphicsBeginImageContext(self.size);
    
    //上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    
    //添加一个圈
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextAddEllipseInRect(ref, rect);
    
    //裁剪
    CGContextClip(ref);
    
    //画在上下文
    [self drawInRect:rect];
    
    //获得新的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    
    UIGraphicsEndImageContext();
    
    return image;
}
+ (instancetype)ai_circleImage:(NSString *)name{
    return [[self imageNamed:name] ai_circleImage];
    
}

+ (UIImage*) OriginImage:(UIImage*)image scaleToSize:(CGSize)size
{
    //size为CGSize类型，即你所需要的图片尺寸
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


@end
