//
//  UserInfoViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/25.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoCell.h"

#import "WYGenderPickerView.h"
#import "WYCityPickerView.h"
#import "WYBirthdayPickerView.h"

@interface UserInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *listDatas;
@property(nonatomic,strong)UITableView *tableView;

@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *birthday;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"账户信息";
    
    [self.view addSubview:self.tableView];
}


-(NSArray *)listDatas{
    if (!_listDatas) {
        _listDatas = [Tools arrayByPlistWthFileName:@"UserInfoList"];
    }
    return _listDatas;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionFooterHeight = 0.01;
        _tableView.sectionHeaderHeight = 0.01;
        _tableView.tableFooterView = [UIView new];
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2||section == 4) {
        return 15;
    }
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listDatas.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UserInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.listDatas[indexPath.section][@"title"];
    if (indexPath.section == 2) {
        if (self.gender.length == 0) {
            cell.accLabel.text = @"请选择";
        }else{
            cell.accLabel.text = self.gender;
        }
    }else if (indexPath.section == 3){
        if (self.birthday.length == 0) {
            cell.accLabel.text = @"请选择";
        }else{
            cell.accLabel.text = self.birthday;
        }
    }else if (indexPath.section == 4){
        if (self.city.length == 0) {
            cell.accLabel.text = @"请选择";
        }else{
            cell.accLabel.text = self.city;
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSLog(@"0");
    }else if (indexPath.section == 1){
    
    }else if (indexPath.section == 2){
        
        // initialGender 参数 : genderPickerView 初始化显示时要显示的性别
        WYGenderPickerView *genderPickerView = [[WYGenderPickerView alloc] initWithInitialGender:self.gender];
        
        // 选择性别完成之后的回调 : 按自己的要求做相应的处理就可以了
        genderPickerView.confirmBlock = ^(NSString *selectedGender) {
            
            // 新数据提交服务器
            
            // 在提交成功的回调里修改本地变量并刷新 UI
            self.gender = selectedGender;
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:2]] withRowAnimation:(UITableViewRowAnimationNone)];
        };
        
        [self.tableView addSubview:genderPickerView];
    }else if (indexPath.section == 3){
        
        // initialDate 参数 : birthdayPickerView 初始化显示时要显示的日期
        WYBirthdayPickerView *birthdayPickerView = [[WYBirthdayPickerView alloc] initWithInitialDate:self.birthday];
        
        // 选择日期完成之后的回调 : 按自己的要求做相应的处理就可以了
        birthdayPickerView.confirmBlock = ^(NSString *selectedDate) {
            
            // 新数据提交服务器
            
            // 在提交成功的回调里修改本地变量并刷新 UI
            self.birthday = selectedDate;
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:3]] withRowAnimation:(UITableViewRowAnimationNone)];
        };
        
        [self.tableView addSubview:birthdayPickerView];
        
    }else if (indexPath.section == 4){
        // initialCity 参数 : cityPickerView 初始化显示时要显示的城市
        WYCityPickerView *cityPickerView = [[WYCityPickerView alloc] initWithInitialCity:self.city];
        
        // 选择城市完成之后的回调 : 按自己的要求做相应的处理就可以了
        cityPickerView.confirmBlock = ^(NSString *selectedCity) {
            
            // 新数据提交服务器
            
            // 在提交成功的回调里修改本地变量并刷新 UI
            self.city = selectedCity;
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:4]] withRowAnimation:(UITableViewRowAnimationNone)];
        };
        
        [self.tableView addSubview:cityPickerView];
    }else if (indexPath.section == 5){
        
    }
    
    
    
    
}





@end
