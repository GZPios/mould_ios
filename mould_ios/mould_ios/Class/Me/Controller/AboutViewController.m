//
//  AboutViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/25.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *listDatas;
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"关于";
    [self.view addSubview:self.tableView];
}

-(NSArray *)listDatas{
    if (!_listDatas) {
        _listDatas = [Tools arrayByPlistWthFileName:@"AboutList"];
    }
    return _listDatas;
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionFooterHeight = 0;
        _tableView.sectionHeaderHeight = 0;
        _tableView.scrollEnabled = NO;
        
        UIView *view = [UIView new];
        view.frame = CGRectMake(0, 0, kScreenwidth, 200);
        _tableView.tableHeaderView = view;
        
        UIImageView *logoImgView = [UIImageView new];
        logoImgView.image = [UIImage imageNamed:@"logo"];
        [view addSubview:logoImgView];
        [logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view);
            make.width.height.mas_equalTo(50);
            make.top.mas_equalTo(40);
        }];
        
        UILabel *versionsLabel = [UILabel new];
        versionsLabel.text = @"版本:1.1.10";
        [view addSubview:versionsLabel];
        [versionsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view);
            make.top.mas_equalTo(logoImgView.mas_bottom).offset(30);
        }];
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
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
    cell.textLabel.text = self.listDatas[indexPath.section];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    }else{
        
    }
}


@end
