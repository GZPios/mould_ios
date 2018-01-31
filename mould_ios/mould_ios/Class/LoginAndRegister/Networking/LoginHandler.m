//
//  LoginHandler.m
//  mould_ios
//
//  Created by apple on 2018/1/23.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "LoginHandler.h"
#import "NetWorkManager.h"

@implementation LoginHandler

/**
 *  登录请求
 *
 *  mobile
 *  password
 */
+(void)requestLoginWithDic:(NSMutableDictionary *)dic success:(SuccessBlock)success failed:(FailedBlock)failed{
    
    [[NetWorkManager shareManager]postRequestWithUrlString:API_Login withParametes:dic withSuccess:^(id json) {
        success(json);
    } withFailed:^(id json) {
        failed(json);
    }];
}

/**
 *  注册请求
 */
+(void)requestRegisterWithDic:(NSMutableDictionary *)dic success:(SuccessBlock)success failed:(FailedBlock)failed{
    [[NetWorkManager shareManager] postRequestWithUrlString:API_Register withParametes:dic withSuccess:^(id json) {
        success(json);
    } withFailed:^(id json) {
        
    }];
}


/**
 *  短信登录请求
 */
+(void)requestSMSLoginWithDic:(NSMutableDictionary *)dic success:(SuccessBlock)success failed:(FailedBlock)failed{
    [[NetWorkManager shareManager]postRequestWithUrlString:API_SMSLogin withParametes:dic withSuccess:^(id json) {
        success(json);
    } withFailed:^(id json) {
        
    }];
}

/**
 *  验证码请求
 */
+(void)requestSMSCodeWithDic:(NSMutableDictionary *)dic success:(SuccessBlock)success failed:(FailedBlock)failed{
    [[NetWorkManager shareManager]postRequestWithUrlString:API_SMSCode withParametes:dic withSuccess:^(id json) {
        success(json);
    } withFailed:^(id json) {
        failed(json);
    }];
    
}

@end
