//
//  AITapTableViewCell.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AITapModel.h"
@interface AITapTableViewCell : UITableViewCell

/** 接收数据*/
@property(nonatomic,strong)AITapModel *tapModel;

+(instancetype)createCellWithTabelView:(UITableView*)tableView;
@end
