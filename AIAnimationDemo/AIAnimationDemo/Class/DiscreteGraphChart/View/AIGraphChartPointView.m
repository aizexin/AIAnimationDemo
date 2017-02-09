//
//  AIGraphChartPointView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/9.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIGraphChartPointView.h"

@interface AIGraphChartPointView ()


/**
 提示
 */
@property(nonatomic,weak)UILabel *titleLabel;
/** 圆圈*/
@property(nonatomic,weak)UIView *pointView;
@end

@implementation AIGraphChartPointView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //提示
        UILabel *titleLabel                  = [[UILabel alloc]init];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel                      = titleLabel;
        [self addSubview:titleLabel];
        //圆
        UIView *pointView                    = [[UIView alloc]init];
        pointView.backgroundColor            = [UIColor whiteColor];
        pointView.layer.borderWidth          = 2;
        pointView.layer.borderColor          = [UIColor orangeColor].CGColor;
        pointView.layer.cornerRadius         = 5;
        pointView.layer.masksToBounds        = YES;
        self.pointView                       = pointView;
        [self addSubview:pointView];
        
        [self fitUI];
    }
    return self;
}

- (void)fitUI {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.mas_equalTo(0);
    }];
    [self.pointView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
}

@end
