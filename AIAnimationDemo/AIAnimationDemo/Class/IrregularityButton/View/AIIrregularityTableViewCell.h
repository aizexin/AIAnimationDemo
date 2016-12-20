//
//  AIIrregularityTableViewCell.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/19.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIIrregularityTableViewCell : UITableViewCell
@property(nonatomic,assign)NSIndexPath *indexPath;
+(instancetype)createTableViewCellWithTableView:(UITableView *)tableView;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
/** 图片名字*/
@property(nonatomic, copy)NSString *imageName;

@end
