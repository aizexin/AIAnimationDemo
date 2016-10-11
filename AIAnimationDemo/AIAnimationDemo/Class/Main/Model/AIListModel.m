//
//  AIListModel.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIListModel.h"

@implementation AIListModel


-(instancetype)initWithTitle:(NSString *)title andTargetVC:(Class )targetVC{
    self = [super init];
    if (self) {
        _title = title;
        _targetVC = targetVC;
    }
    return self;
}
+(instancetype)initWithTitle:(NSString *)title andTargetVC:(Class )targetVC{
    AIListModel *model = [[AIListModel alloc]initWithTitle:title andTargetVC:targetVC];
    return model;
}
@end
