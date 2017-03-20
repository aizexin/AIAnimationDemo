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
#import "AIGradientLayerNavgationDelegate.h"
#import "AIHerbDetailViewController.h"
@interface AIBeginnerCookViewController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *listView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
/** 列表数据*/
@property(nonatomic,strong)NSMutableArray *herbs;
/** 被选中的图片*/
@property(nonatomic,weak)UIImageView *selectedImageView;
/** 转场动画*/
@property(nonatomic,strong)AIPopAnimator *transition;

@end

@implementation AIBeginnerCookViewController

-(AIPopAnimator *)transition {
    if (!_transition) {
        _transition = [[AIPopAnimator alloc]init];
    }
    return _transition;
}

- (instancetype)init {
    self = [[NSBundle mainBundle]loadNibNamed:@"AIBeginnerCookViewController" owner:nil options:nil].firstObject;
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
    typeof(self)weakSelf = self;
    self.transition.dismissComletion = ^{
        weakSelf.selectedImageView.hidden = NO;
    };
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.listView.subviews.count < self.herbs.count) {
        [self.listView viewWithTag:1000];
        [self setUpList];
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)setUpList {
    for (int i = 0; i < self.herbs.count; i++) {
        AIHerbModel *model      = self.herbs[i];
        UIImageView *imageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:model.image]];
        imageView.tag           = i+123456;
        imageView.contentMode   = UIViewContentModeScaleAspectFill;
        imageView.userInteractionEnabled    = YES;
        imageView.layer.cornerRadius        = 20.;
        imageView.layer.masksToBounds       = YES;
        [self.listView addSubview:imageView];
        
        UITapGestureRecognizer *tap         = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapImageView:)];
        [imageView addGestureRecognizer:tap];
    }
    [self positionListItem];
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
-(void)didTapImageView:(UITapGestureRecognizer*)tap {
    self.selectedImageView      = (UIImageView*)tap.view;
    NSInteger index             = tap.view.tag - 123456;
    AIHerbModel *selectedHerbModel              = self.herbs[index];
    
    AIHerbDetailViewController   *herbDetailVC  = [[AIHerbDetailViewController alloc]initWithNibName:@"AIHerbDetailViewController" bundle:nil];
    herbDetailVC.herbModel                      = selectedHerbModel;
    herbDetailVC.transitioningDelegate          = self;
    [self presentViewController:herbDetailVC animated:YES completion:nil];
    
}

#pragma mark -UIViewControllerTransitioningDelegat

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    //坐标转换
    self.transition.originFrame = [self.selectedImageView.superview convertRect:_selectedImageView.frame toView:self.view];
    self.transition.presenting    = YES;
    self.selectedImageView.hidden = YES;
    return self.transition;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transition.presenting    = NO;
    return self.transition;
}



@end
