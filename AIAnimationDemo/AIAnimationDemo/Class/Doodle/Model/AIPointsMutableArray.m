//
//  AIPointsMutableArray.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/4/29.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPointsMutableArray.h"

@implementation AIPointsMutableArray
- (id)currentState {
    return @{@"array":self};
}


- (void)recoverFromState:(id)state {
    NSDictionary *data = state;
//    self = [NSMutableArray array];
}
@end
