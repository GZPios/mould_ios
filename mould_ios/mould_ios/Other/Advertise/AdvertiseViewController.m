//
//  AdvertiseViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "AdvertiseViewController.h"

#import "NetWorkManager.h"
#import "API+Network.h"
#import "UIImage+GIF.h"
#import "SDWebImageManager.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "BaseTabBarCtrl.h"
@interface AdvertiseViewController ()
{
    
    NSTimer *timer;
}
@property(nonatomic , strong)AVPlayerViewController *aVPlayerViewController;

@property(nonatomic , strong)UIImageView *adImageView;

@property(nonatomic , strong)UIButton *timeBtn;

@property(nonatomic , assign)NSInteger num;

@end

@implementation AdvertiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _num = 3;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self requestAdInfo];

    
}


-(void)requestAdInfo{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"gif" forKey:@"ad"];
    [[NetWorkManager shareManager] postRequestWithUrlString:API_AdInfo withParametes:dic withSuccess:^(id json) {
        NSLog(@"%@",json);
        _num = [json[@"ad_timer"] integerValue];
        
        if ([json[@"ad_type"] isEqualToString:@"img"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.adImageView.image = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:json[@"ad_img"]]]];
            });
        }else if ([json[@"ad_type"] isEqualToString:@"gif"]){
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self starttimer];
                 self.adImageView.image = [UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:json[@"ad_img"]]]];
             });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{

            });
        }
    } withFailed:^(id json) {
        [self goToHomePage];
    }];
}

-(UIImageView *)adImageView{
    if (!_adImageView) {
        _adImageView = [UIImageView new];
        self.adImageView.frame = self.view.frame;
        [self.view addSubview:self.adImageView];
    }
    return _adImageView;
}



#pragma mark - button events

/**
 *  点击计时器
 */
-(UIButton *)timeBtn{
    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeBtn.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
        _timeBtn.frame = CGRectMake(300, 50, 50, 20);
        [_timeBtn addTarget:self action:@selector(didBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_timeBtn];
        [_timeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return _timeBtn;
}


-(void)didBtn:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"跳过"]) {
        [self goToHomePage];
    }
}


-(void)time{
    if (_num == 0) {
        [self.timeBtn setTitle:@"跳过" forState:UIControlStateNormal];
        [self stoptimer];
    }else{
        _num --;
        [self.timeBtn setTitle:[NSString stringWithFormat:@"%ld",(long)_num] forState:UIControlStateNormal];
    }
}


-(void)starttimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(time) userInfo:nil repeats:YES];
}

-(void)stoptimer{
    [timer invalidate];
}

-(void)goToHomePage{
    BaseTabBarCtrl *base = [BaseTabBarCtrl new];
    [UIApplication sharedApplication].keyWindow.rootViewController = base;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
}


@end
