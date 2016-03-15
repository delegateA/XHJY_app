//
//  RequestManager.m
//  XHJY_app
//
//  Created by LiangXiaobin on 16/2/24.
//  Copyright © 2016年 LiangXiaobin. All rights reserved.
//

#import "RequestManager.h"
#import "SSKeychain.h"
#import "Sha1Manager.h"

@implementation RequestManager
SHARED_SERVICE(RequestManager)
- (id)init
{
    self = [super init];
    if (self)
    {
        //初始化网络操作管理
        NSURL *baseUrl = [[NSURL alloc] initWithString:@""];
        _manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseUrl];
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 15;
        
        AFHTTPResponseSerializer * responseSerializer = [AFHTTPResponseSerializer serializer];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
        _manager.responseSerializer = responseSerializer;
        _manager.operationQueue.maxConcurrentOperationCount = 4;  //最大请求数
        
        NSString *account = [[NSUserDefaults standardUserDefaults] objectForKey:@"account"];
        NSString *passordA = [SSKeychain passwordForService:[Singleton sharedInstance].appName account:account];
        NSString *passordB = [Sha1Manager sha1StringFrom:passordA];
        NSLog(@"%@",passordA);
        NSString *mesage  = [[NSString alloc]init];
        if (passordB.length == 0||passordB == nil||!passordB) {
            
            mesage = [NSString stringWithFormat:@"%@:%@:%@",account,passordB,[Singleton sharedInstance].appName];
        }
        else
        {
           mesage = [NSString stringWithFormat:@"%@:%@:%@",account,passordB,[Singleton sharedInstance].appName];
        }
        NSString *header = [Base64CodeManager base64StringFromText:mesage];
        NSString *headera = [NSString stringWithFormat:@"Basic %@",header];
        
        [_manager.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", header] forHTTPHeaderField:@"Authorization"];
    
    }
    return self;
}

///处理返回的result数据
+ (BOOL)dealWithResult:(id)result
{
    BOOL isSuccess = NO;
    if (result[@"status"] == [NSNumber numberWithInteger:1])
    {
        isSuccess = YES;
    }
    return isSuccess;
}


-(void)handleFailBlock:(CommonBlockError)failBlock
                 error:(NSError *)error
      publishIfNoBlock:(int)errorCode
               message:(NSString *)msg
{
    if (failBlock)
    {
        
        DLog(@"error:%@,errorMsg:%@",error,msg);
        //把非服务器错误转成错误消息格式
        if (errorCode != 10001) {
            
            failBlock(msg);
            return;
        }
        
        failBlock(msg);
        return;
    }
}

//处理请求完成
-(void)handleCallback:(id)response
         onCompletion:(CommonBlockDictionary)completionBlock
               onFail:(CommonBlockError)failBlock
{
    if (!completionBlock) return;
    
    //解析JSON
    NSError *error;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response
                                                             options:NSJSONReadingMutableContainers
                                                               error:&error];
    if (error) {
        completionBlock(nil);
    }
    
    if (jsonData && [jsonData[@"result"][@"status"] integerValue] == 1) {
        
        completionBlock(jsonData);
        return ;
        
    }else{
        
        [self handleFailBlock:failBlock
                        error:nil
             publishIfNoBlock:10001
                      message:jsonData[@"result"][@"message"]];
        DLog(@"错误result:%@",jsonData);
        return;
    }
}

//处理POST请求
- (void)post:(NSString *)url
      params:(NSDictionary *)params
onCompletion:(CommonBlockCompletion)completionCallback
     onError:(CommonBlockError)errorCallback{
    
     //访问接口先检查网络
    if ([RequestManager isNetworkReachable]) {
        
        errorCallback(@"网络连接中断，请检查网络");
        return;
    }
    
    BlockWeakSelf(self);
    [self.manager POST:[NSString stringWithFormat:@"%@%@",[Singleton sharedInstance].baseUrl,url] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",task);
        //响应处理
        [weakSelf handleCallback:responseObject onCompletion:completionCallback onFail:errorCallback];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //错误处理
        [weakSelf handleFailBlock:errorCallback error:error publishIfNoBlock:-1 message:error.localizedDescription];
        
    }];
    
}

- (void)get:(NSString *)url
     params:(NSDictionary *)params
onCompletion:(CommonBlockCompletion)completionCallback
    onError:(CommonBlockError)errorCallback{
    //访问接口先检查网络
    if ([RequestManager isNetworkReachable]) {
        
        errorCallback(@"网络连接中断，请检查网络");
        return;
    }
    
    BlockWeakSelf(self);
    [self.manager GET:[NSString stringWithFormat:@"%@%@",[Singleton sharedInstance].baseUrl,url] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //响应处理
        [weakSelf handleCallback:responseObject onCompletion:completionCallback onFail:errorCallback];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //错误处理
        [weakSelf handleFailBlock:errorCallback error:error publishIfNoBlock:-1 message:error.localizedDescription];
        
    }];
}

- (void)downLoad:(NSString *)url params:(NSDictionary *)params onCompletion:(CommonBlockDownload)downloadCallback onError:(CommonBlockError)errorCallback withProgress:(CommonBlockProgress)progressCallback
{
    //访问接口先检查网络
    if ([RequestManager isNetworkReachable]) {
        errorCallback(@"网络连接中断，请检查网络");
        return;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager  alloc]initWithSessionConfiguration:configuration];
    NSURL *theUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:theUrl];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progressCallback(downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentationDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:false error:nil];
       return  [documentsDirectoryURL URLByAppendingPathComponent:response.suggestedFilename];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        downloadCallback(response,filePath,error);
    }];
    
    [downloadTask resume];
    
}

- (void)upLoad:(NSString *)url params:(NSDictionary *)params path:(NSString *)path onCompletion:(CommonBlockUpload)uploadCallback onError:(CommonBlockError)errorCallback withProgress:(CommonBlockProgress)progressCallback
{
    //访问接口先检查网络
    if ([RequestManager isNetworkReachable]) {
        errorCallback(@"网络连接中断，请检查网络");
        return;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager  alloc]initWithSessionConfiguration:configuration];
    NSURL *theUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:theUrl];
    
    NSURL *filePath = [NSURL fileURLWithPath:path];
     NSURLSessionUploadTask *upLoadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:^(NSProgress * _Nonnull uploadProgress) {
         progressCallback(uploadProgress);
     } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
         uploadCallback(response,responseObject,error);
     }];
    [upLoadTask resume];
}



//网络监听
+ (BOOL) isNetworkReachable{
    
    return [AFNetworkReachabilityManager sharedManager].isReachable;
}

@end
