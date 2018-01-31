//
//  LoginView.h
//  mould_ios
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginDelegate<NSObject>

-(void)regist:(UITapGestureRecognizer *)sender;

-(void)smsLogin:(UITapGestureRecognizer *)sender;

-(void)agreement:(UITapGestureRecognizer *)sender;

-(void)login:(UIButton *)sender;

-(void)loginWithQQ:(UIButton *)sender;

-(void)loginWithWeiBo:(UIButton *)sender;

-(void)loginWithWeiXin:(UIButton *)sender;
@end

@interface LoginView : UIView

@property(nonatomic, weak)id<LoginDelegate> delegate;

@property(nonatomic, strong)UIImageView *logoImgView;

@property(nonatomic, strong)UITextField *accTextField;

@property(nonatomic, strong)UITextField *psdTextField;

@property(nonatomic, strong)UIButton *loginBtn;

@property(nonatomic, strong)UILabel *agreementLabel;

@property(nonatomic, strong)UILabel *smsLabel;

@property(nonatomic, strong)UILabel *registLabel;

@property(nonatomic, strong)UIButton *weiboBtn;

@property(nonatomic, strong)UIButton *weixinBtn;

@property(nonatomic, strong)UIButton *qqBtn;

@end
