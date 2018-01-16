//
//  BaseWebViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "BaseWebViewController.h"
#import <WebKit/WebKit.h>

@interface BaseWebViewController ()<WKNavigationDelegate,WKUIDelegate>
{
    
}
@property(nonatomic, strong)WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self setUpWebView];

    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, 1)];
    self.progressView.backgroundColor = [UIColor blueColor];
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    [self.view addSubview:self.progressView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webView.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)setUpWebView{
    _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:self.webView];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载网页");
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
}

-(void)dealloc{
     [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    NSLog(@"webview,delloc");
}


@end
