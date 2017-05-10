//
//  AIAFN3ModelTool.m
//  ckd
//
//  Created by 艾泽鑫 on 16/9/27.
//  Copyright © 2016年 David Zheng. All rights reserved.
//

#import "AIAFN3ModelTool.h"
#import <MJExtension.h>
@implementation AIAFN3ModelTool


+(void)postWithUrl:(NSString *)url progress:(void (^)(NSProgress * progress))progressBlock params:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    //模型转换为字典
    NSDictionary *paramDict = [param mj_keyValues];
    [AFNetHelper POST:url parameters:paramDict progress:^(NSProgress *progress) {
        if (progressBlock) {
            progressBlock(progress);
        }
    } success:^(id response) {
        if (success) {
            id model = [resultClass mj_objectWithKeyValues:response];
            success(model);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
+(void)getWithUrl:(NSString *)url progress:(void (^)(NSProgress * progress))progressBlock params:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError* error))failure {
    //模型转换为字典
    NSDictionary *paramDict = [param mj_keyValues];
    [AFNetHelper GET:url parameters:paramDict progress:^(NSProgress *progress) {
        if (progressBlock) {
            progressBlock(progress);
        }
    } success:^(id response) {
        if (success) {
            //            NSDictionary *dataDict = response[@"data"];
            id model = [resultClass mj_objectWithKeyValues:response];
            success(model);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
+(void)deleteWithUrl:(NSString *)url progress:(void (^)(NSProgress * progress))progressBlock params:(id)param resultClass:(Class)resultClass success:(void(^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    //模型转换为字典
    NSDictionary *paramDict = [param mj_keyValues];
    [AFNetHelper DELETE:url parameters:paramDict progress:^(NSProgress *progress) {
        if (progressBlock) {
            progressBlock(progress);
        }
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            id model = [resultClass mj_objectWithKeyValues:responseObject];
            success(task,model);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task,error);
        }
    }];
}
@end
