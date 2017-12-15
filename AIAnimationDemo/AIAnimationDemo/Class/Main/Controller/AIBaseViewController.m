//
//  AIBaseViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/13.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  最基础的viewcontroller

#import "AIBaseViewController.h"
#import <KMCGeigerCounter.h>
@interface AIBaseViewController ()

@end

@implementation AIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    //检测是否流畅
//#if TARGET_IPHONE_SIMULATOR
//    [KMCGeigerCounter sharedGeigerCounter].enabled = YES;
//#endif
}
-(void)dealloc {
    AILog(@"%@--dealloc",NSStringFromClass([self class]));
}
/**
 添加返回
 */
- (void)addbackBtn {
    
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:backBtn];
    [backBtn setImage:[UIImage imageNamed:@"navigationBack"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(onClickBack:) forControlEvents:(UIControlEventTouchUpInside)];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.top.mas_equalTo(10 + KStatusBarHeight);
        make.width.height.mas_equalTo(24);
    }];
}


#pragma mark -Action
- (void)onClickBack:(UIButton*)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
