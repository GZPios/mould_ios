//
//  ContentCell.m
//  mould_ios
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "ContentCell.h"

@interface ContentCell()

//@property(nonatomic, strong)UIImageView *playbillImgView;

@end

@implementation ContentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     
        [self setUpContentView];
        [self layoutContentView];
    }
    return self;
}

-(void)setUpContentView{
    
    [self.contentView addSubview:self.playbillImgView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.author];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.numberComment];
    [self.contentView addSubview:self.comment];
    [self.contentView addSubview:self.numberRead];
    [self.contentView addSubview:self.read];
}

-(void)layoutContentView{
    
    [self.playbillImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(self.contentView);
        make.top.mas_equalTo(15);
        make.width.mas_equalTo(80);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.playbillImgView);
        make.left.mas_equalTo(self.playbillImgView.mas_right).offset(20);
    }];
    
    [self.author mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel);
        make.bottom.mas_equalTo(self.playbillImgView);
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.author.mas_right);
        make.centerY.mas_equalTo(self.author);
    }];
    
    [self.numberComment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.author);
        make.left.mas_equalTo(self.authorLabel.mas_right).offset(10);
    }];
    
    [self.comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.author);
        make.left.mas_equalTo(self.numberComment.mas_right);
    }];
    
    [self.numberRead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.author);
        make.left.mas_equalTo(self.comment.mas_right).offset(10);
    }];
    
    [self.read mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.author);
        make.left.mas_equalTo(self.numberRead.mas_right);
    }];
    
}


#pragma mark - lazy

-(UIImageView *)playbillImgView{
    if (!_playbillImgView) {
        _playbillImgView = [UIImageView new];
        _playbillImgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _playbillImgView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"名字";
    }
    return _titleLabel;
}

-(UILabel *)author{
    if (!_author) {
        _author = [UILabel new];
        _author.text = @"作者:";
        _author.font = [UIFont systemFontOfSize:12];
    }
    return _author;
}

-(UILabel *)authorLabel{
    if (!_authorLabel) {
        _authorLabel = [UILabel new];
        _authorLabel.text = @"高志平";
        _authorLabel.font = [UIFont systemFontOfSize:12];
    }
    return _authorLabel;
}

-(UILabel *)numberComment{
    if (!_numberComment) {
        _numberComment = [UILabel new];
        _numberComment.text = @"1111";
        _numberComment.font = [UIFont systemFontOfSize:12];
    }
    return _numberComment;
}

-(UILabel *)comment{
    if (!_comment) {
        _comment = [UILabel new];
        _comment.text = @"评论";
        _comment.font = [UIFont systemFontOfSize:12];
    }
    return _comment;
}

-(UILabel *)numberRead{
    if (!_numberRead) {
        _numberRead = [UILabel new];
        _numberRead.text = @"1111";
        _numberRead.font = [UIFont systemFontOfSize:12];
    }
    return _numberRead;
}

-(UILabel *)read{
    if (!_read) {
        _read = [UILabel new];
        _read.text = @"阅读";
        _read.font = [UIFont systemFontOfSize:12];
    }
    return _read;
}


@end
