//
//  BannerModel.m
//  mould_ios
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "BannerModel.h"

@implementation BannerModel

-(instancetype)initWithData:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.img = dic[@"img"];
        self.url = dic[@"uri"];
        self.type = dic[@"banner_type"];
    }
    return self;
}

@end
