//
//  AIAutoTextViewViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/21.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
// 自动适应高度的textview

#import "AIAutoTextViewViewController.h"
#import "AITextView.h"
@interface AIAutoTextViewViewController ()
@property(nonatomic,weak)AITextView *textView;
@end

@implementation AIAutoTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AITextView *textView  = [[AITextView alloc]init];
    textView.backgroundColor = [UIColor redColor];
    textView.placeholder  = @"请输入文字";
    [self.view addSubview:textView];
//    textView.frame        = CGRectMake(0, KHeight - 30, KWidth, 30);
     [textView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.left.mas_equalTo(0);
         make.height.mas_equalTo(30);
         make.bottom.mas_equalTo(0);
     }];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
