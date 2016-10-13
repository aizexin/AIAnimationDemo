//
//  AINetWorkHelper.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessBlock)(id response);
typedef void (^FailureBlock)(NSError * err);


@interface AINetWorkHelper : NSObject
+(void)GET:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailureBlock)failure;

+(void)POST:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailureBlock)failure;

@end
