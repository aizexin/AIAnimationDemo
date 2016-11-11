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
#import "PPNumberButton.h"
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
        UIImageView *imageiew  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrowRightLandscape"]];
        imageiew.frame         = CGRectMake(0, 0, 10, 20);
        AISettingModel *model1 = [[AISettingModel alloc]initWithIcon:@"banben" title:@"版本" destClass:[AIDestOneViewController class] andAccessibilityView:imageiew];
        
        AISettingCellAdapter *adapter1 = [[AISettingModelAdapter alloc]initWithData:model1];
        [group1 addObject:adapter1];
        
        //第二组
        NSMutableArray *group2         = [NSMutableArray array];
        UISwitch *switchBtn            = [[UISwitch alloc]init];
        [switchBtn addTarget:self action:@selector(onClickSwitch) forControlEvents:(UIControlEventTouchUpInside)];
        AISettingModel *model2         = [[AISettingModel alloc]initWithIcon:@"changjing" title:@"场景" destClass:nil andAccessibilityView:switchBtn];
        AISettingCellAdapter *adapter2 = [[AISettingModelAdapter alloc]initWithData:model2];
        [group2 addObject:adapter2];
        
        AISettingModel *model3          =\
        [[AISettingModel alloc]initWithIcon:@"guanyu" title:@"关于" destClass:nil andAccessibilityView:nil];
        [model3 setBlock:^{
            AILog(@"点击关于");
        }];
        AISettingCellAdapter *adapter3  = [[AISettingModelAdapter alloc]initWithData:model3];
        [group2 addObject:adapter3];
        
        //第三组
        NSMutableArray *group3          = [NSMutableArray array];
        PPNumberButton *number          = [[PPNumberButton alloc]init];
        AISettingModel *model31         =\
        [[AISettingModel alloc]initWithIcon:@"wangguan" title:@"网关" destClass:nil andAccessibilityView:number];
        
        AISettingCellAdapter *adapter31 = [[AISettingModelAdapter alloc]initWithData:model31];
        [group3 addObject:adapter31];
        
        [_dataSource addObject:group1];
        [_dataSource addObject:group2];
        [_dataSource addObject:group3];
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

#pragma mark --UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AISettingCellAdapter *cellAdapter = self.dataSource[indexPath.section][indexPath.row];
    if (cellAdapter.destVC) {//如果有目标控制器
        [self.navigationController pushViewController:[[cellAdapter.destVC alloc]init] animated:YES];
    }else if(cellAdapter.optionBlock){
        cellAdapter.optionBlock();
    }
}

#pragma mark --Action
-(void)onClickSwitch{
    AILog(@"点击switch");
}

@end
