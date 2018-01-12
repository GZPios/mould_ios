//
//  MainViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "MainViewController.h"
#import "MJRefresh.h"
#import "SDCycleScrollView.h"
#import "HomeHandler.h"

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property(nonatomic, strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic, strong)UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self requestMainData];
}

-(void)requestMainData{
    [HomeHandler requestHomePageInfoWithSuccess:^(id obj) {
        NSLog(@"%@",obj);
        
        [self.tableView reloadData];
        _cycleScrollView.imageURLStringsGroup = obj;
    } failed:^(id obj) {
        
    }];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height-64-49) style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1];
        _tableView.estimatedRowHeight = 2;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
          
        }];
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 145) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        _tableView.tableHeaderView = _cycleScrollView;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;
}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    
}



@end
