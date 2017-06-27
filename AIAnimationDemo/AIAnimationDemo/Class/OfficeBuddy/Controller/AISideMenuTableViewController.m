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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
