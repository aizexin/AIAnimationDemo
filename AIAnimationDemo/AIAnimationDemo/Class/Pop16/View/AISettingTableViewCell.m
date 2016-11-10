//
//  AISettingTableViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/10.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AISettingTableViewCell.h"
#import "UIColor+AIExtension.h"

@interface AISettingTableViewCell ()
///** 图标 */
//@property (weak,nonatomic)UIImageView *iconImageView;
///** 标签label */
//@property (weak,nonatomic)UILabel *tipsLabel;
/** 分割线 */
@property (weak,nonatomic)UIView *lineView;
@end

@implementation AISettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self                   = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //图片
    UIImageView *imageView = [[UIImageView alloc]init];
    self.iconImageView     = imageView;
    [self.contentView addSubview:imageView];
    //label
    UILabel *label         = [[UILabel alloc]init];
    label.textColor        = [UIColor colorWithHexString:@"#353535"];
    label.font             = [UIFont systemFontOfSize:14];
    self.tipsLabel         = label;
    [self.contentView addSubview:label];
    //分割线
    UIView *lineView         = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    self.lineView            = lineView;
    [self.contentView addSubview:lineView];
    
    [self fitUI];
    return self;
}
-(void)fitUI{
    //图标
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(20));
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(@(30));
        make.height.mas_equalTo(self.iconImageView.mas_width);
    }];
    //label
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset = 6;
        make.right.mas_equalTo(@0);
    }];
    //lineView
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset = 8;
        make.right.mas_equalTo(@-8);
        make.height.mas_equalTo(@1);
        make.bottom.mas_equalTo(@0);
    }];
}


+(instancetype)createTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *identifier  = @"systemSetCell";
    AISettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell                     = \
        [[AISettingTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}



@end
