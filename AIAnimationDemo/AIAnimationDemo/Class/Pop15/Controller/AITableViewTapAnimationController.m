//
//  AITableViewTapAnimationController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  tableView点击动画

#import "AITableViewTapAnimationController.h"
#import "AITapTableViewCell.h"
@interface AITableViewTapAnimationController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView                        *tableView;
/** 数据源*/
@property(nonatomic, strong)NSMutableArray *dataSource;
@end

@implementation AITableViewTapAnimationController

#pragma mark -lazy
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        NSArray *array = @[[AITapModel initWithTitle:@"11111" andIsSelected:YES],
                           [AITapModel initWithTitle:@"22222" andIsSelected:NO],
                           [AITapModel initWithTitle:@"33333" andIsSelected:NO]
                           ];
        _dataSource = [NSMutableArray arrayWithArray:array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

-(void)setUI{
    self.tableView                    = \
    [[UITableView alloc]initWithFrame:CGRectMake(0, AINavgationBarH, MainSize.width, MainSize.height - AINavgationBarH) style:(UITableViewStylePlain)];
    self.tableView.dataSource         = self;
    self.tableView.separatorStyle     = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}


#pragma mark --UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AITapTableViewCell *cell = [AITapTableViewCell createCellWithTabelView:tableView];
    cell.tapModel            = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
