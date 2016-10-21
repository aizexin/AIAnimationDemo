//
//  AIRectangleLayer.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/21.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AIRectangleLayer : CAShapeLayer
- (void)strokeChangeWithColor:(UIColor *)color ;
@property(nonatomic,assign,readonly)NSTimeInterval allAnimationDuration;
@end
