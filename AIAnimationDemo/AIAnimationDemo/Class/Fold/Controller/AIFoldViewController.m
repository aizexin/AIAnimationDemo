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

@end

@implementation AIFoldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //容器
    AIFoldContainerView *foldContainerView  = [[AIFoldContainerView alloc]init];
    AIWeakSelf;
    [foldContainerView setItemfinshBlock:^ {
        [UIView animateWithDuration:0.3 animations:^{
            [weakSelf.view layoutIfNeeded];
        }];
    }];
    foldContainerView.itemCount             = 3;
    foldContainerView.itemWidth             = KWidth;
    foldContainerView.itemHeight            = 100;
    [self.view addSubview:foldContainerView];
    //1
    UILabel *label                          = [[UILabel alloc]init];
    label.textAlignment                     = NSTextAlignmentCenter;
    label.text                              = @"1";
    label.font                              = [UIFont fontWithName:@"ArialRoundedMTBold" size:100];
    label.textColor                         = [UIColor flatWhiteColor];
    label.backgroundColor                   = [UIColor colorWithRandomFlatColorOfShadeStyle:(UIShadeStyleDark)];
    [foldContainerView.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    [self.view addSubview:foldContainerView];
    //2
    UILabel *label2                          = [[UILabel alloc]init];
    label2.textAlignment                     = NSTextAlignmentCenter;
    label2.text                              = @"2";
    label2.font                              = [UIFont fontWithName:@"ArialRoundedMTBold" size:100];
    label2.textColor                         = [UIColor flatWhiteColor];
    label2.backgroundColor                   = [UIColor colorWithRandomFlatColorOfShadeStyle:(UIShadeStyleDark)];
    [foldContainerView.contentView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.top.mas_equalTo(label.mas_bottom);
        make.height.mas_equalTo(100);
    }];
    [self.view addSubview:foldContainerView];
    //3
    UILabel *label3                          = [[UILabel alloc]init];
    label3.textAlignment                     = NSTextAlignmentCenter;
    label3.text                              = @"3";
    label3.font                              = [UIFont fontWithName:@"ArialRoundedMTBold" size:100];
    label3.textColor                         = [UIColor flatWhiteColor];
    label3.backgroundColor                   = [UIColor colorWithRandomFlatColorOfShadeStyle:(UIShadeStyleDark)];
    [foldContainerView.contentView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.top.mas_equalTo(label2.mas_bottom);
        make.height.mas_equalTo(100);
    }];
    [self.view addSubview:foldContainerView];
    
    [foldContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
//        make.centerY.mas_equalTo(0);
        make.top.mas_equalTo(AINavgationBarH);
        make.bottom.mas_equalTo(label3.mas_bottom);
    }];
    
    //测试底部view 测试折叠容器高度变化
    UILabel *testLabel                        = [[UILabel alloc]init];
    testLabel.font                            = [UIFont fontWithName:@"ArialRoundedMTBold" size:100];
    testLabel.text                            = @"↑";
    testLabel.textAlignment                   = NSTextAlignmentCenter;
    testLabel.textColor                       = [UIColor flatWhiteColor];
    testLabel.backgroundColor                 = [UIColor colorWithRandomFlatColorOfShadeStyle:(UIShadeStyleDark)];
    [self.view addSubview:testLabel];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(foldContainerView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.centerX.mas_equalTo(0);
    }];
    
    //配置折叠元素
    [foldContainerView configurationFoldItem];
    //开始折叠
    [foldContainerView showFold];
}



@end
