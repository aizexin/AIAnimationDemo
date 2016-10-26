//
//  AIPictureViewerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  防QQ图片浏览

#import "AIPictureViewerViewController.h"
#import "AIPictureViewer.h"
@interface AIPictureViewerViewController ()

@end

@implementation AIPictureViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AIPictureViewer *pictureV = [[AIPictureViewer alloc]init];
    [self.view addSubview:pictureV];
}



@end
