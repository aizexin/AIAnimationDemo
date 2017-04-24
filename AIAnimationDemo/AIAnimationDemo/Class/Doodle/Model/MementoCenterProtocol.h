//
//  MementoCenterProtocol.h
//  MementoPattern
//
//  Created by YouXianMing on 15/10/16.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MementoCenterProtocol <NSObject>

@required
/**
 *  get state
 *
 *  @return state
 */
- (id)currentState;

/**
 *  recover from state
 *
 *  @param state state
 */
- (void)recoverFromState:(id)state;

@end
