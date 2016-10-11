//
//  AINetWorkHelper.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/11.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AINetWorkHelper.h"
#import <AFNetworking.h>

@implementation AINetWorkHelper

+(void)GET:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailureBlock)failure{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 网络超时设置
    manager.requestSerializer.timeoutInterval = 15;
    [manager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // responseObject  解析数据
        if(success){
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 给用户提示，显示失败的原因
        if(failure){
            failure(error);
        }
    }];
}

+(void)POST:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailureBlock)failure{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    // 网络超时设置
    manager.requestSerializer.timeoutInterval = 15;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    [manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // responseObject  解析数据
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingMutableContainers) error:nil];
        if(success){
            success(responseDict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 给用户提示，显示失败的原因
        if(failure){
            failure(error);
        }
    }];
}

@end
