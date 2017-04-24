//
//  MementoCenter.m
//  MementoPattern
//
//  Created by YouXianMing on 15/10/16.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "MementoCenter.h"
#import "FastCoder.h"

@implementation MementoCenter

+ (void)saveMementoObject:(id <MementoCenterProtocol>)object withKey:(NSString *)key {

    NSParameterAssert(object);
    NSParameterAssert(key);
    
    // 获取data
    id      data    = [object currentState];
    NSData *tmpData = [FastCoder dataWithRootObject:data];
    
    // 进行存储
    if (tmpData) {
        
        [[NSUserDefaults standardUserDefaults] setObject:tmpData
                                                  forKey:key];
    }
}

+ (id)mementoObjectWithKey:(NSString *)key {

    NSParameterAssert(key);
    
    id      data    = nil;
    NSData *tmpData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    if (tmpData) {
        
        data = [FastCoder objectWithData:tmpData];
    }
    
    return data;
}

@end
