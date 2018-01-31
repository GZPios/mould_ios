//
//  HomeHandler.m
//  mould_ios
//
//  Created by apple on 2018/1/12.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "HomeHandler.h"
#import "NetWorkManager.h"
#import "BannerModel.h"

@implementation HomeHandler

+(void)requestHomePageInfoWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed{
    
    [[NetWorkManager shareManager]postRequestWithUrlString:API_HomePage withParametes:nil withSuccess:^(id json) {
        if ([json[@"status"] isEqualToString:@"true"]) {
            
            
        }else{
            
        }
        
        NSMutableArray *bannerImgs = [NSMutableArray array];
        NSMutableArray *banners = [NSMutableArray array];
        NSMutableDictionary *pageInfoDic = [NSMutableDictionary dictionary];
        NSLog(@"%@",json);
        [json[@"banner"] enumerateObjectsUsingBlock:^(NSMutableDictionary* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [bannerImgs addObject:obj[@"img"]];
            BannerModel *model = [[BannerModel alloc]initWithData:obj];
            [banners addObject:model];
        }];
        
        [pageInfoDic setObject:bannerImgs forKey:@"bannerImgs"];
        [pageInfoDic setObject:banners forKey:@"bannerModel"];
        success(pageInfoDic);
        
    } withFailed:^(id json) {
        
        failed(json);
    }];
}

@end
