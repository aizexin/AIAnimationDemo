//
//  AIListTableViewCell.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIListModel.h"
@interface AIListTableViewCell : UITableViewCell

/** 数据源*/
@property(nonatomic,strong)AIListModel *model;
@property(nonatomic,assign)NSIndexPath *indexPath;
+(instancetype)createTableViewCellWithTableView:(UITableView *)tableView;
@end
