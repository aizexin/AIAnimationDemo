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

/**
 被选中事件
 */
-(void)selecrEvent;

/**
 初始化方法

 @param tableView 在哪个tableView上

 @return cell
 */
+(instancetype)createCellWithTabelView:(UITableView*)tableView;
@end
