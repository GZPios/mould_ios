//
//  ContentModel.h
//  mould_ios
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentModel : NSObject
//种类
@property(nonatomic,copy)NSString *author;
//
@property(nonatomic,copy)NSString *author_id;
//封面URL
@property(nonatomic,copy)NSString *cate_name;
//
@property(nonatomic,copy)NSString *comments;
//
@property(nonatomic,copy)NSString *favorites;
//封面URL
@property(nonatomic,copy)NSString *cover;
//封面URL
@property(nonatomic,copy)NSString *pv;
//
@property(nonatomic,copy)NSString *summary;
//
@property(nonatomic,copy)NSString *time;
//封面URL
@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *url;
-(instancetype)initWithData:(NSMutableDictionary *)dic;

@end
