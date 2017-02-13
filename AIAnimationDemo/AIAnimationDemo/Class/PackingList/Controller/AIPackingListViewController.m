//
//  AIPackingListViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/16.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPackingListViewController.h"
#import "AIHorizontalItemListView.h"
#import "AIRefreshView.h"
@interface AIPackingListViewController ()<UITableViewDelegate,UITableViewDataSource,AIHorizontalItemListViewDelegate,UIScrollViewDelegate,AIRefreshViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonMenu;
/** 数据*/
@property(nonatomic,strong)NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeightConstraint;

/**
 菜单是否打开
 */
@property(nonatomic,assign,getter=isMenuOpen)BOOL menuOpen;
/** 横向列表*/
@property(nonatomic,strong)AIHorizontalItemListView *horizontalItemListView;
/** 刷新控件*/
@property(nonatomic,weak)AIRefreshView *refreshView ;
@end

static const CGFloat kRefreshViewHeight = 110.;

@implementation AIPackingListViewController

-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        NSArray *titleArray = @[@"Icecream money", @"Great weather", @"Beach ball", @"Swim suit for him", @"Swim suit for her", @"Beach games", @"Ironing board", @"Cocktail mood", @"Sunglasses", @"Flip flops"];
        for (int i = 0; i < 8; i++) {
            AIPackingModel *model = [[AIPackingModel alloc]init];
            NSString *imageString = [NSString stringWithFormat:@"summericons_100px_0%d",i];
            model.image           = imageString;
            model.title           = titleArray[i];
            [_dataSource addObject:model];
        }
    }
    return _dataSource;
}

-(AIHorizontalItemListView *)horizontalItemListView {
    if (!_horizontalItemListView) {
        _horizontalItemListView          = [[AIHorizontalItemListView alloc]init];
        _horizontalItemListView.delegate = self;
    }
    return _horizontalItemListView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:0. green:154/255. blue:222/255. alpha:1.];
    CGRect refreshRect          = CGRectMake(0, -kRefreshViewHeight, KWidth, kRefreshViewHeight);
    AIRefreshView *refreshView  = [[AIRefreshView alloc]initWithFrame:refreshRect scrollView:self.tableView];
    refreshView.delegate        = self;
    self.refreshView            = refreshView;
    [self.tableView addSubview:refreshView];
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
    //添加列表
    if (self.isMenuOpen) {
        [self.titleLabel.superview addSubview:self.horizontalItemListView];

        [self.horizontalItemListView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(60);
        }];
        
        
    }else {
        [self.horizontalItemListView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0);
        }];
//        [self.horizontalItemListView removeFromSuperview];
    }
    //按钮
    CGFloat angle = self.isMenuOpen ? M_PI_4:0;
    self.buttonMenu.transform = CGAffineTransformMakeRotation(angle);
    //高度
    self.menuHeightConstraint.constant = self.isMenuOpen ? 150.0 : 60.0;
    self.titleLabel.text = self.isMenuOpen? @"Select Item":@"Packing List";
    [UIView animateWithDuration:1. delay:0. usingSpringWithDamping:.4 initialSpringVelocity:5. options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        if (self.isMenuOpen) {
            for (NSLayoutConstraint *constraint in self.horizontalItemListView.constraints) {
                constraint.active = YES;
            }
        }
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
}
#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell              = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Cell"];
    }
    AIPackingModel *model = self.dataSource[indexPath.item];
    cell.imageView.image  = [UIImage imageNamed:model.image];
    cell.textLabel.text   = model.title;
    return cell;
}
#pragma mark -AIHorizontalItemListViewDelegat
-(void)horizontalItemListView:(AIHorizontalItemListView *)listView didSelectedModel:(AIPackingModel *)model {
    [self.dataSource addObject:model];
    [self.tableView reloadData];
}
#pragma mark -UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.refreshView scrollViewDidScroll:scrollView];
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self.refreshView scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}
#pragma mark -AIRefreshViewDelegate
-(void)refreshViewDidRefresh:(AIRefreshView *)refreshView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshView endRefreshing];
    });
}

@end
