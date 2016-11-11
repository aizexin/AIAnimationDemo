//
//  AISettingCellAdapter.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AISettingCellAdapter.h"

@implementation AISettingCellAdapter

- (instancetype)initWithData:(id)data {
    
    self = [super init];
    if (self) {
        
        self.data = data;
    }
    
    return self;
}

#pragma mark --AISettingCellAdapterProtocol
- (NSString*)iconNameString{
    return nil;
}

- (NSString*)titleString{
    return nil;
}

- (optionBlock)optionBlock{
    return nil;
}

- (Class)destVC{
    return nil;
}

- (UIView*)accessibilityView{
    return nil;
}
@end
