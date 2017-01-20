//
//  AIPackingListViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/16.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPackingListViewController.h"
#import "AIHorizontalItemListView.h"
@interface AIPackingListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonMenu;
/** 数据*/
@property(nonatomic,strong)NSArray *titleArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeightConstraint;

/**
 菜单是否打开
 */
@property(nonatomic,assign,getter=isMenuOpen)BOOL menuOpen;
/** 横向列表*/
@property(nonatomic,strong)AIHorizontalItemListView *horizontalItemListView;
@end

@implementation AIPackingListViewController

-(AIHorizontalItemListView *)horizontalItemListView {
    if (!_horizontalItemListView) {
        _horizontalItemListView = [[AIHorizontalItemListView alloc]init];
    }
    return _horizontalItemListView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray = @[@"Icecream money", @"Great weather", @"Beach ball", @"Swim suit for him", @"Swim suit for her", @"Beach games", @"Ironing board", @"Cocktail mood", @"Sunglasses", @"Flip flops"];
//    self.titleArray     = titleArray;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (IBAction)onClickMenu:(id)sender {
    self.menuOpen = !self.isMenuOpen;
    //label
    [self.titleLabel.superview.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
        if (constraint.firstItem == self.titleLabel && constraint.firstAttribute == NSLayoutAttributeCenterX) {
            constraint.constant = self.isMenuOpen ? -100:0;
        }
        if ([constraint.identifier isEqualToString:@"TitleCenterY"]) {
            constraint.active   = NO;
            //add new constraint
            NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                             attribute:(NSLayoutAttributeCenterY)
                                                                             relatedBy:(NSLayoutRelationEqual)
                                                                                toItem:self.titleLabel.superview
                                                                             attribute:(NSLayoutAttributeCenterY)
                                                                            multiplier:self.isMenuOpen?.67:1.
                                                                              constant:5.];
            newConstraint.identifier = @"TitleCenterY";
            newConstraint.active     = YES;
        }
    }];
    //按钮
    CGFloat angle = self.isMenuOpen ? M_PI_4:0;
    self.buttonMenu.transform = CGAffineTransformMakeRotation(angle);
    //高度
    self.menuHeightConstraint.constant = self.isMenuOpen ? 200.0 : 60.0;
    self.titleLabel.text = self.isMenuOpen? @"Select Item":@"Packing List";
    [UIView animateWithDuration:1. delay:0. usingSpringWithDamping:.4 initialSpringVelocity:5. options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
//    if (self.isMenuOpen) {
//        [self.titleLabel.superview addSubview:self.horizontalItemListView];
//        [self.horizontalItemListView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.mas_equalTo(0);
//            make.bottom.mas_equalTo(0);
//            make.height.mas_equalTo(100);
//        }];
//    }else {
//        [self.horizontalItemListView removeFromSuperview];
//    }
}
#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell              = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Cell"];
    }
    cell.imageView.image  = [UIImage imageNamed:[NSString stringWithFormat:@"summericons_100px_0%ld",indexPath.row]];
    cell.textLabel.text   = self.titleArray[indexPath.row];
    return cell;
}

@end
