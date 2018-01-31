//
//  ContentModel.m
//  mould_ios
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "ContentModel.h"

@implementation ContentModel


-(instancetype)initWithData:(NSMutableDictionary *)dic{
    self = [super init];
    if (self) {
        self.author = dic[@"author"];
        self.author_id = [NSString stringWithFormat:@"%@",dic[@"author_id"]];
        self.cate_name = dic[@"cate_name"];
        self.comments = [NSString stringWithFormat:@"%@",dic[@"comments"]];
        self.cover = dic[@"cover"];
        self.favorites = [NSString stringWithFormat:@"%@",dic[@"favorites"]];
        self.summary = dic[@"summary"];
        self.pv = [NSString stringWithFormat:@"%@",dic[@"pv"]];
        self.time = dic[@"time"];
        self.title = dic[@"title"];
        self.url = dic[@"url"];
    }
    return self;
}



@end
