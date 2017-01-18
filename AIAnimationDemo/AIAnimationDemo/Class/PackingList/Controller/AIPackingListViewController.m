//
//  AIPackingListViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/16.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIPackingListViewController.h"

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
@end

@implementation AIPackingListViewController

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
    self.menuHeightConstraint.constant = self.isMenuOpen ? 200.0 : 60.0;
    self.titleLabel.text = self.isMenuOpen? @"Select Item":@"Packing List";
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
