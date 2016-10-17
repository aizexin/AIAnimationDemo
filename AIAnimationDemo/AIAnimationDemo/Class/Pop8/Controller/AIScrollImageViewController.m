//
//  AIScrollImageViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/17.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  scorllView视差效果

#import "AIScrollImageViewController.h"
#import "Math.h"
#import "MoreInfoView.h"
#import "UIView+SetRect.h"
static int viewTag = 0x11;

@interface AIScrollImageViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray       *picturesArray;
@property (nonatomic, strong) UIScrollView  *scrollView;
@property (nonatomic, strong) Math          *onceLinearEquation;
@end

@implementation AIScrollImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MATHPoint pointA;
    MATHPoint pointB;
    pointA = MATHPointMake(0, -50);
    pointB = MATHPointMake(self.view.frame.size.width, 270 - 80);

    self.onceLinearEquation = [Math mathOnceLinearEquationWithPointA:pointA PointB:pointB];
    
    // Init pictures data.
    self.picturesArray = @[[UIImage imageNamed:@"1"],
                           [UIImage imageNamed:@"2"],
                           [UIImage imageNamed:@"3"],
                           [UIImage imageNamed:@"4"],
                           [UIImage imageNamed:@"5"]];
    
    // Init scrollView.
    CGFloat height = self.view.height;
    CGFloat width  = self.view.width;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.delegate                       = self;
    _scrollView.pagingEnabled                  = YES;
    _scrollView.backgroundColor                = [UIColor blackColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces                        = NO;
    _scrollView.contentSize                    = CGSizeMake(self.picturesArray.count * width, height);
    [self.view addSubview:_scrollView];
    
    // Init moreInfoViews.
    for (int i = 0; i < self.picturesArray.count; i++) {
        
        MoreInfoView *show   = [[MoreInfoView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        show.imageView.image = self.picturesArray[i];
        show.tag             = viewTag + i;
        
        [_scrollView addSubview:show];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat X = scrollView.contentOffset.x;
    
    for (int i = 0; i < self.picturesArray.count; i++) {
        
        MoreInfoView *show = [scrollView viewWithTag:viewTag + i];
        show.imageView.x   = _onceLinearEquation.k * (X - i * MainSize.width) + _onceLinearEquation.b;
    }
}




@end
