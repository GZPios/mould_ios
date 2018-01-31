//
//  RegistVIew.m
//  mould_ios
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "RegistVIew.h"

@interface RegistVIew()
{
    NSInteger timeValue;
    NSTimer *timer;
}
@end

@implementation RegistVIew


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        timeValue = 20;
        self.backgroundColor = [UIColor whiteColor];
        self.logoImgView.image = [UIImage imageNamed:@"logo"];
        self.accTextField.placeholder = @"请输入手机号";
        self.psdTextField.placeholder = @"请输入密码";
        self.codeTextField.placeholder = @"请输入验证码";
        [self.registBtn setTitle:@"注册" forState:UIControlStateNormal];
        self.agreementLabel.text = @"用户协议及隐私政策";
        self.loginLabel.text = @"有账号去登录";
        self.codeLabel.text = @"获取验证码";
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
            make.top.mas_equalTo(_logoImgView.mas_bottom).offset(60);
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
            make.top.mas_equalTo(_accTextField.mas_bottom).offset(30);
        }];
    }
    return _psdTextField;
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
            make.top.mas_equalTo(_psdTextField.mas_bottom).offset(30);
        }];
    }
    return _codeTextField;
}




-(UIButton *)registBtn{
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registBtn addTarget:self action:@selector(didRegist:) forControlEvents:UIControlEventTouchUpInside];
        _registBtn.backgroundColor = [UIColor redColor];
        _registBtn.layer.cornerRadius = 20;
        [self addSubview:_registBtn];
        [_registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.left.mas_equalTo(_psdTextField);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(_codeTextField.mas_bottom).offset(30);
        }];
    }
    return _registBtn;
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



-(UILabel *)loginLabel{
    if (!_loginLabel) {
        _loginLabel = [UILabel new];
        _loginLabel.font = Font(12);
        _loginLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didLogin:)];
        tap.numberOfTapsRequired =1;
        tap.numberOfTouchesRequired  =1;
        [_loginLabel addGestureRecognizer:tap];
        [self addSubview:_loginLabel];
        [_loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).offset(-40);
            make.bottom.mas_equalTo(_agreementLabel);
        }];
    }
    return _loginLabel;
}

#pragma mark - Event

-(void)didRegist:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(regist:)]) {
        [_delegate regist:sender];
    }
}

-(void)didLogin:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(login:)]) {
        [_delegate login:sender];
    }
}

-(void)didAgreement:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(agreement:)]) {
        [_delegate agreement:sender];
    }
}

-(void)didCode:(UITapGestureRecognizer *)sender{
    if ([_delegate respondsToSelector:@selector(getCode:)]) {
        [_delegate getCode:sender];
    }
}







@end



