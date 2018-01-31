//
//  ContentHandler.m
//  mould_ios
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "ContentHandler.h"
#import "NetWorkManager.h"

@implementation ContentHandler

+(void)requestPullUpWithSuccessWithDict:(NSMutableDictionary *)dic success:(SuccessBlock)success failed:(FailedBlock)failed{
    
    
    [[NetWorkManager shareManager]postRequestWithUrlString:API_newsList withParametes:dic withSuccess:^(id json) {
      
        success(json);
    } withFailed:^(id json) {
    
        failed(json);
    }];
}


@end
