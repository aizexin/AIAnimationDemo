//
//  AISettingModel.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AISettingModel.h"

@implementation AISettingModel

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc andAccessibilityView:(UIView *)accessibilityView
{
    if (self = [super init]) {
        self.icon              = icon;
        self.title             = title;
        self.destVC            = destVc ;
        self.accessibilityView = accessibilityView;
    }
    return self;
}
@end
