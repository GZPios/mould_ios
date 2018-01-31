//
//  UserShared.h
//  mould_ios
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserShared : NSObject

/** 登入状态 */
@property (nonatomic ,assign)      BOOL isLogin;

/** 用户ID */
@property (nonatomic ,copy)        NSString *userid;

/** 用户邮箱 */
@property (nonatomic ,copy)        NSString *email;

/** VIP标识 */
@property (nonatomic ,copy)        NSString *isvip;

/** 手机号 */
@property (nonatomic ,copy)        NSString *mobile;

/** 交易密码 */
@property (nonatomic ,copy)        NSString *paycode;

/** 用户名 */
@property (nonatomic ,copy)        NSString *userName;

/** 可用余额 */
@property (nonatomic ,copy)        NSString *kyye;

/** 资金总额 */
@property (nonatomic ,copy)        NSString *ze;

/** 冻结金额 */
@property (nonatomic ,copy)        NSString *djje;

/** 收益 */
@property (nonatomic ,copy)        NSString *sy;

/** 真实姓名 */
@property (nonatomic ,copy)        NSString *truename;

/** 身份证号 */
@property (nonatomic ,copy)        NSString *sfzh;

/**   */
@property (nonatomic ,copy)        NSString *surplusday;

/** 银行卡开户地点 */
@property (nonatomic ,copy)        NSString *bankbranch;

/** 银行卡名 */
@property (nonatomic ,copy)        NSString *bankname;

/** 银行卡号 */
@property (nonatomic ,copy)        NSString *bankcardno;

/** 银行卡绑定状态 */
@property (nonatomic ,copy)        NSString *bankcode;

/** 头像 */
@property (nonatomic ,copy)      NSString *headimg;

@property (nonatomic ,copy)      NSString *deposit_isband;
@property (nonatomic ,copy)      NSString *deposit_kyye;
@property (nonatomic ,copy)      NSString *deposit_ze;
@property (nonatomic ,copy)      NSString *deposit_acnd;
@property (nonatomic ,copy)      NSString *deposit;
@property (nonatomic ,copy)      NSString *hxearnings;
+(UserShared *)sharedUser;
@end
