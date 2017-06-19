//
//  AIMenuItem.m
//  AIAnimationDemo
//
//  Created by sober on 2017/5/26.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIMenuButton.h"


@interface AIMenuButton ()

@property(nonatomic,weak)UIImageView *imageView;

@end
@implementation AIMenuButton


-(void)didMoveToSuperview {
    [super didMoveToSuperview];
    self.frame              = CGRectMake(0, 0, 20., 20.);
    UIImageView *imageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu"]];
    self.imageView          = imageView;
    self.imageView.userInteractionEnabled   = YES;
    UITapGestureRecognizer  *tap            = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTap)];
    [self addGestureRecognizer:tap];
}

- (void)didTap {
    if (self.tapHandler) {
        self.tapHandler();
    }
}


@end
