//
//  AISlideToRevealViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/23.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AISlideToRevealViewController.h"

@interface AISlideToRevealViewController ()

@end

@implementation AISlideToRevealViewController
- (instancetype)init {
    self = [[NSBundle mainBundle]loadNibNamed:@"AISlideToRevealViewController" owner:nil options:nil].lastObject;
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    

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
