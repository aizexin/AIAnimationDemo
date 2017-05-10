//
//  AIAFN3ModelTool.h
//  ckd
//
//  Created by 艾泽鑫 on 16/9/27.
//  Copyright © 2016年 David Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetHelper.h"
@interface AIAFN3ModelTool : AFNetHelper
+(void)postWithUrl:(NSString *)url progress:(void (^)(NSProgress * progress))progressBlock params:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError* error))failure;
+(void)getWithUrl:(NSString *)url progress:(void (^)(NSProgress * progress))progressBlock params:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError* error))failure;
+(void)deleteWithUrl:(NSString *)url progress:(void (^)(NSProgress * progress))progressBlock params:(id)param resultClass:(Class)resultClass success:(void(^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
