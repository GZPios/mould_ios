//
//  HomeHandler.h
//  mould_ios
//
//  Created by apple on 2018/1/12.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id obj);
typedef void(^FailedBlock)(id obj);

@interface HomeHandler : NSObject

//首页请求
+(void)requestHomePageInfoWithSuccess:(SuccessBlock)success
                               failed:(FailedBlock)failed;






@end
