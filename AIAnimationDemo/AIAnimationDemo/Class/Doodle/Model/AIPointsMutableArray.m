//
//  AIPointsMutableArray.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/4/29.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPointsMutableArray.h"

@implementation AIPointsMutableArray

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pointsArrayM   = [NSMutableArray array];
    }
    return self;
}

- (void)addObjectsFromArray:(NSArray*)otherArray {
    [self.pointsArrayM addObjectsFromArray:otherArray];
}
- (void)addObject:(id)object {
    [self.pointsArrayM addObject:object];
}

- (id)currentState {
    return @{@"array":self.pointsArrayM};
}


- (void)recoverFromState:(id)state {
    NSDictionary *data = state;
    NSMutableArray *arrayM = data[@"array"];
    [arrayM removeLastObject];
//    self = [NSMutableArray array];
}


@end
