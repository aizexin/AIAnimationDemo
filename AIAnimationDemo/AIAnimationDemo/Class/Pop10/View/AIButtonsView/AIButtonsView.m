//
//  AIButtonsView.m
//  按钮viewDemo
//
//  Created by 艾泽鑫 on 16/9/22.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIButtonsView.h"
#import "OCKCareCardButton.h"
#define AIBtnMaxCols(photosCount) ((photosCount==4)?2:3)
//边距
#define AIBtnMargin 8
//最大个数
#define AIBtnMaxCount 9
// 随机色
#define AIRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
static const CGFloat ButtonSize = 30.0;
@interface AIButtonsView ()
/** 一行的最多个数*/
@property(nonatomic,assign)NSInteger oneLineMaxCount;
@end
@implementation AIButtonsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.selectedCount = 0;
        //预先添加12个控件
        for (int i = 0; i < AIBtnMaxCount; i++) {
            OCKCareCardButton *btn = [[OCKCareCardButton alloc]init];
            [btn addTarget:self action:@selector(onClickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:btn];
        }
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    int maxCols = AIBtnMaxCols(self.btnCount);
    for (int i = 0; i<self.btnCount; i++) {
        OCKCareCardButton *btn = (OCKCareCardButton*)self.subviews[i];
        CGFloat btnViewX = (i % maxCols) * (ButtonSize + AIBtnMargin);
        CGFloat btnViewY = (i / maxCols) * (ButtonSize + AIBtnMargin);
        CGFloat btnViewW = ButtonSize;
        CGFloat btnViewH = ButtonSize;
        btn.frame = CGRectMake(btnViewX, btnViewY, btnViewW, btnViewH);
    }
}

#pragma mark ----onClickBtn
-(void)onClickBtn:(OCKCareCardButton*)btn{
    btn.selected = !btn.isSelected;
    btn.isSelected ? self.selectedCount++ :self.selectedCount--;
}

+(CGSize)sizeWithBtnCount:(NSInteger)btnCount{
    // 一行最多几列
    int maxCols = AIBtnMaxCols(btnCount);
    //总的列数
    NSInteger totalCols = btnCount > maxCols ? maxCols :btnCount;
    //总的行数
    NSInteger totalRows = (btnCount + maxCols - 1)/maxCols;
    CGFloat photoW = totalCols * (ButtonSize + AIBtnMargin);
    CGFloat photoH = totalRows * (ButtonSize + AIBtnMargin);
    return CGSizeMake(photoW,photoH);
}
@end
