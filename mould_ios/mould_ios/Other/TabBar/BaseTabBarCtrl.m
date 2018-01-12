//
//  BaseTabBarCtrl.m
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "BaseTabBarCtrl.h"

#import "MainViewController.h"



@interface BaseTabBarCtrl ()

@end

@implementation BaseTabBarCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    MainViewController *firstVC = [MainViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:firstVC];
    self.viewControllers = @[nav];
}

@end
