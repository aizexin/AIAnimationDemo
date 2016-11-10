//
//  AISettingTableViewCell.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/10.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AISettingTableViewCell : UITableViewCell
/** 图标 */
@property (weak,nonatomic)UIImageView *iconImageView;
/** 标签label */
@property (weak,nonatomic)UILabel *tipsLabel;

+(instancetype)createTableViewCellWithTableView:(UITableView *)tableView;
@end
