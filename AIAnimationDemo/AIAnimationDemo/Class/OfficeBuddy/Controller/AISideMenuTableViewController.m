//
//  AISideMenuTableViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/6/13.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AISideMenuTableViewController.h"
#import "AIMenuItem.h"
#import "AISildeTableViewCell.h"
#import "AIContainerViewController.h"

@interface AISideMenuTableViewController ()

@end

@implementation AISideMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"AISildeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MenuCell"];
    self.tableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor  = [UIColor flatBlackColorDark];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [AIMenuItem shareItems].shareMenuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell" forIndexPath:indexPath];
    if (!cell) {
        cell              = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"MenuCell"];
    }
    AIMenuItem *item      = [[AIMenuItem shareItems]shareMenuItems][indexPath.row];
    cell.textLabel.backgroundColor      = [UIColor clearColor];
    cell.textLabel.textColor            = [UIColor whiteColor];
    cell.textLabel.font                 = [UIFont fontWithName:@"Helvetica" size:36.0];
    cell.textLabel.text                 = item.symbol;
    cell.contentView.backgroundColor    = item.color;
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85.;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.centerVC.menuItem                   = [AIMenuItem shareItems].shareMenuItems[indexPath.row];
    AIContainerViewController *containerVC   = (AIContainerViewController*)self.parentViewController;
    [containerVC toggleSideMenu];
    
}

@end
