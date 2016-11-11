//
//  AISettingViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/10.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AISettingViewController.h"
#import "AISettingTableViewCell.h"
#import "AISettingModelAdapter.h"
#import "AISettingModel.h"

#import "AIDestOneViewController.h"
@interface AISettingViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView */
@property (strong,nonatomic)UITableView *tableView;
/** 数据源 */
@property (strong,nonatomic)NSMutableArray<NSMutableArray<AISettingCellAdapter*> *> *dataSource;
@end

@implementation AISettingViewController


#pragma mark -lazy
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource            = [NSMutableArray array];
        //第一组
        NSMutableArray *group1 = [NSMutableArray array];
        UIImageView *imageiew  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banben"]];
        AISettingModel *model1 = [[AISettingModel alloc]initWithIcon:@"banben" title:@"版本" destClass:[AIDestOneViewController class] andAccessibilityView:imageiew];
        
        AISettingCellAdapter *adapter1 = [[AISettingModelAdapter alloc]initWithData:model1];
        [group1 addObject:adapter1];
        //第二组
        NSMutableArray *group2 = [NSMutableArray array];
        AISettingCellAdapter *adapter2 = [[AISettingModelAdapter alloc]init];
        [group2 addObject:adapter2];
        
        [_dataSource addObject:group1];
    }
    return _dataSource;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView                 =\
        [[UITableView alloc]initWithFrame:CGRectMake(0, AINavgationBarH, MainSize.width, MainSize.height - AINavgationBarH) style:(UITableViewStylePlain)];
        [_tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.rowHeight       = 46;
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
    AISettingTableViewCell *cell      = [AISettingTableViewCell createTableViewCellWithTableView:tableView];
    AISettingCellAdapter *cellAdapter = self.dataSource[indexPath.section][indexPath.row];
    cell.data                         = cellAdapter;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource[section].count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0 ? 50:46;
}

@end
