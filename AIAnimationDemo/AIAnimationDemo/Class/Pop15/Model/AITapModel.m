//
//  AITapModel.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITapModel.h"

@implementation AITapModel

-(instancetype)initWithTitle:(NSString*)title andIsSelected:(BOOL)isSelected{
    self = [super init];
    if (self) {
        _title    = title;
        _selected = isSelected;
    }
    return self;
}

+(instancetype)initWithTitle:(NSString*)title andIsSelected:(BOOL)isSelected{
    return [[self alloc]initWithTitle:title andIsSelected:isSelected];
}
@end
