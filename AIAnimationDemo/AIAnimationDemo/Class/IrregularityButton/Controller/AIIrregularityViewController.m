//
//  AIIrregularityViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/19.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIIrregularityViewController.h"
#import "AIIrregularityView.h"

@interface AIIrregularityViewController ()

@end

@implementation AIIrregularityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AIIrregularityView *pentagramView   = [[AIIrregularityView alloc]init];
    pentagramView.frame                 = CGRectMake(100, 200, 100, 100);
    pentagramView.shapePath             = [self getPentagramPath];
    pentagramView.image                 = [UIImage imageNamed:@"default"];
    [pentagramView addTarget:self action:@selector(onclick) forControlEvents:(UIControlEventTouchDown)];
    [self.view addSubview:pentagramView];
    //2
    AIIrregularityView *pentagramView2   = [[AIIrregularityView alloc]init];
    pentagramView2.frame                 = CGRectMake(150, 200, 100, 100);
    pentagramView2.backgroundColor       = [UIColor orangeColor];
    pentagramView2.shapePath             = [self getPentagramPath];
    [pentagramView2 addTarget:self action:@selector(onclick2) forControlEvents:(UIControlEventTouchDown)];
    [self.view addSubview:pentagramView2];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

/**
 五角星

 @return 路径
 */
- (UIBezierPath *)getPentagramPath{
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(78.62, 96.78)];
    [bezierPath addLineToPoint: CGPointMake(78.53, 96.73)];
    [bezierPath addLineToPoint: CGPointMake(49.82, 80.92)];
    [bezierPath addLineToPoint: CGPointMake(21.02, 96.78)];
    [bezierPath addLineToPoint: CGPointMake(26.52, 63.21)];
    [bezierPath addLineToPoint: CGPointMake(3.3, 39.51)];
    [bezierPath addLineToPoint: CGPointMake(35.39, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(49.82, 4.01)];
    [bezierPath addLineToPoint: CGPointMake(49.87, 4.11)];
    [bezierPath addLineToPoint: CGPointMake(64.25, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(96.34, 39.51)];
    [bezierPath addLineToPoint: CGPointMake(96.27, 39.58)];
    [bezierPath addLineToPoint: CGPointMake(73.12, 63.21)];
    [bezierPath addLineToPoint: CGPointMake(78.62, 96.78)];
    [bezierPath closePath];
    bezierPath.usesEvenOddFillRule = YES;
    
    [bezierPath fill];
    return bezierPath;
}
- (void)onclick {
    AILog(@"-----11111");
}
- (void)onclick2 {
    AILog(@"-----222222");
}




@end
