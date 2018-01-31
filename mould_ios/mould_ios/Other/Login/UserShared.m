//
//  UserShared.m
//  mould_ios
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "UserShared.h"

@implementation UserShared

static UserShared *user = nil;

+(instancetype)sharedUser{
    @synchronized (self) {
        
        if (user == nil) {
            user = [[self alloc]init];
        }
    }
    return user;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    if (user == nil) {
        user = [[super allocWithZone:zone] init];
    }
    return user;
}

-(id)copyWithZone:(NSZone *)zone{
    return user;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return user;
}










@end





