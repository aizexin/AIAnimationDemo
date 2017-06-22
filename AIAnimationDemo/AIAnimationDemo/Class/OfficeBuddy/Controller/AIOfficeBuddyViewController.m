//
//  AIOfficeBuddyViewController.m
//  AIAnimationDemo
//
//  Created by Ken on 2017/5/19.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIOfficeBuddyViewController.h"
#import "AIMenuButton.h"

#import "AIContainerViewController.h"
@interface AIOfficeBuddyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *symbol;


@property(nonatomic,strong)AIMenuButton *menuButton;
@end

@implementation AIOfficeBuddyViewController

//-(AIMenuItem *)menuItem {
//    if (!_menuItem) {
//        _menuItem   =   [[AIMenuItem alloc]init];
//        self.title  =   _menuItem.title;
//    }
//    return _menuItem;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor   = [UIColor flatRedColor];
    AIMenuButton *MenuButton    = [[AIMenuButton alloc]init];
    MenuButton.tapHandler       = ^{
        AIContainerViewController *containerVC  = (AIContainerViewController*)self.navigationController.parentViewController ;
        if (containerVC) {
            [containerVC toggleSideMenu];
        }
    };
    self.navigationItem.leftBarButtonItem       = [[UIBarButtonItem alloc]initWithCustomView:MenuButton];
    self.menuItem                               = [[AIMenuItem shareItems].shareMenuItems firstObject];
    
     self.navigationItem.rightBarButtonItem             = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(onClickBack)];
    self.navigationController.navigationBar.tintColor   = [UIColor flatWhiteColor];
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
