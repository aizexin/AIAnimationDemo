//
//  NSObject+MementoCenter.h
//  MementoPattern
//
//  Created by YouXianMing on 15/10/17.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MementoCenter)

/**
 *  存储状态
 *
 *  @param key 键值
 */
- (void)saveStateWithKey:(NSString *)key;

/**
 *  恢复状态
 *
 *  @param key 键值
 */
- (void)recoverFromStateWithKey:(NSString *)key;

@end
