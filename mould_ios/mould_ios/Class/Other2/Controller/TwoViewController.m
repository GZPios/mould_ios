//
//  TwoViewController.m
//  mould_ios
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 gzp. All rights reserved.
//

#import "TwoViewController.h"
#import "MJRefresh.h"
#import "ContentCell.h"
#import "ContentHandler.h"
#import "ContentModel.h"

#import "JXSegment.h"
#import "JXPageView.h"

@interface TwoViewController ()<JXSegmentDelegate,JXPageViewDataSource,JXPageViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    JXPageView *pageView;
    JXSegment *segment;
}
@property(nonatomic,strong) NSArray *channelArray;

@property(nonatomic,strong)NSMutableArray *models;

@property(nonatomic,strong)NSMutableArray *tableViews;

@property(nonatomic,assign)NSInteger typeNum;

@property(nonatomic,assign)NSInteger pageIndex;

@property(nonatomic,strong)NSMutableArray *typeModels;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageIndex = 0;
    _typeNum = 0;
    self.automaticallyAdjustsScrollViewInsets = NO;
    segment = [[JXSegment alloc] initWithFrame:CGRectMake(0, 60, kScreenwidth, 60)];
    [segment updateChannels:self.channelArray];
    segment.delegate = self;
    [self.view addSubview:segment];
    pageView =[[JXPageView alloc] initWithFrame:CGRectMake(0, 120, kScreenwidth, self.view.bounds.size.height - 120)];
    pageView.datasource = self;
    pageView.delegate = self;
    [pageView reloadData];
    [pageView changeToItemAtIndex:0];
    [self.view addSubview:pageView];

    [self requestPullUpWithNumber:@"0" AndTypeID:@"0"];
    
}

-(void)requestPullUpWithNumber:(NSString *)pageIndex AndTypeID:(NSString *)type{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:pageIndex forKey:@"page"];
    [dic setValue:type forKey:@"cateid"];
    NSLog(@"%@",dic);
    [ContentHandler requestPullUpWithSuccessWithDict:dic success:^(id obj) {
        [self endRefresh];
       
        if ([pageIndex isEqualToString:@"0"]) {
            [self.models removeAllObjects];
        }
        __block NSMutableArray *modelarr = [NSMutableArray array];
        [obj[@"data"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ContentModel *model = [[ContentModel alloc]initWithData:obj];
            [self.models addObject:model];
            [modelarr addObject:model];
        }];
        
        if (![self isHasData]) {

            [self.typeModels addObject:modelarr];
            NSLog(@"%@",self.typeModels);
        }else{
            NSLog(@"%@,%@",self.typeModels[_typeNum],self.models);
            if ([self.typeModels[_typeNum] isEqual:modelarr]) {
                NSLog(@"数据相同");
            }else{
                NSLog(@"数据不同,更新数组");
                [self.typeModels replaceObjectAtIndex:_typeNum withObject:self.models];
            }
        }
        [self.tableViews[_typeNum] reloadData];
        
    } failed:^(id obj) {
            
    }];
}


-(NSMutableArray *)models{
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}

-(NSMutableArray *)typeModels{
    if (!_typeModels) {
        _typeModels = [NSMutableArray array];
    }
    return _typeModels;
}

-(NSMutableArray *)tableViews{
    if (!_tableViews) {
        _tableViews = [NSMutableArray array];
    }
    return _tableViews;
}

- (NSArray*)channelArray{
    if (_channelArray == nil) {
        _channelArray = @[@"推荐",@"欧美",@"国内",@"日韩"];
    }
    return _channelArray;
}

#pragma mark - JXPageViewDataSource
-(NSInteger)numberOfItemInJXPageView:(JXPageView *)pageView{
    return self.channelArray.count;
}

-(UIView*)pageView:(JXPageView *)pageView viewAtIndex:(NSInteger)index{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[ContentCell class] forCellReuseIdentifier:@"contentCell"];
    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self pulldown];
    }];
    
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self pullUp];
    }];
    
    tableView.tableFooterView  = [UIView new];
    
    [self.tableViews addObject:tableView];
  
    NSLog(@"%lu",(unsigned long)_tableViews.count);
    
    return tableView;
}

-(void)pulldown{
    self.pageIndex = 0;
    [self requestPullUpWithNumber:@"0" AndTypeID:[NSString stringWithFormat:@"%ld",(long)_typeNum]];
}

-(void)pullUp{
    self.pageIndex ++;
    [self requestPullUpWithNumber:[NSString stringWithFormat:@"%ld",_pageIndex] AndTypeID:[NSString stringWithFormat:@"%ld",_typeNum]];
}

-(void)endRefresh{
    UITableView *tableview = self.tableViews[_typeNum];
    [tableview.mj_header endRefreshing];
    [tableview.mj_footer endRefreshing];
}


#pragma mark - JXSegmentDelegate
- (void)JXSegment:(JXSegment*)segment didSelectIndex:(NSInteger)index{
    [pageView changeToItemAtIndex:index];
    NSLog(@"----%ld",(long)index);
}

#pragma mark - JXPageViewDelegate
- (void)didScrollToIndex:(NSInteger)index{
    NSLog(@"index:%ld",(long)index);
    
    [segment didChengeToIndex:index];
    
    _typeNum = index;
    
    if (![self isHasData]) {
        NSLog(@"---没有数据");
        [self requestPullUpWithNumber:@"0" AndTypeID:[NSString stringWithFormat:@"%ld",(long)_typeNum]];
    }else{
        NSLog(@"---有数据");
        UITableView *table = self.tableViews[index];
        self.models = self.typeModels[index];
        [table reloadData];
    }
}

-(BOOL)isHasData{
    if (!self.typeModels.count) {
        return NO;
    }else if (self.typeModels.count-1 < _typeNum) {
        return NO;
    }else{
        return YES;
    }
}




#pragma mark  -tableView delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
    if (!cell) {
        cell = [[ContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contentCell"];
    }
    ContentModel *model = self.models[indexPath.row];
    cell.titleLabel.text = model.title;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
