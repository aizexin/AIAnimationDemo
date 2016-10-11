//
//  MLTransition.h
//  MLTransition
//
//  Created by molon on 7/8/14.
//  Copyright (c) 2014 molon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MLTransitionGestureRecognizerTypePan, //拖动模式
	MLTransitionGestureRecognizerTypeScreenEdgePan, //边界拖动模式
} MLTransitionGestureRecognizerType;

@interface MLTransition : NSObject

+ (void)validatePanBackWithMLTransitionGestureRecognizerType:(MLTransitionGestureRecognizerType)type;
+ (void)invalidate;

@end

@interface UIView(__MLTransition)

//使得此view不响应拖返
@property (nonatomic, assign) BOOL disableMLTransition;

@end

@interface UINavigationController(DisableMLTransition)

- (void)enabledMLTransition:(BOOL)enabled;

@end
