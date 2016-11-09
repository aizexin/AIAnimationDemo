//
//  AIAFN3ModelTool.m
//  ckd
//
//  Created by 艾泽鑫 on 16/9/27.
//  Copyright © 2016年 David Zheng. All rights reserved.
//

#import "AIAFN3ModelTool.h"
#import "AINetWorkHelper.h"
#import <MJExtension.h>
@implementation AIAFN3ModelTool


+(void)postWithUrl:(NSString *)url params:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError* error))failure{
    //模型转换为字典
    NSDictionary *params = [param mj_keyValues];
    [AINetWorkHelper POST:url parameters:params success:^(id response) {
        if (success) {
            id model = [resultClass mj_objectWithKeyValues:params];
            success(model);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)getWithUrl:(NSString *)url params:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError* error))failure{
    //模型转换为字典
    NSDictionary *params = [param mj_keyValues];
    [AINetWorkHelper GET:url parameters:params success:^(id response) {
        if (success) {
            id model = [resultClass mj_objectWithKeyValues:params];
            success(model);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
