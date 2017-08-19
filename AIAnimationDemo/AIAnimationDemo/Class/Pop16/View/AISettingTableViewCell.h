//
//  AISettingTableViewCell.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/10.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AISettingCellAdapterProtocol.h"

@interface AISettingTableViewCell : UITableViewCell

/** 实现了AISettingCellAdapterProtocol 协议的数据*/
@property(nonatomic,strong)id<AISettingCellAdapterProtocol> data;


/**
 创建cell

 @param tableView 通过哪个tableView

 @return 实例
 */
+(instancetype)createTableViewCellWithTableView:(UITableView *)tableView;
@end
