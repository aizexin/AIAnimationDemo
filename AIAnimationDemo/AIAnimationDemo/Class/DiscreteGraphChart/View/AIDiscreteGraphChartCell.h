//
//  AIDiscreteGraphChartCell.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/9.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIDiscretePointModel.h"

@interface AIDiscreteGraphChartCell : UIView
/** 数据源*/
@property(nonatomic,strong)NSMutableArray<AIDiscretePointModel*> *pointsArrayM;
/**
 最大值
 */
@property(nonatomic,assign)CGFloat maxValue;
@end
