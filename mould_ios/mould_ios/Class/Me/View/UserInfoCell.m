//
//  UserInfoCell.m
//  mould_ios
//
//  Created by apple on 2018/1/25.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "UserInfoCell.h"

@implementation UserInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.accLabel];
        [self.accLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.right.mas_equalTo(-30);
        }];
    }
    return self;
}



-(UILabel *)accLabel{
    if (!_accLabel) {
        _accLabel = [UILabel new];
         _accLabel.textColor = [UIColor colorWithRed:108 / 255.0 green:108 / 255.0 blue:108 / 255.0 alpha:1];
    }
    
    return _accLabel;
}


@end
