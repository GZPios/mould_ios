//
//  NetWorkManager.m
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "NetWorkManager.h"
#import "API+Network.h"

@implementation NetWorkManager

+(instancetype)shareManager
{
    static NetWorkManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:Host]];
    });
    return manager;
}

-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.requestSerializer.timeoutInterval = 8;
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", nil]];
    }
    return self;
}

+(void)isHadWorking:(void(^)(bool has))hasNet{
    __weak AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusNotReachable:
                hasNet(NO);
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                hasNet(YES);
                break;
        }
    }];
    [manager stopMonitoring];
}

-(void)postRequestWithUrlString:(NSString *)url withParametes:(NSDictionary *)parametes withSuccess:(SuccessBlock)success withFailed:(FailedBlock)failed
{
    [[self class] isHadWorking:^(bool has) {
        if (!has) {
            failed(@"请连接网络后重试");
        }else{
            [[NetWorkManager shareManager] POST:url parameters:parametes progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error.code == -1001) {
                    failed(@"网络连接超时");
                }else if(error.code == -1003){
                    failed(@"找不到服务器");
                }else if(error.code == 3840){
                    failed(@"3840");
                }else{
                    failed(@"错误");
                }
            }];
        }
    }];
}

@end
