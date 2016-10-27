//
//  AIPictureViewerViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  防QQ图片浏览

#import "AIPictureViewerViewController.h"
#import "AIPictureViewer.h"
@interface AIPictureViewerViewController ()<AIPictureViewerDelegate>
/** uiimageview*/
@property(nonatomic,strong)UIImageView *imageV;
@end

@implementation AIPictureViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 150, 200)];
    [self.view addSubview:self.imageV];
    AIPictureViewer *pictureV = [[AIPictureViewer alloc]init];
    pictureV.delegate         = self;
    [self.view addSubview:pictureV];
}

#pragma mark -AIPictureViewerDelegate
-(void)pictureViewer:(AIPictureViewer *)pictureViewer didGestureSelectedImage:(UIImage *)image{
    self.imageV.image = image;
}


@end
