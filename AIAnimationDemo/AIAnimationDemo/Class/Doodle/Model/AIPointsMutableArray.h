//
//  AIPointsMutableArray.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/4/29.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoCenterProtocol.h"
@interface AIPointsMutableArray : NSObject <MementoCenterProtocol>
/** 数组*/
@property(nonatomic,strong)NSMutableArray *pointsArrayM;
- (void)addObjectsFromArray:(NSArray*)otherArray;
- (void)addObject:(id)object;
@end
