//
//  RegistVIew.h
//  mould_ios
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RegistDelegate<NSObject>

-(void)login:(UITapGestureRecognizer *)sender;

-(void)agreement:(UITapGestureRecognizer *)sender;

-(void)regist:(UIButton *)sender;

-(void)getCode:(UITapGestureRecognizer *)sender;

@end

@interface RegistVIew : UIView

@property(nonatomic, weak)id<RegistDelegate> delegate;

@property(nonatomic, strong)UIImageView *logoImgView;

@property(nonatomic, strong)UITextField *accTextField;

@property(nonatomic, strong)UITextField *psdTextField;

@property(nonatomic, strong)UITextField *codeTextField;

@property(nonatomic, strong)UIButton *registBtn;

@property(nonatomic, strong)UILabel *agreementLabel;

@property(nonatomic, strong)UILabel *codeLabel;

@property(nonatomic, strong)UILabel *loginLabel;

@end
