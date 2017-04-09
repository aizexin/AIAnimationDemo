//
//  AIHerbDetailViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/5.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIHerbDetailViewController.h"

@interface AIHerbDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *LicenseButton;
@property (weak, nonatomic) IBOutlet UIButton *authorButton;

@end

@implementation AIHerbDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionClLose:)];
    [self.view addGestureRecognizer:tap];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.bgImageView.image = [UIImage imageNamed:self.herbModel.image];
    self.titleLabel.text   = self.herbModel.name;
    self.descriptionTextView.text = self.herbModel.descriptionString;
}

#pragma mark -action 
- (void)actionClLose:(UITapGestureRecognizer*)tap {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
