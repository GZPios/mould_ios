//
//  Tools.m
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "Tools.h"

@implementation Tools


+ (BOOL)isFirstEntryApp{
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"isFirst"]) {
        [[NSUserDefaults standardUserDefaults]setObject:@"no" forKey:@"isFirst"];
        return YES;
    }
    return NO;
}


+(NSArray *)arrayByPlistWthFileName:(NSString *)name{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:name ofType:@"plist"];
    return [[NSArray alloc]initWithContentsOfFile:plistPath];
}





@end
