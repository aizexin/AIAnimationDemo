//
//  AISettingViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/10.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AISettingViewController.h"
#import "AISettingTableViewCell.h"
@interface AISettingViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView */
@property (strong,nonatomic)UITableView *tableView;
/** 数据源 */
@property (strong,nonatomic)NSMutableArray *dataSource;
@end

@implementation AISettingViewController


#pragma mark -lazy
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource    = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    }
    return _dataSource;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        [_tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 46;
        _tableView.backgroundColor = [UIColor colorWithRed:0.9412 green:0.9412 blue:0.9412 alpha:1.0];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark -UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AISettingTableViewCell *cell  = [AISettingTableViewCell createTableViewCellWithTableView:tableView];
    cell.tipsLabel.text                = self.dataSource[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;//self.dataSource[section].count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0 ? 50:46;
}

@end
