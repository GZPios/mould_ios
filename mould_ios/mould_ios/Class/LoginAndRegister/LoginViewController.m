//
//  LoginViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

#import "SMSLoginViewController.h"
#import "RegistViewController.h"

#import "LoginHandler.h"


@interface LoginViewController ()<LoginDelegate>

@property(nonatomic , strong)LoginView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.loginView.delegate = self;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBack:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

-(void)didLeftBack:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -

-(void)dismissVC{
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - delegate

-(void)login:(UIButton *)sender{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:_loginView.accTextField.text forKey:@"mobile"];
    [dic setObject:_loginView.psdTextField.text forKey:@"password"];
    
    [LoginHandler requestLoginWithDic:dic success:^(id obj) {
        if ([obj[@"status"] isEqualToString:@"true"]) {
            NSLog(@"成功");
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            [self dismissVC];
        }else{
            [SVProgressHUD showErrorWithStatus:@"登录失败"];
            NSLog(@"错误");
        }
    } failed:^(id obj) {
        [SVProgressHUD showErrorWithStatus:obj];
    }];
}

-(void)loginWithQQ:(UIButton *)sender{
    
}

-(void)loginWithWeiBo:(UIButton *)sender{
    
}

-(void)loginWithWeiXin:(UIButton *)sender{
    
}

-(void)agreement:(UITapGestureRecognizer *)sender{
    
}

/**
 *  短信登录
 */
-(void)smsLogin:(UITapGestureRecognizer *)sender{
    SMSLoginViewController *smsVC = [SMSLoginViewController new];
    [self.navigationController pushViewController:smsVC animated:YES];
}

/**
 *  注册
 */
-(void)regist:(UITapGestureRecognizer *)sender{
    RegistViewController *registVC = [RegistViewController new];
    [self.navigationController pushViewController:registVC animated:YES];
}


#pragma mark - View

-(LoginView *)loginView{
    if (!_loginView) {
        _loginView = [LoginView new];
        [self.view addSubview:_loginView];
        [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
    }
    return _loginView;
}

@end
