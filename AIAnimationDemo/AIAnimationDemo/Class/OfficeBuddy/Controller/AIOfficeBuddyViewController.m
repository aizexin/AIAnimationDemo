//
//  AIOfficeBuddyViewController.m
//  AIAnimationDemo
//
//  Created by Ken on 2017/5/19.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIOfficeBuddyViewController.h"
#import "AIContainerViewController.h"

@interface AIOfficeBuddyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *symbol;

@end

@implementation AIOfficeBuddyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor   = [UIColor flatBlackColorDark];
    AIMenuButton *menuButton    = [[AIMenuButton alloc]init];
    self.menuButton             = menuButton;
    menuButton.tapHandler       = ^{
        AIContainerViewController *containerVC  = (AIContainerViewController*)self.navigationController.parentViewController ;
        if (containerVC) {
            [containerVC toggleSideMenu];
        }
    };
    self.navigationItem.leftBarButtonItem       = [[UIBarButtonItem alloc]initWithCustomView:menuButton];
    self.menuItem                               = [[AIMenuItem shareItems].shareMenuItems firstObject];
    
     self.navigationItem.rightBarButtonItem              = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(onClickBack)];
    //设置title 和 item的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor flatWhiteColor]}];
    self.navigationController.navigationBar.tintColor    = [UIColor flatWhiteColor];
    
}
-(void)setMenuItem:(AIMenuItem *)menuItem {
    _menuItem     = menuItem;
    self.title    = menuItem.title;
    self.view.backgroundColor  = menuItem.color;
    self.symbol.text           = menuItem.symbol;
}



- (void)onClickBack {
    [self.parentViewController.navigationController popViewControllerAnimated:YES];
}



@end
