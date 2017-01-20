//
//  AIPackingCollectionViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/20.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPackingCollectionViewCell.h"

@interface AIPackingCollectionViewCell ()
@property(nonatomic,weak)UIImageView *imageView;
@end

@implementation AIPackingCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]init];
        self.imageView         = imageView;
        [self.contentView addSubview:imageView];
        [self fitUI];
    }
    return self;
}

- (void)fitUI {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.mas_equalTo(0);
    }];
}
-(void)setImageString:(NSString *)imageString {
    _imageString         = imageString;
    self.imageView.image = [UIImage imageNamed:_imageString];
}

@end
