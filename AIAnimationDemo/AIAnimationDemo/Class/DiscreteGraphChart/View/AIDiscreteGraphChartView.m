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
/** x轴*/
@property(nonatomic,weak)UIView *xAxleView;
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
        self.chartView    = chartView;
        [self addSubview:chartView];
        //x轴
        UIView *xAxleView = [[UIView alloc]init];
        self.xAxleView    = xAxleView;
        [self addSubview:xAxleView];
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
  
    [self.xAxleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.top.mas_equalTo(self.chartView.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark -public
-(void)reloadData {
    self.pointDataSource   = _pointDataSource;
    self.xExistArrayM = _xExistArrayM;
    self.xShowArrayM  = _xShowArrayM;
}

-(void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
}
-(void)setPointDataSource:(id<AIDiscreteGraphChartDataSource>)dataSource {
    _pointDataSource = dataSource;
    
    //先清空以前的数据
    [self.chartView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.cellArrayM = nil;
    
    NSInteger number = [self.pointDataSource numberOfCellDiscreteGraphChartView:self];
    _cellWith        = self.chartView.bounds.size.width /(CGFloat)number;
    for (int i = 0; i < number ; i++) {
        AIDiscreteGraphChartCell *cell = [self.pointDataSource discreteGraphChartView:self indexCell:i];
        [self.chartView addSubview:cell];
        [self.cellArrayM addObject:cell];
    }
    AIDiscreteGraphChartCell *lastCell;
    for (AIDiscreteGraphChartCell *cell in self.cellArrayM) {
        [cell mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastCell) {
                make.left.mas_equalTo(lastCell.mas_right);
            }else{
                make.left.mas_equalTo(0);
            }
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(self.chartView).dividedBy(self.cellArrayM.count);
        }];
        lastCell = cell;
    }
   
}
-(void)setXExistArrayM:(NSMutableArray *)xExistArrayM {
    _xExistArrayM = xExistArrayM;
    //清空以前的
    [self.xAxleView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //存在的都要添加上去
    for (NSString *title in xExistArrayM) {
        UILabel *xLabel      = [[UILabel alloc]init];
        xLabel.hidden        = YES;
        xLabel.adjustsFontSizeToFitWidth = YES;
        xLabel.textAlignment = NSTextAlignmentCenter;
        xLabel.text          = title;
        [self.xAxleView addSubview:xLabel];
    }
    UILabel *lastLabel;
    
    for (UILabel *label in self.xAxleView.subviews) {
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastLabel) {
                make.left.mas_equalTo(lastLabel.mas_right);
            }else {
                make.left.mas_equalTo(0);
            }
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(self.chartView).dividedBy(self.cellArrayM.count);
        }];
        lastLabel            = label;
    }
}

-(void)setXShowArrayM:(NSMutableArray *)xShowArrayM {
    _xShowArrayM = xShowArrayM;
    for (int i = 0; i< xShowArrayM.count; i++) {
        for (UILabel *label in self.xAxleView.subviews) {
            if ([label.text isEqualToString:xShowArrayM[i]]) {
                label.hidden = NO;
            }
        }
    }
}

@end
