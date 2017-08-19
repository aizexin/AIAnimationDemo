//
//  AIPlayMusicViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPlayMusicViewController.h"
#import "AIPlayMusicView.h"

@interface AIPlayMusicViewController ()

@end

@implementation AIPlayMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AIPlayMusicView *playMusicView = [AIPlayMusicView sharePlayMusicView];
    playMusicView.bgImage          = [UIImage imageNamed:@"default"];
    [self.view addSubview:playMusicView];
    [playMusicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-14);
        make.bottom.mas_equalTo(-59);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
}



@end
