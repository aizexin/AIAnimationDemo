//
//  AITextFiled.m
//  RJStreetLamp
//
//  Created by 艾泽鑫 on 16/3/3.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITextFiled.h"

@implementation AITextFiled

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentVerticalAlignment:(UIControlContentVerticalAlignmentCenter)];
        self.layer.cornerRadius  = 8;
        self.backgroundColor     = AIColor(240, 240, 240);
        self.font                = [UIFont systemFontOfSize:14];
        UIView *leftView         = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        leftView.backgroundColor = [UIColor clearColor];
        self.leftView = leftView;
        [self setLeftViewMode:(UITextFieldViewModeAlways)];
    }
    return self;
}
/**
 *  子控件改变的时候调用
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    self.leftView.frame = CGRectMake(0, 0, 10, self.frame.size.height);
}

@end
