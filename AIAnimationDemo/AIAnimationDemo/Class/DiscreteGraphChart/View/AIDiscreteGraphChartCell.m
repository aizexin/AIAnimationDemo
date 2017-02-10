//
//  AIDiscreteGraphChartCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/9.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDiscreteGraphChartCell.h"
#import "AIGraphChartPointView.h"
@interface AIDiscreteGraphChartCell ()




@end

@implementation AIDiscreteGraphChartCell

#pragma mark -public
-(void)setPointsArrayM:(NSMutableArray *)pointsArrayM {
    _pointsArrayM = pointsArrayM;
    for (AIDiscretePointModel *itemModel in pointsArrayM) {
        AIGraphChartPointView *pointView = [[AIGraphChartPointView alloc]init];
        [self addSubview:pointView];
//        CGFloat yValue    = self.bounds.size.height * ([itemModel.yValue floatValue]/_maxValue);
        [pointView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(0);
            make.height.mas_equalTo(20);
//            make.bottom.mas_equalTo(self.mas_height).multipliedBy([itemModel.yValue floatValue]/_maxValue);
            make.bottom.mas_equalTo(30);
        }];
    }
}

@end
