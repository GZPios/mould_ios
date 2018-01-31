//
//  LoginHandler.h
//  mould_ios
//
//  Created by apple on 2018/1/23.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id obj);
typedef void(^FailedBlock)(id obj);

@interface LoginHandler : NSObject

//登录请求
+(void)requestLoginWithDic:(NSMutableDictionary *)dic success:(SuccessBlock)success
                               failed:(FailedBlock)failed;

//注册请求
+(void)requestRegisterWithDic:(NSMutableDictionary *)dic success:(SuccessBlock)success
                        failed:(FailedBlock)failed;

//短信登录请求
+(void)requestSMSLoginWithDic:(NSMutableDictionary *)dic success:(SuccessBlock)success
                        failed:(FailedBlock)failed;

//短信验证码请求
+(void)requestSMSCodeWithDic:(NSMutableDictionary *)dic success:(SuccessBlock)success
                       failed:(FailedBlock)failed;




@end
