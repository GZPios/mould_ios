//
//  NetWorkManager.h
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef NS_ENUM(NSUInteger, HttpRequestType)
{
    HttpRequestTypeGet = 0,
    HttpRequestTypePost
};

typedef void(^SuccessBlock)(id json);

typedef void(^FailedBlock)(id json);


@interface NetWorkManager : AFHTTPSessionManager

+(instancetype)shareManager;

-(void)postRequestWithUrlString:(NSString *)url withParametes:(NSDictionary *)parametes withSuccess:(SuccessBlock)success withFailed:(FailedBlock)failed;

@end
