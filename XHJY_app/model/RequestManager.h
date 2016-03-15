//
//  RequestManager.h
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/24.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "Base64CodeManager.h"
@class AFNetworkReachabilityManager;

typedef void(^CommonBlockCompletion)(id obj);
typedef void(^CommonBlockDictionary)(NSDictionary *dic);
typedef void(^CommonBlockError)(NSString *error);
typedef void(^CommonBlockDownload)(NSURLResponse *response, NSURL *filePath, NSError *error);
typedef void(^CommonBlockUpload)(NSURLResponse *response, id responseObject, NSError *error);
typedef void(^CommonBlockProgress)(NSProgress *progress);

@interface RequestManager : NSObject
//AFNetworking
@property (nonatomic, readonly, getter = manager) AFHTTPSessionManager *manager;

+ (instancetype)sharedInstance;

///处理返回的result数据
+ (BOOL)dealWithResult:(id)result;

///网络监听
+ (BOOL)isNetworkReachable;

/**
 *  处理Http POST 请求服务
 *
 *  @param url                请求地址
 *  @param params             参数字典
 *  @param completionCallback 请求成功回调
 *  @param errorCallback      请求失败回调
 */
- (void)post:(NSString *)url
      params:(NSDictionary *)params
onCompletion:(CommonBlockCompletion)completionCallback
     onError:(CommonBlockError)errorCallback;


/**
 *  处理Http GET 请求服务
 *
 *  @param url                请求地址
 *  @param params             参数字典
 *  @param completionCallback 请求成功回调
 *  @param errorCallback      请求失败回调
 */
- (void)get:(NSString *)url
     params:(NSDictionary *)params
onCompletion:(CommonBlockCompletion)completionCallback
    onError:(CommonBlockError)errorCallback;

/**
 *  处理下载任务
 *
 *  @param url              请求地址
 *  @param params           参数字典
 *  @param downloadCallback 成功返回
 *  @param errorCallback    失败返回
 *  @param progressCallback 进度返回
 */
- (void)downLoad:(NSString *)url params:(NSDictionary *)params onCompletion:(CommonBlockDownload)downloadCallback onError:(CommonBlockError)errorCallback withProgress:(CommonBlockProgress)progressCallback;

/**
 *  处理上传任务
 *
 *  @param url              请求地址
 *  @param params           参数字典
 *  @param path             上传文件路径
 *  @param uploadCallback   成功返回
 *  @param errorCallback    失败返回
 *  @param progressCallback 进度返回
 */
- (void)upLoad:(NSString *)url params:(NSDictionary *)params path:(NSString *)path onCompletion:(CommonBlockUpload)uploadCallback onError:(CommonBlockError)errorCallback withProgress:(CommonBlockProgress)progressCallback;


@end
