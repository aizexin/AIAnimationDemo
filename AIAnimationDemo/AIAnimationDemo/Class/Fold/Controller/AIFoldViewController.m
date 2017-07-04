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
    [self.view addSubview:foldContainerView];
    //1
    UILabel *label                          = [[UILabel alloc]init];
    label.textAlignment                     = NSTextAlignmentCenter;
    label.text                              = @"1";
    label.font                              = [UIFont fontWithName:@"ArialRoundedMTBold" size:100];
    label.textColor                         = [UIColor flatWhiteColor];
    label.backgroundColor                   = [UIColor randomFlatColor];
    [foldContainerView addSubview:label];
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
    label2.backgroundColor                   = [UIColor randomFlatColor];
    [foldContainerView addSubview:label2];
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
    label3.backgroundColor                   = [UIColor randomFlatColor];
    [foldContainerView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.top.mas_equalTo(label2.mas_bottom);
        make.height.mas_equalTo(100);
    }];
    [self.view addSubview:foldContainerView];
    
    [foldContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.bottom.mas_equalTo(label3.mas_bottom);
    }];
}



@end
