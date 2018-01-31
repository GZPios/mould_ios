//
//  MeHeadCellTableViewCell.m
//  mould_ios
//
//  Created by apple on 2018/1/17.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "MeHeadCellTableViewCell.h"

@implementation MeHeadCellTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUpContentView];
        
    }
    return self;
}


-(void)setUpContentView{
    [self.contentView addSubview:self.headImgView];
    [self.contentView addSubview:self.hollowImgView];
}

-(UIImageView *)headImgView{
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.frame = CGRectMake(20, 15, 40, 40);
        _headImgView.image = [UIImage imageNamed:@"Me_HeadImg"];
        _headImgView.backgroundColor = [UIColor grayColor];
    }
    return _headImgView;
}

-(UIImageView *)hollowImgView{
    if (!_hollowImgView) {
        _hollowImgView = [UIImageView new];
        _hollowImgView.backgroundColor = [UIColor grayColor];
    }
    return _hollowImgView;
}






@end
