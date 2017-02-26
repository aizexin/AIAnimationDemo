//
//  AIBeginnerCookViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/18.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIBeginnerCookViewController.h"
#import "AIHerbModel.h"
@interface AIBeginnerCookViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *listView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
/** 列表数据*/
@property(nonatomic,strong)NSMutableArray *herbs;

@end

@implementation AIBeginnerCookViewController

- (instancetype)init {
    self = [[NSBundle mainBundle]loadNibNamed:@"AIBeginnerCookViewController" owner:nil options:nil].lastObject;
    if (self) {
        
    }
    return self;
}
-(NSMutableArray *)herbs {
    if (!_herbs) {
        _herbs   = [NSMutableArray arrayWithArray:[[AIHerbModel alloc]all]];
    }
    return _herbs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
}



@end
