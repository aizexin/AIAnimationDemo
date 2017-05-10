//
//  AIDownloadButtonViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/5/8.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDownloadButtonViewController.h"
#import "AIDownloadButton.h"
@interface AIDownloadButtonViewController ()
@property (weak, nonatomic) IBOutlet AIDownloadButton *downLoadButton;

@end

@implementation AIDownloadButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.downLoadButton setBlock:^{
        AILog(@"2222");
    }];
    
}




@end
