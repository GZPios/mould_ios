//
//  MainViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "MainViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface MainViewController ()

@property(nonatomic , strong)AVPlayerViewController *aVPlayerViewController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
//    NSURL *movieUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cont-1249893-11405096-hd" ofType:@"mp4"]];
    
//    NSURL *movieUrl = [NSURL URLWithString:@"https://imgcache.qq.com/tencentvideo_v1/playerv3/TPout.swf?max_age=86400&v=20161117&vid=u0531v7tzxt&auto=0"];
//    NSURL *movieUrl = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
   
//  NSString *path = [[NSBundle mainBundle] pathForResource:@"happy" ofType:@"gif"];
//    NSString *loc = [[NSBundle mainBundle] pathForResource:@"cont-1249893-11405096-hd" ofType:@"mp4"];
/**
    AVPlayer *player = [AVPlayer playerWithURL:movieUrl];

    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];

    playerLayer.frame = CGRectMake(10, 30, self.view.bounds.size.width - 20, 200);

    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;

    [self.view.layer addSublayer:playerLayer];

    [player play];
*/
    
    
//     self.aVPlayerViewController = [[AVPlayerViewController alloc]init];
//     self.aVPlayerViewController.player = [[AVPlayer alloc]initWithURL:path];
//     [self addChildViewController:self.aVPlayerViewController];
//     self.aVPlayerViewController.view.frame = self.view.frame;
//     self.aVPlayerViewController.view.translatesAutoresizingMaskIntoConstraints = true;
//     [self.view addSubview:self.aVPlayerViewController.view];
//     [self.aVPlayerViewController.player play];


/**
    NSURL *url =[[NSURL alloc] initWithString:@"http://w2.dwstatic.com/1/5/1525/127352-100-1434554639.mp4"];
    UIWebView *myWeb = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWeb loadRequest:request];
    [self.view addSubview:myWeb];
*/
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
