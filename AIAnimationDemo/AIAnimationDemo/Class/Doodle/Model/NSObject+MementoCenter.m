//
//  NSObject+MementoCenter.m
//  MementoPattern
//
//  Created by YouXianMing on 15/10/17.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "NSObject+MementoCenter.h"
#import "MementoCenter.h"

@implementation NSObject (MementoCenter)

- (void)saveStateWithKey:(NSString *)key {

    NSParameterAssert(key);
    
    id <MementoCenterProtocol> obj = (id <MementoCenterProtocol>)self;
    if ([obj respondsToSelector:@selector(currentState)]) {
        
        [MementoCenter saveMementoObject:obj withKey:key];
    }
}

- (void)recoverFromStateWithKey:(NSString *)key {

    NSParameterAssert(key);
    
    id <MementoCenterProtocol> obj = (id <MementoCenterProtocol>)self;
    if ([obj respondsToSelector:@selector(recoverFromStateWithKey:)]) {
        
        id state = [MementoCenter mementoObjectWithKey:key];
        if (state) {
            
            [obj recoverFromState:state];
        }
    }
}

@end
