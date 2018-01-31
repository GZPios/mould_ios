//
//  SMSLoginView.h
//  mould_ios
//
//  Created by apple on 2018/1/24.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SMSLoginDelegate<NSObject>

-(void)regist:(UITapGestureRecognizer *)sender;

-(void)psdLogin:(UITapGestureRecognizer *)sender;

-(void)agreement:(UITapGestureRecognizer *)sender;

-(void)login:(UIButton *)sender;

-(void)loginWithQQ:(UIButton *)sender;

-(void)loginWithWeiBo:(UIButton *)sender;

-(void)loginWithWeiXin:(UIButton *)sender;

-(void)getCode:(UITapGestureRecognizer *)sender;

@end



@interface SMSLoginView : UIView

@property(nonatomic, weak)id<SMSLoginDelegate> delegate;

@property(nonatomic, strong)UIImageView *logoImgView;

@property(nonatomic, strong)UITextField *accTextField;

@property(nonatomic, strong)UITextField *codeTextField;

@property(nonatomic, strong)UILabel *codeLabel;

@property(nonatomic, strong)UIButton *loginBtn;

@property(nonatomic, strong)UILabel *agreementLabel;

@property(nonatomic, strong)UILabel *psdLabel;

@property(nonatomic, strong)UILabel *registLabel;

@property(nonatomic, strong)UIButton *weiboBtn;

@property(nonatomic, strong)UIButton *weixinBtn;

@property(nonatomic, strong)UIButton *qqBtn;

@end
