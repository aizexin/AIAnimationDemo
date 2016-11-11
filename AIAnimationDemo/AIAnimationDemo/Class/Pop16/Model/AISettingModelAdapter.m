//
//  AISettingModelAdapter.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AISettingModelAdapter.h"
#import "AISettingModel.h"
@implementation AISettingModelAdapter

- (instancetype)initWithData:(id)data {
    
    self = [super init];
    if (self) {
        
        self.data = data;
    }
    
    return self;
}

#pragma mark --AISettingCellAdapterProtocol
- (NSString*)iconNameString{
    AISettingModel *model = self.data;
    return model.icon;
}

- (NSString*)titleString{
    AISettingModel *model = self.data;
    return model.title;
}

- (optionBlock)optionBlock{
    AISettingModel *model = self.data;
    return model.block;
}

- (Class)destVC{
    AISettingModel *model = self.data;
    return model.destVC;
}

- (UIView*)accessibilityView{
    AISettingModel *model = self.data;
    return model.accessibilityView;
}
@end
