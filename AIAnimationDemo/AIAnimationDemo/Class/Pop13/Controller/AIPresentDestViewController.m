//
//  AIPresentDestViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/17.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPresentDestViewController.h"

@interface AIPresentDestViewController ()

@property(nonatomic,weak)UIButton *btn;
@end

@implementation AIPresentDestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.cornerRadius = 8.f;
    self.view.backgroundColor    = [UIColor redColor];//[UIColor colorWithRed:52 green:152 blue:219 alpha:1];
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn       = btn;
    
    [btn setTitle:@"dissmis" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(onClickBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
}

-(void)onClickBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.btn.frame      = self.view.bounds;
}

@end
