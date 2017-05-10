//
//  AFNetHelper.m
//  LOL
//
//  Created by RichyLeo on 16/3/2.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import "AFNetHelper.h"
#import "AFNetworking.h"
#import "PPNetworkHelper.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "NSString+Extension.h"
@implementation AFNetHelper

+(void)GET:(NSString *)url parameters:(id)param progress:(void (^)(NSProgress * progress))progress success:(SuccessBlock)success failure:(FailureBlock)failure
{
    
    [PPNetworkHelper GET:url progress:progress parameters:param responseCache:^(id responseCache) {
        // 读取缓存
        if (!kIsNetwork) {
            if (success) {
                success(responseCache);
            }
        }
    }  success:^(id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}

+(void)POST:(NSString *)url parameters:(id)param progress:(void (^)(NSProgress *))progress success:(SuccessBlock)success failure:(FailureBlock)failure {

    [PPNetworkHelper POST:url progress:progress parameters:param responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        if(success){
            
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}
+ (__kindof NSURLSessionTask *)uploadWithURL:(NSString *)URL
                                  parameters:(NSDictionary *)parameters
                                      images:(NSArray<UIImage *> *)images
                                        name:(NSString *)name
                                    fileName:(NSString *)fileName
                                    mimeType:(NSString *)mimeType
                                    progress:(void (^)(NSProgress * progress))progress
                                     success:(SuccessBlock)success
                                     failure:(FailureBlock)failure {
   NSURLSessionTask *sessionTask = [PPNetworkHelper uploadWithURL:URL  parameters:parameters images:images name:name fileName:fileName mimeType:mimeType progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return sessionTask;
}
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
                                       fileDir:(NSString *)fileDir
                                      progress:(void (^)(NSProgress * progress))progressBlock
                                       success:(void(^)(NSString *filePath))success
                                       failure:(FailureBlock)failure {
   
    NSURLSessionTask *sessionTask = [PPNetworkHelper downloadWithURL:URL fileDir:fileDir progress:^(NSProgress *progress) {
        if (progress) {
            progressBlock(progress);
        }
    } success:^(NSString *filePath) {
        if (success) {
            success(filePath);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return sessionTask;
}
+ (void)DELETE:(NSString *)URL
                           parameters:(NSDictionary *)parameters
                             progress:(void (^)(NSProgress * progress))progressBlock
                              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    [PPNetworkHelper DELETE:URL parameters:parameters progress:^(NSProgress *progress) {
        if (progress) {
            progressBlock(progress);
        }
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task,error);
        }
        
    }];
}

/**
 自签证书验证

 */
+ (void)customSecurityPolicy {
    // 先导入证书
//    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"ca3" ofType:@"cer"];
    [PPNetworkHelper setSecurityPolicyWithCerPath:nil validatesDomainName:YES];
     //先导入证书
}


@end
