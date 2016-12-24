//
//  UIImage+AIExtension.h
//  CKD
//
//  Created by 艾泽鑫 on 2016/11/30.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (AIExtension)
- (instancetype)ai_circleImage;

+ (instancetype)ai_circleImage:(NSString *)name;


/**
 重新绘制图片大小
 
 @param image 原始图片
 @param size  需要的大小
 
 @return 返回改变大小后图片
 */
+ (UIImage*) OriginImage:(UIImage*)image scaleToSize:(CGSize)size;


@end
