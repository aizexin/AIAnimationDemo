//
//  AIOfficeBuddyViewController.m
//  AIAnimationDemo
//
//  Created by Ken on 2017/5/19.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIOfficeBuddyViewController.h"
#import "AIMenuButton.h"
#import "AIMenuItem.h"
@interface AIOfficeBuddyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *symbol;

/** 按钮*/
@property(nonatomic,strong)AIMenuItem *menuItem;
@end

@implementation AIOfficeBuddyViewController

-(AIMenuItem *)menuItem {
    if (!_menuItem) {
        _menuItem   =   [[AIMenuItem alloc]init];
        self.title  =   _menuItem.title;
    }
    return _menuItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    AIMenuButton *MenuButton    = [[AIMenuButton alloc]init];
    MenuButton.tapHandler = ^{
        
    };
    
}



@end
