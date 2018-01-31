//
//  SMSLoginView.m
//  mould_ios
//
//  Created by apple on 2018/1/24.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "SMSLoginView.h"

@implementation SMSLoginView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.logoImgView.image = [UIImage imageNamed:@"logo"];
        self.accTextField.placeholder = @"请输入账号";
        self.codeTextField.placeholder = @"请输入验证码";
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        self.agreementLabel.text = @"用户服务协议";
        self.registLabel.text = @"注册";
        self.psdLabel.text = @"密码登录";
        self.codeLabel.text = @"获取验证码";
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

-(UITextField *)codeTextField{
    if (!_codeTextField) {
        _codeTextField = [UITextField new];
        _codeTextField.font = Font(14);
        _codeTextField.layer.borderWidth = 0.5f;
        _codeTextField.layer.cornerRadius = 20;
        _codeTextField.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:_codeTextField];
        [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.left.mas_equalTo(_accTextField);
            make.height.mas_equalTo(_accTextField);
            make.top.mas_equalTo(self.accTextField.mas_bottom).offset(30);
        }];
    }
    return _codeTextField;
}

-(UILabel *)codeLabel{
    if (!_codeLabel) {
        _codeLabel = [UILabel new];
        _codeLabel.font = Font(12);
        [self addSubview:_codeLabel];
        _codeLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didCode:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired  = 1;
        [_codeLabel addGestureRecognizer:tap];
        
        [_codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_codeTextField).offset(-20);
            make.centerY.mas_equalTo(_codeTextField);
        }];
    }
    return _codeLabel;
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
            make.left.mas_equalTo(_codeTextField);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(_codeTextField.mas_bottom).offset(30);
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

-(UILabel *)psdLabel{
    if (!_psdLabel) {
        _psdLabel = [UILabel new];
        _psdLabel.font = Font(12);
        _psdLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didPsdLogin:)];
        tap.numberOfTapsRequired =1;
        tap.numberOfTouchesRequired  =1;
        [_psdLabel addGestureRecognizer:tap];
        
        [self addSubview:_psdLabel];
        [_psdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_registLabel.mas_left).offset(-20);
            make.bottom.mas_equalTo(_registLabel);
        }];
    }
    return _psdLabel;
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

/**
 *  登录
 */
-(void)didLogin:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(login:)]) {
        [_delegate login:sender];
    }
}

/**
 *  密码登录
 */
-(void)didPsdLogin:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(psdLogin:)]) {
        [_delegate psdLogin:sender];
    }
}

/**
 *  发送验证码
 */
-(void)didCode:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(getCode:)]) {
        [_delegate getCode:sender];
    }
}

/**
 *  注册
 */
-(void)didRegist:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(regist:)]) {
        [_delegate regist:sender];
    }
}

/**
 *  用户协议
 */
-(void)didAgreement:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(agreement:)]) {
        [_delegate agreement:sender];
    }
}

/**
 *  QQ登录
 */
-(void)didQQ:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(loginWithQQ:)]) {
        [_delegate loginWithQQ:sender];
    }
}

/**
 *  微博登录
 */
-(void)didWeiBo:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(loginWithWeiBo:)]) {
        [_delegate loginWithWeiBo:sender];
    }
}

/**
 *  微信登录
 */
-(void)didWeiXin:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(loginWithWeiXin:)]) {
        [_delegate loginWithWeiXin:sender];
    }
}


@end
