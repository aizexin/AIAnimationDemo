//
//  AILineGraphChartRefreshDateSource.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/7.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AILineGraphChartRefreshDateSource.h"

@implementation AILineGraphChartRefreshDateSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        ORKRangedPoint *point00 = [[ORKRangedPoint alloc]init];
        
        ORKRangedPoint *point11 = [[ORKRangedPoint alloc]initWithValue:10];
        ORKRangedPoint *point12 = [[ORKRangedPoint alloc]initWithValue:35];
        ORKRangedPoint *point13 = [[ORKRangedPoint alloc]initWithValue:20];
        ORKRangedPoint *point14 = [[ORKRangedPoint alloc]initWithValue:10];
        
        ORKRangedPoint *point21 = [[ORKRangedPoint alloc]initWithValue:20];
        ORKRangedPoint *point22 = [[ORKRangedPoint alloc]initWithValue:4];
        ORKRangedPoint *point23 = [[ORKRangedPoint alloc]initWithValue:80];
        ORKRangedPoint *point24 = [[ORKRangedPoint alloc]initWithValue:6];
        ORKRangedPoint *point25 = [[ORKRangedPoint alloc]initWithValue:12];
        ORKRangedPoint *point26 = [[ORKRangedPoint alloc]initWithValue:20];
        ORKRangedPoint *point27 = [[ORKRangedPoint alloc]initWithValue:64];
        self.plotPoints = @[
                            @[point00,point11,point12,point00,point13,point14,point00],
                            @[point21,point22,point23,point24,point25,point26,point27],
                            @[point00,point00,point00,point00,point11,point12,point13,point14,point00]
                            ];
    }
    return self;
}


/**
 Asks the data source for the color of the specified plot.
 
 If this method is not implemented, the first plot uses the graph chart view `tintColor`, and
 all subsequent plots uses the current `referenceLineColor`.
 
 @param graphChartView      The graph chart view asking for the color of the segment.
 @param plotIndex           An index number identifying the plot in the graph chart view. This index
 is always 0 in single-plot graph chart views.
 
 @return The color of the segment at the specified index in a pie chart view.
 */
//- (UIColor *)graphChartView:(ORKGraphChartView *)graphChartView colorForPlotIndex:(NSInteger)plotIndex{
//
//}

/**
 Asks the data source which plot the scrubber should snap to in multigraph chart views.
 
 If this method is not implemented, the scrubber snaps over the first plot.
 
 @param graphChartView      The graph chart view asking for the scrubbing plot index.
 
 @return The index of the plot that the scrubber should snap to.
 */
- (NSInteger)scrubbingPlotIndexForGraphChartView:(ORKGraphChartView *)graphChartView{
    return 2;
}

/**
 Asks the data source for the upper limit of the y-axis drawn by the graph chart view.
 
 If this method is not implemented, the greatest `maximumValue` of all `ORKRangedPoint` instances
 returned in `graphChartView:plot:valueForPointAtIndex:` is used.
 
 See also: `graphChartView:plot:valueForPointAtIndex:`.
 
 @param graphChartView      The graph chart view asking for the maximum value.
 
 @return The maximum value of the y-axis drawn by `graphChartView`.
 */
- (CGFloat)maximumValueForGraphChartView:(ORKGraphChartView *)graphChartView{
    return 70.;
}

/**
 Asks the data source for the lower limit of the y-axis drawn by the graph chart view.
 
 If this method is not implemented, the smallest `minimumValue` of all ORKRangedPoint instances
 returned in `graphChartView:plot:valueForPointAtIndex:` is used.
 
 See also: `graphChartView:plot:valueForPointAtIndex:`.
 
 @param graphChartView      The graph chart view asking for the minimum value.
 
 @return The minimum value of the y-axis drawn by `graphChartView`.
 */
- (CGFloat)minimumValueForGraphChartView:(ORKGraphChartView *)graphChartView{
    return 0.;
}

/**
 Asks the data source for the number of divisions in the x-axis. The value is ignored if it is lower
 than the number of data points. A title appearing adjacent to each
 division may optionally be returned by the `graphChartView:titleForXAxisAtPointIndex:` method.
 
 @param graphChartView      The graph chart view asking for the number of divisions in its x-axis.
 
 @return The number of divisions in the x-axis for `graphChartView`.
 */
- (NSInteger)numberOfDivisionsInXAxisForGraphChartView:(ORKGraphChartView *)graphChartView{
    return 10;
}
/**
 Asks the data source for the title to be displayed adjacent to each division in the x-axis (the
 number returned by `numberOfDivisionsInXAxisForGraphChartView:`). You can return `nil` from this
 method if you don't want to display a title for the specified point index.
 
 If this method is not implemented, the x-axis has no titles.
 
 See also: `numberOfDivisionsInXAxisForGraphChartView:`.
 
 @param graphChartView  The graph chart view asking for the title.
 @param pointIndex      The index of the specified x-axis division.
 
 @return The title string to be displayed adjacent to each division of the x-axis of the graph chart
 view.
 */
- (nullable NSString *)graphChartView:(ORKGraphChartView *)graphChartView titleForXAxisAtPointIndex:(NSInteger)pointIndex{
    return [NSString stringWithFormat:@"----%ld-",pointIndex];
}

/**
 Asks the data source if the vertical reference line at the specified point index should be drawn..
 
 If this method is not implemented, the graph chart view will draw all vertical reference lines.
 
 @param graphChartView  The graph view asking for the tile.
 @param pointIndex      The index corresponding to the number returned by
 `numberOfDivisionsInXAxisForGraphChartView:`.
 
 @return Whether the graph chart view should draw the vertical reference line.
 */
- (BOOL)graphChartView:(ORKGraphChartView *)graphChartView drawsVerticalReferenceLineAtPointIndex:(NSInteger)pointIndex{
    return (pointIndex % 2 == 1) ? NO : YES;
}
@end
