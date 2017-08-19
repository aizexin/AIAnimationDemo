//
//  AIBaseFloatRangeGraphChartDataSource.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/24.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ResearchKit.h>

@interface AIBaseFloatRangeGraphChartDataSource : NSObject<ORKGraphChartViewDataSource>
/** shujuaun*/
@property(nonatomic,strong)NSArray<NSArray<ORKRangedPoint*>*> *plotPoints;
- (ORKRangedPoint *)graphChartView:(ORKGraphChartView *)graphChartView pointForPointIndex:(NSInteger)pointIndex plotIndex:(NSInteger)plotIndex;
@end
