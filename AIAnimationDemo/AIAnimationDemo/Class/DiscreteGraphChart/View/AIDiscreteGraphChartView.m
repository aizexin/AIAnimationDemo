//
//  AIDiscreteGraphChartView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/9.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDiscreteGraphChartView.h"

@interface AIDiscreteGraphChartView ()
@property(nonatomic,assign)CGFloat cellWith;
/** 图像部分*/
@property(nonatomic,weak)UIView *chartView;
/** 用来装所有的cell*/
@property(nonatomic,strong)NSMutableArray *cellArrayM;
@end
@implementation AIDiscreteGraphChartView

#pragma mark -lazy
-(NSMutableArray *)cellArrayM {
    if (!_cellArrayM) {
        _cellArrayM = [NSMutableArray array];
    }
    return _cellArrayM;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图部分
        UIView *chartView = [[UIView alloc]init];
        [self addSubview:chartView];
        
        NSInteger number = [self.dataSource numberOfCellDiscreteGraphChartView:self];
        _cellWith        = self.chartView.bounds.size.width /(CGFloat)number;
        for (int i = 0; i < number ; i++) {
            AIDiscreteGraphChartCell *cell = [self.dataSource discreteGraphChartView:self indexCell:i];
            [self.chartView addSubview:cell];
            [self.cellArrayM addObject:cell];
        }
        //布局
        [self fitUI];
    }
    return self;
}

- (void)fitUI {
    [self.chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-30);
    }];
    AIDiscreteGraphChartCell *lastCell = [self.cellArrayM firstObject];
    for (AIDiscreteGraphChartCell *cell in self.cellArrayM) {
        [cell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lastCell.mas_right);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(self.chartView).dividedBy(self.cellArrayM.count);
        }];
        lastCell = cell;
    }
}

///**
// 计算最大的值
//
// @param points 要计算的点
// @return
// */
//- (CGFloat)calculationMaxValueWithPoints:(NSMutableArray*)points {
//
//}

#pragma mark -public

-(void)reloadData {
    
}

-(void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
}

@end
