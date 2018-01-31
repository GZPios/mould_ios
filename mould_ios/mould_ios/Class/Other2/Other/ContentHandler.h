//
//  ContentHandler.h
//  mould_ios
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^SuccessBlock)(id obj);
typedef void(^FailedBlock)(id obj);

@interface ContentHandler : NSObject


//上拉请求
+(void)requestPullUpWithSuccessWithDict:(NSMutableDictionary*)dic success:(SuccessBlock)success
                               failed:(FailedBlock)failed;



@end
