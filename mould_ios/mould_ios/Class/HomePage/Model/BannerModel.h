//
//  BannerModel.h
//  mould_ios
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject

@property(nonatomic,copy)NSString *url;

@property(nonatomic,copy)NSString *type;

@property(nonatomic,copy)NSString *img;


-(instancetype)initWithData:(NSMutableDictionary *)dic;

@end
