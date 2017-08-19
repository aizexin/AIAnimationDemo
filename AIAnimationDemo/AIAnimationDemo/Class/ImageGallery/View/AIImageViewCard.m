//
//  AIImageViewCard.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/13.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIImageViewCard.h"

@implementation AIImageViewCard
- (instancetype)initWithImageNamed:(NSString *)imageNamed title:(NSString*)name;
{
    self = [super init];
    if (self) {
        self.image         = [UIImage imageNamed:imageNamed];
        self.contentMode   = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        _title             = name;
        
        self.layer.shouldRasterize     = YES;
        self.layer.rasterizationScale  = [UIScreen mainScreen].scale;
    }
    return self;
}

-(void)didMoveToSuperview {
    [super didMoveToSuperview];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapHandler:)]]
    ;
}
- (void)didTapHandler:(UITapGestureRecognizer*)tap {
    if (self.didSelectBlock) {
        self.didSelectBlock(self);
    }
}

@end
