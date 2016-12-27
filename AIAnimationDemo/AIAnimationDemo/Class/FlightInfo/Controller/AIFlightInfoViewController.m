//
//  AIFlightInfoViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/27.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIFlightInfoViewController.h"

@interface AIFlightInfoViewController ()

/**
 背景
 */
@property(nonatomic,weak)UIImageView *bgImageView;
@end

@implementation AIFlightInfoViewController

- (instancetype)init
{
    self = [[NSBundle mainBundle]loadNibNamed:@"AIFlightInfoViewController" owner:nil options:nil].lastObject;
    if (self) {
       
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}




@end
