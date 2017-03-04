//
//  AIBeginnerCookViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/18.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIBeginnerCookViewController.h"
#import "AIHerbModel.h"
#import "AIPopAnimator.h"
@interface AIBeginnerCookViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *listView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
/** 列表数据*/
@property(nonatomic,strong)NSMutableArray *herbs;

@end

//typedef enum : NSUInteger {
//    OrderedAscending = -1,    // < 升序
//    OrderedSame      = 0// = 等于
//    OrderedDescending   // > 降序
//} ComparisonResult;

@implementation AIBeginnerCookViewController

- (instancetype)init {
    self = [[NSBundle mainBundle]loadNibNamed:@"AIBeginnerCookViewController" owner:nil options:nil].lastObject;
    if (self) {
        
    }
    return self;
}
-(NSMutableArray *)herbs {
    if (!_herbs) {
        _herbs   = [NSMutableArray arrayWithArray:[AIHerbModel all]];
    }
    return _herbs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.delegate  = [[AIPopAnimator alloc]init];
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    if (self.listView.subviews.count < self.herbs.count) {
        [self.listView viewWithTag:1000];
        [self setUpList];
//    }
}
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void) setUpList {
    for (int i = 0; i < self.herbs.count; i++) {
        AIHerbModel *model      = self.herbs[i];
        UIImageView *imageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:model.image]];
        imageView.tag           = i+123456;
        imageView.contentMode   = UIViewContentModeScaleAspectFill;
        imageView.userInteractionEnabled    = YES;
        imageView.layer.cornerRadius        = 20.;
        imageView.layer.masksToBounds       = YES;
        [self.listView addSubview:imageView];
        
        UITapGestureRecognizer *tap         = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapImageView)];
        [imageView addGestureRecognizer:tap];
    }
    [self positionListItem];
    self.listView.backgroundColor           = [UIColor clearColor];
}

- (void)positionListItem {
    CGFloat listHeight      = self.listView.ai_height;
    CGFloat itemHeight      = listHeight *1.33;
    CGFloat aspectRatio     = KHeight/KWidth;
    CGFloat itemWith        = itemHeight / aspectRatio;
    
    CGFloat horizontalPadding   = 10.;
    
    for (int i = 0; i < self.herbs.count; i++) {
        UIImageView *imageView  = [self.listView viewWithTag:i+123456];
        imageView.frame         = CGRectMake(i* itemWith+(1+i)*horizontalPadding, 0, itemWith, itemHeight);
    }
    self.listView.contentSize   = CGSizeMake(self.herbs.count * (itemWith+horizontalPadding)+horizontalPadding, 0);
}

#pragma mark -Action 
-(void)didTapImageView {
    
}




@end
