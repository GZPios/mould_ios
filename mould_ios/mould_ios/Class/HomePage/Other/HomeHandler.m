//
//  HomeHandler.m
//  mould_ios
//
//  Created by apple on 2018/1/12.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "HomeHandler.h"
#import "NetWorkManager.h"
#import "API+Network.h"

@implementation HomeHandler

+(void)requestHomePageInfoWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed{
    
    [[NetWorkManager shareManager]postRequestWithUrlString:API_HomePage withParametes:nil withSuccess:^(id json) {
        NSMutableArray *bannerImgs = [NSMutableArray array];
       
        [json[@"banner"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [bannerImgs addObject:obj[@"img"]];
            
        }];
        
        NSLog(@"%@",bannerImgs);
        success(bannerImgs);
    } withFailed:^(id json) {
        
        failed(json);
    }];
}




@end
