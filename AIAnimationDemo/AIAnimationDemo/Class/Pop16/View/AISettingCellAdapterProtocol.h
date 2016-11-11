//
//  AISettingCellAdapterProtocol.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  cell的适配协议

#import <Foundation/Foundation.h>
typedef void(^optionBlock)(void);
@protocol AISettingCellAdapterProtocol <NSObject>

- (NSString*)iconNameString;

- (NSString*)titleString;

- (optionBlock)optionBlock;

- (Class)destVC;

- (UIView*)accessibilityView;
@end
