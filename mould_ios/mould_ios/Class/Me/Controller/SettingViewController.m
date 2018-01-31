//
//  SettingViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/18.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "SettingViewController.h"
#import "AboutViewController.h"
#import "HelpViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)NSArray*listDatas;
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
  
    [self.view addSubview:self.tableView];
    
}






-(NSArray *)listDatas{
    if (!_listDatas) {
        _listDatas = [Tools arrayByPlistWthFileName:@"MeList"];
    }
    return _listDatas;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionFooterHeight = 0.1;
        _tableView.sectionHeaderHeight = 10;
        _tableView.contentInset = UIEdgeInsetsMake(10-35, 0, 0, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = [UIView new];
        _tableView.scrollEnabled = NO;
        UIView *view = [UIView new];
        UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [logoutBtn setTitle:@"退出登入" forState:UIControlStateNormal];
        logoutBtn.frame = CGRectMake(50, 20, kScreenwidth-100, 50);
        logoutBtn.backgroundColor = [UIColor redColor];
        [view addSubview:logoutBtn];
        view.frame = CGRectMake(0, 0, kScreenwidth, 100);
        _tableView.tableFooterView = view;
    }
    return _tableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 1;
    }
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listDatas.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.listDatas[indexPath.section][@"title"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1){
        HelpViewController *helpVC = [HelpViewController new];
        [self.navigationController pushViewController:helpVC animated:YES];
    }else if (indexPath.section == 2){
        AboutViewController *aboutVC = [AboutViewController new];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
}

@end
