//
//  AIPlayMusicView.m
//  AISchoolDiscipline
//
//  Created by 艾泽鑫 on 2016/12/21.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPlayMusicView.h"
#import "InfiniteRotationView.h"

@interface AIPlayMusicView ()
/**
 背景图
 */
@property(nonatomic,weak)UIImageView *bgImageView;
/** 前景图*/
@property(nonatomic,weak)UIButton *foregroundBtn;
/** 旋转层*/
@property(nonatomic,weak)InfiniteRotationView *rotationView;
/** 阴影*/
@property(nonatomic,strong)CALayer *shadowLayer;
/** 容器*/
@property(nonatomic,weak)UIView *contentView;
@end
@implementation AIPlayMusicView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //容器
        UIView *contentView                = [[UIView alloc]init];
        contentView.backgroundColor        = [UIColor orangeColor];
        self.contentView                   = contentView;
        [self addSubview:contentView];
        //阴影
        self.shadowLayer                   = [CALayer layer];
        self.shadowLayer.shadowColor       = [UIColor blackColor].CGColor;
        self.shadowLayer.shadowOffset      = CGSizeMake(8., 8.);
        self.shadowLayer.shadowOpacity     = .75;
        //旋转层
        InfiniteRotationView *rotationView = [[InfiniteRotationView alloc]init];
        self.rotationView                  = rotationView;
        [self.contentView addSubview:rotationView];
        //背景
        UIImageView *bgImageView           = [[UIImageView alloc]init];
        self.bgImageView                   = bgImageView;
        [rotationView addSubview:bgImageView];
        //前景
        UIButton *foregroundBtn      = [[UIButton alloc]init];
        self.foregroundBtn           = foregroundBtn;
        [foregroundBtn addTarget:self action:@selector(onClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [foregroundBtn setImage:[UIImage imageNamed:@"play_2"] forState:(UIControlStateNormal)];
        [foregroundBtn setImage:[UIImage imageNamed:@"pause"] forState:(UIControlStateSelected)];
        [self.contentView addSubview:foregroundBtn];
        //添加手势
        UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [self.contentView addGestureRecognizer:tap];
        [self fitUI];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.layer.cornerRadius  = self.bounds.size.width * .5;
    self.contentView.layer.masksToBounds = YES;
    self.shadowLayer.shadowPath        = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
}
-(void)didMoveToWindow {
    [super didMoveToWindow];
    [self.layer insertSublayer:self.shadowLayer below:self.contentView.layer];
}


- (void)fitUI {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.mas_equalTo(0);
    }];
    [self.rotationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.mas_equalTo(0);
    }];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.mas_equalTo(0);
    }];
    [self.foregroundBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
}
#pragma mark --Action
- (void)onClick:(UIButton*)btn {
    btn.selected = !btn.isSelected;
    if (btn.isSelected) {
        [self start];
    } else {
        [self stop];
    }
}
- (void)tap {
    AILog(@"圆盘被点击了");
}

#pragma mark --public

-(void)setBgImage:(UIImage *)bgImage {
    _bgImage               = bgImage;
    self.bgImageView.image = bgImage;
}

- (void)start {
    [self.rotationView startRotateAnimation];
}
- (void)stop {
    [self.rotationView reset];
}
+(instancetype)sharePlayMusicView {
    static AIPlayMusicView *playMusicView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playMusicView = [[self alloc]init];
    });
    return playMusicView;
}

@end
