//
//  AISettingCellAdapter.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AISettingCellAdapterProtocol.h"

@interface AISettingCellAdapter : NSObject<AISettingCellAdapterProtocol>

/**
 *  输入对象
 */
@property (nonatomic, strong) id data;

/**
 *  与输入对象建立联系
 *
 *  @param data 输入的对象
 *
 *  @return 实例对象
 */
- (instancetype)initWithData:(id)data;
@end
