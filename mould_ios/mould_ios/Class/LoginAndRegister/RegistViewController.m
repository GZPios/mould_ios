//
//  RegistViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistView.h"
#import "LoginHandler.h"

@interface RegistViewController ()<RegistDelegate>
{
    NSTimer *timer;
    NSInteger timeValue;
}
@property(nonatomic, strong)RegistVIew *registView;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    timeValue = 20;
    self.registView.delegate = self;
}


#pragma mark - delegate

-(void)login:(UITapGestureRecognizer *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)regist:(UIButton *)sender{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.registView.accTextField.text forKey:@"mobile"];
    [dic setObject:self.registView.codeTextField.text forKey:@"smsscode"];
    [dic setObject:self.registView.psdTextField.text forKey:@"password"];
    [dic setObject:@"" forKey:@"invite_code"];
    [LoginHandler requestRegisterWithDic:dic success:^(id obj) {
        NSLog(@"%@",obj);
        if ([obj[@"status"]isEqualToString:@"true"]) {
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        }else{
             [SVProgressHUD showErrorWithStatus:@"注册失败"];
        }
    } failed:^(id obj) {
        NSLog(@"%@",obj);
    }];
}

-(void)getCode:(UITapGestureRecognizer *)sender{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"1239999" forKey:@"token"];
    [dic setObject:@"15988888888" forKey:@"mobile"];
    [dic setObject:@"ased" forKey:@"captcha"];
    [dic setObject:@"reg" forKey:@"type"];
    [LoginHandler requestSMSCodeWithDic:dic success:^(id obj) {
        if ([obj[@"status"]isEqualToString:@"true"]) {
            [SVProgressHUD showSuccessWithStatus:@"已发送验证到手机，请注意查看"];
            [self startTime];
        }else{
            [SVProgressHUD showErrorWithStatus:@"发送失败"];
        }
    } failed:^(id obj) {
        NSLog(@"%@",obj);
    }];
}

-(void)agreement:(UITapGestureRecognizer *)sender{
    
}

-(void)startTime{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(didTimer:) userInfo:nil repeats:YES];
    self.registView.codeLabel.userInteractionEnabled = NO;
}

-(void)didTimer:(NSTimer *)sender{
    if (timeValue == 0) {
        [self stopTime];
    }else{
        self.registView.codeLabel.text = [NSString stringWithFormat:@"%ld",(long)timeValue];
    }
    timeValue--;
}

-(void)stopTime{
    [timer invalidate];
    timeValue = 20;
    self.registView.codeLabel.userInteractionEnabled = YES;
    self.registView.codeLabel.text = @"获取验证码";
}


#pragma mark - view

-(RegistVIew *)registView{
    if (!_registView) {
        _registView = [RegistVIew new];
        [self.view addSubview:_registView];
        [_registView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
    }
    return _registView;
}


-(void)dealloc{
    [self stopTime];
}

@end
