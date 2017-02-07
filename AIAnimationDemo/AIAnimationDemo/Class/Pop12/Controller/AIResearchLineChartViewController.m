//
//  AIResearchLineChartViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/24.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  researchKit的linechart

#import "AIResearchLineChartViewController.h"
#import <ResearchKit.h>
#import "AILineGraphChartDataSource.h"
#import "AILineGraphChartRefreshDateSource.h"
@interface AIResearchLineChartViewController ()

/** 数据源*/
@property(nonatomic,strong)AILineGraphChartDataSource *lineGraphChartDataSource;
/** 刷新数据源*/
@property(nonatomic,strong)AILineGraphChartRefreshDateSource *refreshDataSource;
/** 图表*/
@property(nonatomic,weak)ORKLineGraphChartView *chartView;
@end

@implementation AIResearchLineChartViewController

-(AILineGraphChartDataSource *)lineGraphChartDataSource{
    if (!_lineGraphChartDataSource) {
        _lineGraphChartDataSource = [[AILineGraphChartDataSource alloc]init];
    }
    return _lineGraphChartDataSource;
}
-(AILineGraphChartRefreshDateSource *)refreshDataSource {
    if (!_refreshDataSource) {
        _refreshDataSource = [[AILineGraphChartRefreshDateSource alloc]init];
    }
    return _refreshDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ORKLineGraphChartView *chartView = [[ORKLineGraphChartView alloc]initWithFrame:CGRectMake(0, 135, self.view.frame.size.width, 300)];
    self.chartView                   = chartView;
    chartView.dataSource             = self.lineGraphChartDataSource;
    [self.view addSubview:chartView];
    
    chartView.tintColor              = [UIColor purpleColor];
    chartView.showsVerticalReferenceLines   = YES;
    chartView.showsHorizontalReferenceLines = YES;
    
    chartView.axisColor                     = [UIColor redColor];
    chartView.verticalAxisTitleColor        = [UIColor redColor];
    chartView.referenceLineColor            = [UIColor orangeColor];
    chartView.scrubberLineColor             = [UIColor blueColor];
    chartView.scrubberThumbColor            = [UIColor greenColor];
    
//    chartView
    [chartView animateWithDuration:2.];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.chartView.dataSource       = self.refreshDataSource;
    [_chartView animateWithDuration:2.];
}


@end
