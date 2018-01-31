//
//  MeViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "MeViewController.h"
#import "BaseNavCtrl.h"

#import "MJRefresh.h"
#import "MeHeadCellTableViewCell.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "UserInfoViewController.h"


@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
}

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.tableView];
    
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        //    _tableView.backgroundColor = RGB(238, 238, 238);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MeHeadCellTableViewCell class] forCellReuseIdentifier:@"headCell"];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
        _tableView.sectionFooterHeight = 0.1;
        _tableView.sectionHeaderHeight = 10;
        _tableView.contentInset = UIEdgeInsetsMake(10-35, 0, 0, 0);
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 70;
    }
    return 50;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        MeHeadCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headCell"];
        if (!cell) {
            cell = [[MeHeadCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headCell"];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shezhiCell"];
        cell.textLabel.text = @"设置";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"loginCell"];
        cell.textLabel.text = @"登录";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UserInfoViewController *userVC = [UserInfoViewController new];
        [self.navigationController pushViewController:userVC animated:YES];
    }else if(indexPath.section == 1){
        SettingViewController *settingVC = [SettingViewController new];
        
        [self.navigationController pushViewController:settingVC animated:YES];
        
    }else{
        LoginViewController *loginVC = [LoginViewController new];
        BaseNavCtrl *nav = [[BaseNavCtrl alloc]initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
    }
}




@end
