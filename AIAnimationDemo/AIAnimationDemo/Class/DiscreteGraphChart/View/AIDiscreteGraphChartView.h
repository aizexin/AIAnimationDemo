//
//  AIDiscreteGraphChartView.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/9.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIDiscreteGraphChartCell.h"
@class AIDiscreteGraphChartView;
@protocol AIDiscreteGraphChartDataSource <NSObject>

@required
/**
 返回离散图的每一个cell

 @param chartView 离散图
 @return cell
 */
- (AIDiscreteGraphChartCell*)discreteGraphChartView:(AIDiscreteGraphChartView*)chartView indexCell:(NSInteger)indexCell;

/**
 返回有多少个cell

 @param chartView 离散图
 @return 返回几个cell
 */
- (NSInteger)numberOfCellDiscreteGraphChartView:(AIDiscreteGraphChartView*)chartView;

@optional

/**
 返回x轴的名字

 @param chartView 离散图
 @param indexCell 位置
 @return x轴的名字
 */
- (NSString*)discreteGraphChartView:(AIDiscreteGraphChartView*)chartView titleXAxleWithIndexCell:(NSInteger)indexCell;

@end

@interface AIDiscreteGraphChartView : UIView


/** 最大值*/
@property(nonatomic, assign)CGFloat maxValue;
/** 数据源*/
@property(nonatomic,weak)id<AIDiscreteGraphChartDataSource> pointDataSource;
/** x真实数据*/
@property(nonatomic,strong)NSMutableArray *xExistArrayM;
/** x显示数据*/
@property(nonatomic,strong)NSMutableArray *xShowArrayM;


/**
 刷新
 */
- (void)reloadData;

@end
