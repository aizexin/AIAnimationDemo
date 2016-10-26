//
//  AIBaseFloatRangeGraphChartDataSource.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/24.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIBaseFloatRangeGraphChartDataSource.h"

@interface AIBaseFloatRangeGraphChartDataSource ()

@end
@implementation AIBaseFloatRangeGraphChartDataSource

/** 返回有几条线*/
-(NSInteger)numberOfPlotsInGraphChartView:(ORKGraphChartView *)graphChartView{
    return 2;//self.plotPoints.count;
}


/**
 Asks the data source for the number of range points to be plotted by the graph chart view at the
 specified plot index.
 
 @param graphChartView      The graph chart view asking for the number of range points.
 @param plotIndex           An index number identifying the plot in the graph chart view. This index
 is 0 in a single-plot graph chart view.
 
 @return The number of range points in the plot at `plotIndex`.
 */
- (NSInteger)graphChartView:(ORKGraphChartView *)graphChartView numberOfPointsForPlotIndex:(NSInteger)plotIndex{
    return self.plotPoints[plotIndex].count;
}

/**
 每个点的类型相当于tableView的cell
 Asks the data source for the range point to be plotted at the specified point index for the
 specified plot.
 
 @param graphChartView      The graph chart view that is asking for the range point.
 @param pointIndex          An index number identifying the range point in the graph chart view.
 @param plotIndex           An index number identifying the plot in the graph chart view. This index
 is 0 in a single-plot graph chart view.
 
 @return The range point specified by `pointIndex` in the plot specified by `plotIndex` for the
 specified graph chart view`.
 */
- (ORKRangedPoint *)graphChartView:(ORKGraphChartView *)graphChartView pointForPointIndex:(NSInteger)pointIndex plotIndex:(NSInteger)plotIndex{
//    ORKRangedPoint *point = [[ORKRangedPoint alloc]initWithValue:30];
    return self.plotPoints[plotIndex][pointIndex];
}

@end
