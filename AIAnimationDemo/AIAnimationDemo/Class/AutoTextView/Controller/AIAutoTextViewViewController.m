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
    
    /*因为textView内部会跟新父类高度约束，
     所以必须要有个父控件不能直接加在self.view,
     而且父控件必须以autolayout的方式布局*/
    //    toolbarView.frame     = CGRectMake(0, KHeight - 30, KWidth, 30);
    UIView *toolbarView           = [[UIView alloc]init];
    toolbarView.layer.borderWidth = 1.;
    toolbarView.layer.borderColor = [UIColor flatBlackColor].CGColor;
    [self.view addSubview:toolbarView];
    [toolbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    AITextView *textView  = [[AITextView alloc]init];
//    textView.font         = [UIFont systemFontOfSize:14];
    textView.placeholder  = @"请输入文字";
    [toolbarView addSubview:textView];
     [textView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.left.mas_equalTo(0);
         make.top.mas_equalTo(0);
         make.bottom.mas_equalTo(0);
     }];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
