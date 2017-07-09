//
//  AIFoldViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/2.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIFoldViewController.h"
#import "AIFoldContainerView.h"
@interface AIFoldViewController ()

@property(nonatomic,weak)AIFoldContainerView *foldContainerView;
@end

@implementation AIFoldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //测试底部view 测试折叠容器高度变化
    UIButton *testButton                       = [UIButton buttonWithType:(UIButtonTypeCustom)];
    testButton.titleLabel.font                 = [UIFont fontWithName:@"ArialRoundedMTBold" size:100];
    testButton.titleLabel.textAlignment        = NSTextAlignmentCenter;
    testButton.backgroundColor                 = [UIColor colorWithRandomFlatColorOfShadeStyle:(UIShadeStyleDark)];
    [testButton addTarget:self action:@selector(onClickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [testButton setTitle:@"↑" forState:(UIControlStateNormal)];
    [testButton setTitle:@"↓" forState:(UIControlStateSelected)];
    [testButton setTitleColor:[UIColor flatWhiteColor] forState:(UIControlStateNormal)];
    [self.view addSubview:testButton];

    
    //容器
    AIFoldContainerView *foldContainerView  = [[AIFoldContainerView alloc]init];
    self.foldContainerView                  = foldContainerView;
    foldContainerView.itemCount             = 3;
    foldContainerView.itemWidth             = 100;
    foldContainerView.itemHeight            = 100;
    AIWeakSelf;
    [foldContainerView setItemfinshBlock:^ (NSTimeInterval duration,AIFoldContainerViewState state){
        [UIView animateWithDuration:.5 animations:^{
            [weakSelf.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            if (state == AIFoldContainerViewState_unFolding ||
                state == AIFoldContainerViewState_finshFold) {
                testButton.selected = YES;
            }else {
                testButton.selected = NO;
            }
        }];
    }];
    [self.view addSubview:foldContainerView];
    
    UILabel *lastLabel                      = nil;
    
    for (int i = 0 ; i < 3; i++) {
        
        UILabel *label                          = [[UILabel alloc]init];
        label.textAlignment                     = NSTextAlignmentCenter;
        label.text                              = [NSString stringWithFormat:@"%d",i];
        label.font                              = [UIFont fontWithName:@"ArialRoundedMTBold" size:100];
        label.textColor                         = [UIColor flatWhiteColor];
        label.backgroundColor                   = [UIColor colorWithRandomFlatColorOfShadeStyle:(UIShadeStyleDark)];
        [foldContainerView.contentView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(100);
            if (lastLabel) {
                make.top.mas_equalTo(lastLabel.mas_bottom);
            }else {
                make.top.mas_equalTo(0);
            }
            make.height.mas_equalTo(100);
        }];
        lastLabel                               = label;
    }
    
    [foldContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(lastLabel.mas_width);
        make.top.mas_equalTo(AINavgationBarH);
        make.bottom.mas_equalTo(lastLabel.mas_bottom);
    }];
    //配置折叠元素
    [foldContainerView configurationFoldItem];
    
    //测试按钮的适配
    [testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(foldContainerView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.centerX.mas_equalTo(foldContainerView.mas_centerX);
    }];
}

#pragma mark -Action
- (void)onClickBtn:(UIButton*)button {
    if (!button.isSelected) {
        //开始折叠
        [self.foldContainerView showFold];
    } else {
        
        [self.foldContainerView showunFold];
    }
}



@end
