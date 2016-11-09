//
//  AIAFN3ModelTool.h
//  ckd
//
//  Created by 艾泽鑫 on 16/9/27.
//  Copyright © 2016年 David Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIAFN3ModelTool : NSObject

/**
 post请求

 @param url         请求路径
 @param param       请求参数模型
 @param resultClass 请求结果模型
 @param success     成功的回调block
 @param failure     失败的回调block
 */
+(void)postWithUrl:(NSString *)url params:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError* error))failure;
/**
 get请求
 
 @param url         请求路径
 @param param       请求参数模型
 @param resultClass 请求结果模型
 @param success     成功的回调block
 @param failure     失败的回调block
 */
+(void)getWithUrl:(NSString *)url params:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError* error))failure;
@end
