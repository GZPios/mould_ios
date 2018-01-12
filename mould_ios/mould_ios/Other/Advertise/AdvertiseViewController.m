//
//  AdvertiseViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "AdvertiseViewController.h"

#import "NetWorkManager.h"

#import "UIImage+GIF.h"
#import "SDWebImageManager.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AdvertiseViewController ()

@property(nonatomic , strong)AVPlayerViewController *aVPlayerViewController;

@property(nonatomic , strong)UIImageView *adImageView;

@end

@implementation AdvertiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    [self requestAdInfo];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"happy" ofType:@"gif"];
//    //将图片转为NSData
//    NSData *gifData = [NSData dataWithContentsOfFile:path];
//    //创建一个webView，添加到界面
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:webView];
//    //自动调整尺寸
//    webView.scalesPageToFit = YES;
//    //禁止滚动
//    webView.scrollView.scrollEnabled = NO;
//    //设置透明效果
//    webView.backgroundColor = [UIColor clearColor];
//    webView.opaque = 0;
//    //加载数据
//    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];


}


-(void)requestAdInfo{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"gif" forKey:@"ad"];
    [[NetWorkManager shareManager] postRequestWithUrlString:@"http://app.hzz.com/startup" withParametes:dic withSuccess:^(id json) {
        NSLog(@"%@",json);
        if ([json[@"ad_type"] isEqualToString:@"img"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.adImageView.image = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:json[@"ad_img"]]]];
            });
        }else if ([json[@"ad_type"] isEqualToString:@"gif"]){
             dispatch_async(dispatch_get_main_queue(), ^{
                 self.adImageView.image = [UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:json[@"ad_img"]]]];
             });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
//                NSURL *url = [[NSBundle mainBundle] URLForResource:@"cont-1249893-11405096-hd.mp4" withExtension:nil];
//                self.aVPlayerViewController = [[AVPlayerViewController alloc]init];
//                self.aVPlayerViewController.player = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:url]];
//                [self addChildViewController:self.aVPlayerViewController];
//                self.aVPlayerViewController.view.frame = self.view.frame;
//                self.aVPlayerViewController.view.translatesAutoresizingMaskIntoConstraints = true;
//                [self.view addSubview:self.aVPlayerViewController.view];
//                [self.aVPlayerViewController.player play];
//                NSURL *sourceMovieURL = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
                
                
//            NSURL *movieUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cont-1249893-11405096-hd" ofType:@"mp4"]];
            
            // 加载本地视频
            NSURL *movieUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"步步高手机" ofType:@"mp4"]];
            
            // 加载网络视频
//            NSURL *movieUrl = [NSURL URLWithString:@"http://w2.dwstatic.com/1/5/1525/127352-100-1434554639.mp4"];
            
            // 创建 AVPlayer 播放器
            AVPlayer *player = [AVPlayer playerWithURL:movieUrl];
            
            // 将 AVPlayer 添加到 AVPlayerLayer 上
            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
            
            // 设置播放页面大小
            playerLayer.frame = CGRectMake(10, 30, self.view.bounds.size.width - 20, 200);
            
            // 设置画面缩放模式
            playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
            
            // 在视图上添加播放器
            [self.view.layer addSublayer:playerLayer];
            
            // 开始播放
            [player play];
//                 本地的一个视频
           
                
//                 NSURL *url = [[NSBundle mainBundle] URLForResource:@"cont-1249893-11405096-hd.mp4" withExtension:nil];
//                 AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
//
////                AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://down.treney.com/mov/test.mp4"]];
//
//                //2、创建播放器
//              AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
//                //3、创建视频显示的图层
//                AVPlayerLayer *showVodioLayer = [AVPlayerLayer playerLayerWithPlayer:player];
//                showVodioLayer.frame = self.view.frame;
//                [self.view.layer addSublayer:showVodioLayer];
//                //4、播放视频
//                [player play];
                
              
              

//                NSURL *url =[[NSURL alloc] initWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
//                UIWebView *myWeb = [[UIWebView alloc] initWithFrame:self.view.bounds];
//                NSURLRequest *request = [NSURLRequest requestWithURL:url];
//                [myWeb loadRequest:request];
//                [self.view addSubview:myWeb];

            });

        }
    } withFailed:^(id json) {
        NSLog(@"%@",json);
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






@end
