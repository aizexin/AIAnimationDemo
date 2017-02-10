//
//  AIDiscreteViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/9.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDiscreteViewController.h"
#import "AIDiscreteGraphChartView.h"
@interface AIDiscreteViewController ()<AIDiscreteGraphChartDataSource>

/** 点数据源*/
@property(nonatomic,strong)NSMutableArray *dataSource;
/** x真实数据*/
@property(nonatomic,strong)NSMutableArray *xExistArrayM;
/** x显示数据*/
@property(nonatomic,strong)NSMutableArray *xShowArrayM;
@end

@implementation AIDiscreteViewController

-(NSMutableArray *)xExistArrayM {
    if (!_xExistArrayM) {
        _xExistArrayM = [NSMutableArray arrayWithObjects:@"2017-02-01",@"2017-02-02",
                         @"2017-02-03",@"2017-02-04",@"2017-02-05",@"2017-02-06",
                         @"2017-02-07",@"2017-02-08",@"2017-02-09",@"2017-02-10",nil];
    }
    return _xExistArrayM;
}

-(NSMutableArray *)xShowArrayM {
    if (!_xShowArrayM) {
        _xShowArrayM = [NSMutableArray arrayWithObjects:@"2017-02-01",@"2017-02-07",@"2017-02-10", nil];
    }
    return _xShowArrayM;
}

-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        AIDiscretePointModel *model     = [[AIDiscretePointModel alloc]init];
        model.xValue                    = @"2017-02-01";
        model.yValue                    = @"50";
        model.color                     = [UIColor greenColor];
        [_dataSource addObject:model];
        AIDiscretePointModel *model2     = [[AIDiscretePointModel alloc]init];
        model2.xValue                    = @"2017-02-01";
        model2.yValue                    = @"60";
        model2.color                     = [UIColor greenColor];
        [_dataSource addObject:model2];
        AIDiscretePointModel *model3     = [[AIDiscretePointModel alloc]init];
        model3.xValue                    = @"2017-02-03";
        model3.yValue                    = @"20";
        model3.color                     = [UIColor greenColor];
        [_dataSource addObject:model3];
        AIDiscretePointModel *model4     = [[AIDiscretePointModel alloc]init];
        model4.xValue                    = @"2017-02-04";
        model4.yValue                    = @"10";
        model4.color                     = [UIColor redColor];
        [_dataSource addObject:model4];
        AIDiscretePointModel *model5     = [[AIDiscretePointModel alloc]init];
        model5.xValue                    = @"2017-02-05";
        model5.yValue                    = @"30";
        model5.color                     = [UIColor greenColor];
        [_dataSource addObject:model5];
        AIDiscretePointModel *model6     = [[AIDiscretePointModel alloc]init];
        model6.xValue                    = @"2017-02-06";
        model6.yValue                    = @"25";
        model6.color                     = [UIColor greenColor];
        [_dataSource addObject:model6];
        AIDiscretePointModel *model7     = [[AIDiscretePointModel alloc]init];
        model7.xValue                    = @"2017-02-07";
        model7.yValue                    = @"50";
        model7.color                     = [UIColor greenColor];
        [_dataSource addObject:model7];
        AIDiscretePointModel *model8     = [[AIDiscretePointModel alloc]init];
        model8.xValue                    = @"2017-02-08";
        model8.yValue                    = @"50";
        model8.color                     = [UIColor greenColor];
        [_dataSource addObject:model8];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //需要1，x真实数据  2x显示数据 3 点的数据
    AIDiscreteGraphChartView *chartView = [[AIDiscreteGraphChartView alloc]init];
    chartView.maxValue                  = 100.;
    chartView.dataSource                = self;
    chartView.xExistArrayM              = self.xExistArrayM;
    chartView.xShowArrayM               = self.xShowArrayM;
    [self.view addSubview:chartView];
    [chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.mas_equalTo(0);
    }];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark -AIDiscreteGraphChartDataSource 
-(AIDiscreteGraphChartCell *)discreteGraphChartView:(AIDiscreteGraphChartView *)chartView indexCell:(NSInteger)indexCell {
    AIDiscreteGraphChartCell *cell = [[AIDiscreteGraphChartCell alloc]init];
    cell.maxValue                  = 100;
    NSString *xTitle               = self.xExistArrayM[indexCell];
    NSMutableArray *pointsArrayM   = [NSMutableArray array];
    for (AIDiscretePointModel *model in self.dataSource) {
        if ([model.xValue isEqualToString:xTitle]) {
            [pointsArrayM addObject:model];
        }
    }
    cell.pointsArrayM              = pointsArrayM;
    return cell;
}
- (NSInteger)numberOfCellDiscreteGraphChartView:(AIDiscreteGraphChartView*)chartView {
    return self.xExistArrayM.count;
}



@end
