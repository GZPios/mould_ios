//
//  LoginView.m
//  mould_ios
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "LoginView.h"

@interface LoginView()

@end

@implementation LoginView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.logoImgView.image = [UIImage imageNamed:@"logo"];
        self.accTextField.placeholder = @"请输入账号";
        self.psdTextField.placeholder = @"请输入密码";
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        self.agreementLabel.text = @"用户服务协议";
        self.registLabel.text = @"注册";
        self.smsLabel.text = @"短信登录";
        [self.qqBtn setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
        [self.weixinBtn setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
        [self.weiboBtn setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    }
    return self;
}

-(UIImageView *)logoImgView{
    if (!_logoImgView) {
        _logoImgView = [UIImageView new];
        [self addSubview:_logoImgView];
        [_logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self).offset(100);
            make.width.height.mas_equalTo(64);
        }];
    }
    return _logoImgView;
}

-(UITextField *)accTextField{
    if (!_accTextField) {
        _accTextField = [UITextField new];
        _accTextField.font = Font(14);
        _accTextField.layer.borderWidth = 0.5f;
        _accTextField.layer.cornerRadius = 20;
        _accTextField.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:_accTextField];
        [_accTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.left.mas_equalTo(40);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(self.logoImgView.mas_bottom).offset(60);
        }];
    }
    return _accTextField;
}

-(UITextField *)psdTextField{
    if (!_psdTextField) {
        _psdTextField = [UITextField new];
        _psdTextField.font = Font(14);
        _psdTextField.layer.borderWidth = 0.5f;
        _psdTextField.layer.cornerRadius = 20;
        _psdTextField.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:_psdTextField];
        [_psdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.left.mas_equalTo(_accTextField);
            make.height.mas_equalTo(_accTextField);
            make.top.mas_equalTo(self.accTextField.mas_bottom).offset(30);
        }];
    }
    return _psdTextField;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn addTarget:self action:@selector(didLogin:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.backgroundColor = [UIColor redColor];
        _loginBtn.layer.cornerRadius = 20;
        [self addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.left.mas_equalTo(_psdTextField);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(_psdTextField.mas_bottom).offset(30);
        }];
    }
    return _loginBtn;
}

-(UILabel *)agreementLabel{
    if (!_agreementLabel) {
        _agreementLabel = [UILabel new];
        _agreementLabel.font = Font(12);
        [self addSubview:_agreementLabel];
        _agreementLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didAgreement:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired  = 1;
        [_agreementLabel addGestureRecognizer:tap];
        
        [_agreementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(40);
            make.bottom.mas_equalTo(self).offset(-20);
        }];
    }
    return _agreementLabel;
}

-(UILabel *)registLabel{
    if (!_registLabel) {
        _registLabel = [UILabel new];
        _registLabel.font = Font(12);
        _registLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didRegist:)];
        tap.numberOfTapsRequired =1;
        tap.numberOfTouchesRequired  =1;
        [_registLabel addGestureRecognizer:tap];
        [self addSubview:_registLabel];
        [_registLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).offset(-40);
            make.bottom.mas_equalTo(_agreementLabel);
        }];
    }
    return _registLabel;
}

-(UILabel *)smsLabel{
    if (!_smsLabel) {
        _smsLabel = [UILabel new];
        _smsLabel.font = Font(12);
        _smsLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didSMSLogin:)];
        tap.numberOfTapsRequired =1;
        tap.numberOfTouchesRequired  =1;
        [_smsLabel addGestureRecognizer:tap];

        [self addSubview:_smsLabel];
        [_smsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_registLabel.mas_left).offset(-20);
            make.bottom.mas_equalTo(_registLabel);
        }];
    }
    return _smsLabel;
}

-(UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqBtn addTarget:self action:@selector(didQQ:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:_qqBtn];
        [_qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(_loginBtn.mas_bottom).offset(20);
            make.width.height.mas_equalTo(32);
        }];
    }
    return _qqBtn;
}

-(UIButton *)weiboBtn{
    if (!_weiboBtn) {
        _weiboBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weiboBtn addTarget:self action:@selector(didWeiXin:) forControlEvents:UIControlEventTouchUpInside];
        [_weiboBtn setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
        [self addSubview:_weiboBtn];
        [_weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_qqBtn.mas_left).offset(-20);
            make.top.mas_equalTo(_loginBtn.mas_bottom).offset(20);
            make.width.height.mas_equalTo(32);
        }];
    }
    return _weiboBtn;
}

-(UIButton *)weixinBtn{
    if (!_weixinBtn) {
        _weixinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weixinBtn addTarget:self action:@selector(didWeiXin:) forControlEvents:UIControlEventTouchUpInside];
        [_weixinBtn setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
        [self addSubview:_weixinBtn];
        [_weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_qqBtn.mas_right).offset(20);
            make.top.mas_equalTo(_loginBtn.mas_bottom).offset(20);
            make.width.height.mas_equalTo(32);
        }];
    }
    return _weixinBtn;
}


#pragma mark - Event

-(void)didLogin:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(login:)]) {
        [_delegate login:sender];
    }
}

-(void)didSMSLogin:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(smsLogin:)]) {
        [_delegate smsLogin:sender];
    }
}

-(void)didRegist:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(regist:)]) {
        [_delegate regist:sender];
    }
}

-(void)didAgreement:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(agreement:)]) {
        [_delegate agreement:sender];
    }
}

-(void)didQQ:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(loginWithQQ:)]) {
        [_delegate loginWithQQ:sender];
    }
}

-(void)didWeiBo:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(loginWithWeiBo:)]) {
        [_delegate loginWithWeiBo:sender];
    }
}

-(void)didWeiXin:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(loginWithWeiXin:)]) {
        [_delegate loginWithWeiXin:sender];
    }
}



@end
