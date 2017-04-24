//
//  MementoCenter.h
//  MementoPattern
//
//  Created by YouXianMing on 15/10/16.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoCenterProtocol.h"

@interface MementoCenter : NSObject

/**
 *  save the object state
 *
 *  @param object object
 *  @param key    key
 */
+ (void)saveMementoObject:(id <MementoCenterProtocol>)object withKey:(NSString *)key;

/**
 *  get the object state
 *
 *  @param key key
 *
 *  @return object
 */
+ (id)mementoObjectWithKey:(NSString *)key;

@end
