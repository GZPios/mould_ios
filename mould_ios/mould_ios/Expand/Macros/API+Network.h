//
//  API+Network.h
//  mould_ios
//
//  Created by apple on 2018/1/12.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <Foundation/Foundation.h>

//测试域名
#define Host                     @"http://api.hzz.com"

//广告详情
#define API_AdInfo               @"/startup"

//首页详情
#define API_HomePage             @"/homepage"

//注册
#define API_Register             @"/register"

//登录
#define API_Login                @"/login"

//短信登录
#define API_SMSLogin             @"/quicklogin"

//短信验证码
#define API_SMSCode              @"/get_smsscode"

//用户信息
#define API_UserInfo             @"/userinfo"


#define API_newsList             @"/news_list"

//上拉加载
#define API_PullUp               @"/pullup"

//下拉刷新
#define API_PullDown             @"/pulldown"


@interface API_Network : NSObject

@end
