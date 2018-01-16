//
//  BaseTabBarCtrl.m
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "BaseTabBarCtrl.h"
#import "BaseNavCtrl.h"

#import "MainViewController.h"
#import "MeViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface BaseTabBarCtrl ()

@end

@implementation BaseTabBarCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainViewController *firstVC = [MainViewController new];
    BaseNavCtrl *nav = [[BaseNavCtrl alloc]initWithRootViewController:firstVC];
    firstVC.title = @"推荐";
    nav.title = @"首页";
    
    MeViewController *meVC = [MeViewController new];
    BaseNavCtrl *meNav = [[BaseNavCtrl alloc]initWithRootViewController:meVC];
    meVC.title = @"我的";

    OneViewController *oneVC = [OneViewController new];
    BaseNavCtrl *oneNav = [[BaseNavCtrl alloc]initWithRootViewController:oneVC];
    oneVC.title = @"part1";
    
    TwoViewController *twoVC = [TwoViewController new];
    BaseNavCtrl *twoNav = [[BaseNavCtrl alloc]initWithRootViewController:twoVC];
    twoVC.title = @"part2";
    self.viewControllers = @[nav,oneNav,twoNav,meNav,];
}

@end
