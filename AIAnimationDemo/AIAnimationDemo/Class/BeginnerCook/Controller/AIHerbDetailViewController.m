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
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.bgImageView.image = [UIImage imageNamed:self.herbModel.image];
    self.titleLabel.text   = self.herbModel.name;
    self.descriptionTextView.text = self.herbModel.descriptionString;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)setHerbModel:(AIHerbModel *)herbModel {
    _herbModel = herbModel;
}

@end
