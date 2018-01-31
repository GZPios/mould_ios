//
//  SMSLoginViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/24.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "SMSLoginViewController.h"
#import "SMSLoginView.h"
#import "RegistViewController.h"
#import "LoginHandler.h"

@interface SMSLoginViewController ()<SMSLoginDelegate>
{
    NSTimer *timer;
    NSInteger timeValue;
    
}
@property(nonatomic,strong)SMSLoginView *smsLoginView;

@end

@implementation SMSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    timeValue = 20;
    self.title = @"短信登录";
    self.smsLoginView.delegate = self;
    
}


#pragma mark - delegate

/**
 *  登录
 */
-(void)login:(UIButton *)sender{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"15988888888" forKey:@"mobile"];
    [dic setObject:@"333333" forKey:@"smsscode"];
    
    [LoginHandler requestSMSLoginWithDic:dic success:^(id obj) {
        if ([obj[@"status"] isEqualToString:@"true"]) {
            NSLog(@"成功");
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"登录失败"];
            NSLog(@"错误");
        }
    } failed:^(id obj) {
        
    }];
}

/**
 *  获取验证码
 */
-(void)getCode:(UITapGestureRecognizer *)sender{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"1239999" forKey:@"token"];
    [dic setObject:@"15988888888" forKey:@"mobile"];
    [dic setObject:@"ased" forKey:@"captcha"];
    [dic setObject:@"login" forKey:@"type"];
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

/**
 *  QQ登录
 */
-(void)loginWithQQ:(UIButton *)sender{
    
}

/**
 *  微博登录
 */
-(void)loginWithWeiBo:(UIButton *)sender{
    
}

/**
 *  微信登录
 */
-(void)loginWithWeiXin:(UIButton *)sender{
    
}

/**
 *  用户协议
 */
-(void)agreement:(UITapGestureRecognizer *)sender{
    
}

/**
 *  短信登录
 */
-(void)psdLogin:(UITapGestureRecognizer *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  注册
 */
-(void)regist:(UITapGestureRecognizer *)sender{
    RegistViewController *registVC = [RegistViewController new];
    [self.navigationController pushViewController:registVC animated:YES];
}

#pragma mark - Timer

/**
 *  开启定时器
 */
-(void)startTime{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(didTimer:) userInfo:nil repeats:YES];
    self.smsLoginView.codeLabel.userInteractionEnabled = NO;
}

/**
 *  定时器方法
 */
-(void)didTimer:(NSTimer *)sender{
    if (timeValue == 0) {
        [self stopTime];
    }else{
        self.smsLoginView.codeLabel.text = [NSString stringWithFormat:@"%ld",(long)timeValue];
    }
    timeValue--;
}

/**
 *  停止定时器
 */
-(void)stopTime{
    [timer invalidate];
    timeValue = 20;
    self.smsLoginView.codeLabel.userInteractionEnabled = YES;
    self.smsLoginView.codeLabel.text = @"获取验证码";
}


#pragma mark - View

-(SMSLoginView *)smsLoginView{
    if (!_smsLoginView) {
        _smsLoginView = [SMSLoginView new];
        [self.view addSubview:_smsLoginView];
        [_smsLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
    }
    return _smsLoginView;
}

-(void)dealloc{
    [self stopTime];
}
@end
