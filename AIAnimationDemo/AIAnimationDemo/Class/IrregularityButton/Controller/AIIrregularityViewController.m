//
//  AIIrregularityViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/19.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIIrregularityViewController.h"
#import "AIIrregularityTableViewCell.h"
@interface AIIrregularityViewController ()<UITableViewDataSource,UITableViewDelegate>

/** tableView*/
@property(nonatomic,weak)UITableView *tableView;
/** 数据源*/
@property(nonatomic,strong)NSMutableArray *dataSource;
/** 标记cell*/
@property(nonatomic,assign)NSInteger numCell;
/** 定时器*/
@property(nonatomic,strong)NSTimer *timer;
/** 下载下来的数据源*/
@property(nonatomic,strong)NSMutableArray *loadArrayM;

@end

@implementation AIIrregularityViewController

-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        
    }
    return _dataSource;
}
-(NSMutableArray *)loadArrayM {
    if (!_loadArrayM) {
        _loadArrayM = [NSMutableArray array];
        for (int i = 10 ; i < 20; i++) {
            NSString *name = [NSString stringWithFormat:@"%d",i];
            [_loadArrayM addObject:name];
        }
    }
    return _loadArrayM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    tableView.delegate     = self;
    tableView.dataSource   = self;
    tableView.rowHeight    = 200.;
    tableView.separatorStyle = UITableViewCellAccessoryNone;
    self.tableView         = tableView;
    [self.view addSubview:tableView];
    [self loadCellWithRowAnimation];
}
- (void)loadCellWithRowAnimation {
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.3 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        if (_numCell >=self.loadArrayM.count) {
            _timer = nil;
            [_timer invalidate];
            return ;
        }
        [self.dataSource addObject:self.loadArrayM[_numCell]];
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:_numCell inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationTop];
        _numCell ++;
    }];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AIIrregularityTableViewCell *cell  = [AIIrregularityTableViewCell createTableViewCellWithTableView:tableView];
    cell.indexPath                     = indexPath;
    cell.imageName                     = self.dataSource[indexPath.row];
    return cell;
}
#pragma mark --UITableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AILog(@"点击了%ld",indexPath.row);
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.ai_y   -= indexPath.row * cell.ai_height *.5;
}



@end
