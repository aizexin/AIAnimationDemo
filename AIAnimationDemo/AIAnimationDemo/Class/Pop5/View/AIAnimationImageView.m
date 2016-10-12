//
//  AIAnimationImageView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/12.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIAnimationImageView.h"

@interface AIAnimationImageView ()

@property(nonatomic,weak)UIImageView *imageView;
@end

@implementation AIAnimationImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.duration = 0.5;
        self.delay    = 0;
        //图片
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.userInteractionEnabled = YES;
        self.imageView         = imageView;
        imageView.image        = [UIImage imageNamed:@"search_map_btn"];
        [self addSubview:imageView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}
//从大到小
-(void)zoomOut{
    self.type     = CSAnimationTypeZoomOut;
    [self startCanvasAnimation];
}
//从小到大
-(void)zoomIn{
    self.type     = CSAnimationTypeZoomIn;
    [self startCanvasAnimation];
}

@end
